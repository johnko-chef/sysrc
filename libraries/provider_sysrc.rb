#
# Cookbook Name:: sysrc
# Provider:: sysrc
#
# Author:: John Ko <git@johnko.ca>
# Copyright 2014, John Ko
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

class Chef::Provider::Sysrc < Chef::Provider::LWRPBase  
  # Allow for Chef 10 support
  use_inline_new_resources if defined?(use_inline_new_resources)

  def whyrun_supported?
    true
  end

  action :create do

    Chef::Log.debug('sysrc: new_resource.variable: '+new_resource.variable)
    Chef::Log.debug('sysrc: new_resource.value: '+new_resource.value)
    Chef::Log.debug('sysrc: new_resource.file: '+new_resource.file)

    command = 'sysrc '
    if new_resource.file
      command += '-f ' + new_resource.file + ' '
    end
    command += new_resource.variable + '="' + new_resource.value + '" '
    Chef::Log.debug('sysrc: command: '+command)

    checkcmd = 'sysrc -n '
    if new_resource.file
      checkcmd += '-f ' + new_resource.file + ' '
    end
    checkcmd += new_resource.variable + ' '
    #checkcmd += new_resource.variable + ' | grep "^' + new_resource.value + '$"'
    Chef::Log.debug('sysrc: checkcmd: '+checkcmd)

    check = Mixlib::ShellOut.new(checkcmd, :cwd => '/tmp')
    check.run_command
    Chef::Log.debug('sysrc: check.stdout: '+check.stdout.strip)

    unless check.stdout.strip.eql?(new_resource.value)
      execute command do
        #not_if checkcmd
      end
    end

  end

end
