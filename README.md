Description
===========

Executes sysrc for FreeBSD

Requirements
============

Needs to be used on a system that utilizes sysrc, e.g. FreeBSD.


Usage
=====

```ruby

include_recipe "sysrc"

sysrc 'sshd_enable' do
  value 'YES'
  file '/etc/rc.conf'
end

sysrc 'variable' do
  value "-l 'quoted'"
  file '/etc/rc.conf'
end

sysrc 'syslogd_flags' do
  value '-s -b127.0.0.1'
  file '/etc/rc.conf'
end

```

default
----

Executes sysrc for FreeBSD



License and Author
==================

Author:: John Ko <git@johnko.ca>
Copyright:: 2014, John Ko

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
