#
# Cookbook Name:: motd
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

#

template "/etc/motd" do
 source "template.erb"
 mode "0644"
end
