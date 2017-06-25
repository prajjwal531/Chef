#
# Cookbook Name:: testing
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute




#template '/var/www/html/index.html' do
 #  source 'index.html.erb'
  # notifies :restart, 'service[apache2]', :immediately
#end

#template '/home/vagrant/hellp.sh' do
 #  source 'index.html.erb'
  # only_if { File.exists?('/var/www/html/index.html')}
#end


node.default["apache"]["indexfile"]="index2.html"

package 'apache2' do
   action :install
end

package 'vim'

service 'apache2' do
    action [:nothing, :enable]
end

#cookbook_file '/var/www/html/index.html' do
#     source node["apache"]["indexfile"]
#     mode "0644"
#end

node["apache"]["sites"].each do |site_name, site_data|
   document_root="/srv/apache/#{site_name}"
end

execute "mv /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf.disabled" do   
   only_if { File.exist?("/etc/apache2/sites-available/000-default.conf")}
   notifies :restart, 'service[apache2]'
end

