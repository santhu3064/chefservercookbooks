#
# Cookbook:: myhaproxy
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
node.default['haproxy']['members'] = [{
    'hostname' => 'chef-client.local', # these values come from the Vagrantfile
    'ipaddress' => '192.168.0.15', # or the public IP and hostname is using a cloud provider
    'port' => 80,
    'ssl_port' => 80
  },{
    'hostname' => 'ansible-client.local', # these values come from the Vagrantfile
    'ipaddress' => '192.168.0.20', # or the public IP and hostname is using a cloud provider
    'port' => 80,
    'ssl_port' => 80
  }
]

include_recipe 'haproxy::manual'
