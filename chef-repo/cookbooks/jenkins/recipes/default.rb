#
# Cookbook Name:: jenkins
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#



#apt_repository 'java' do
#  uri "ppa:webupd8team/java"
#  components ['main', 'stable']
#end

execute "add-apt-repository ppa:#{node["jenkins"]["java_version"]}"
execute "apt-get update"

package "oracle-java8-installer" do
  action :install
end
