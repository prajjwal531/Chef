#
# Cookbook Name:: jenkins
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

apt_update "update"

apt_repository 'java' do
  uri "ppa:webupd8team/java"
  components ['main', 'stable']
end

package "oracle-java8-installer" do
  action :install
end
