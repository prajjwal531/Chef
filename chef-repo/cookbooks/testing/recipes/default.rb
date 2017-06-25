#
# Cookbook Name:: testing
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

template '/var/www/html/index.html' do
   source 'index.html.erb'
   notifies :restart, 'service[apache2]', :immediately
end

template '/home/vagrant/hellp.sh' do
   source 'index.html.erb'
   only_if { File.exists?('/var/www/html/index.html')}
end

package 'apache2' do
   action :install
end

package 'vim'

service 'apache2' do
    action [:nothing, :enable]
end
