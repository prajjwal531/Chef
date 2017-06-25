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

#package 'vim'

#service 'apache2' do
 #   action [:nothing, :enable]
#end

#cookbook_file '/var/www/html/index.html' do
#     source node["apache"]["indexfile"]
#     mode "0644"
#end
execute "mv /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf.disabled" do
   only_if do
        File.exist?("/etc/apache2/sites-available/000-default.conf")
    end
   #notifies :restart, 'service[apache2]'
end

node["apache"]["sites"].each do |site_name, site_data|

   document_root="/srv/apache/#{site_name}"

   template "/etc/apache2/sites-available/#{site_name}.conf" do
       source "custom.erb"
       mode  "0644"
       variables(
               :document_root => document_root,
               :port => site_data["port"]
         )
       #notifies :restart, "service[apache2]"
   end

   directory document_root do
      mode "0755"
      recursive true
   end

   template "#{document_root}/index.html" do
    source "index.html.erb"
    mode "0655"
    variables(
              :site_name => site_name,
              :port => site_data["port"]
        )
   end

   execute "a2ensite #{site_name}.conf"
   execute "service apache2 reload"
end
