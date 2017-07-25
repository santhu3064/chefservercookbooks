#
# Cookbook:: mychef-client
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

node.default['chef_client']['interval'] = '300' #- Sets Chef::Config[:interval] via command-line option for number of seconds between chef-client daemon runs. Default 1800.
node[.default['chef_client']['splay'] = '60' #- Sets Chef::Config[:splay] via command-line option for a random amount of seconds to add to interval. Default 300.

include_recipe 'chef_client::default'
