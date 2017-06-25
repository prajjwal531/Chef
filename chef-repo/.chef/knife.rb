# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "prajjwal"
client_key               "#{current_dir}/prajjwal.pem"
chef_server_url          "https://chefserver.example.com/organizations/prajjwal"
cookbook_path            ["#{current_dir}/../cookbooks"]
