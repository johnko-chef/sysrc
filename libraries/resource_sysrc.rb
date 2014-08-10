#
# Cookbook Name:: sysrc
# Resource:: sysrc
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

class Chef::Resource::Sysrc < Chef::Resource::LWRPBase
  self.resource_name = 'sysrc'
  actions :create
  default_action :create  
  attribute :variable, :kind_of => String, :name_attribute => true, :default => 'none'
  attribute :value, :kind_of => String, :default => nil
  attribute :file, :kind_of => String, :default => nil
end
