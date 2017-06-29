#
# Cookbook:: jenkins-server
# Recipe:: default
#


##### Copyright:: 2017, The Authors, All Rights Reserved.


include_recipe 'jenkins::java'
include_recipe 'jenkins::master'

template "#{node['jenkins']['master']['home']}/config.xml" do
  source "config.xml.erb"
end
