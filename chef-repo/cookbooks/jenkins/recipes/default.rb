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


package "oracle-java8-installer" do
  action :install
end

template "/home/vagrant/jenkins.key" do
      source "jenkins_key.erb"
      action :create
end

execute "cd /home/vagrant/; apt-key add jenkins.key" do
   only_if do
     File.exist?("/home/vagrant/jenkins.key")
   end
end

file "/etc/apt/sources.list.d/jenkins.list" do
  content "deb http://pkg.jenkins.io/debian-stable binary/"
end

execute "apt-get update"

package "jenkins" do
  action :install
end

service "jenkins" do
  action :start
end
