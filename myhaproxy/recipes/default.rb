#
# Cookbook:: myhaproxy
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#node.default['haproxy']['members'] = [{
 #   'hostname' => 'chef-client.local', # these values come from the Vagrantfile
  #  'ipaddress' => '192.168.0.15', # or the public IP and hostname is using a cloud provider
   # 'port' => 80,
   # 'ssl_port' => 80
#},{
#    'hostname' => 'ansible-client.local', # these values come from the Vagrantfile
 #   'ipaddress' => '192.168.0.20', # or the public IP and hostname is using a cloud provider
  #  'port' => 80,
   # 'ssl_port' => 80
  #}
#]

#include_recipe 'haproxy::manual'i
# ~/chef-repo/cookbooks/myhaproxy/recipes/default.rb
#
# Cookbook Name:: myhaproxy
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#all_web_nodes = search('node',"role:web")
all_web_nodes = search('node',"role:newrole AND chef_environment:#{node.chef_environment}")
members = []

all_web_nodes.each do |web_node|

  member = {
  	'hostname'  => web_node['hostname'],
  	'ipaddress' => web_node['ipaddress'],
  	'port' => 80,
  	'ssl_port' => 80
  }

  members.push(member)

end

node.default['haproxy']['members'] = members

include_recipe "haproxy::manual"
