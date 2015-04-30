libpath = File.expand_path '../../../kagent/libraries', __FILE__

include_recipe "protobuf::cpp"
include_recipe "zeromq"

user node[:volodb][:user] do
  action :create
  system true
  shell "/bin/bash"
  not_if "getent passwd #{node[:volodb]['user']}"
end

# See ark resource here: https://github.com/burtlo/ark
# It will: fetch it to to /var/cache/chef/
# unpack it to the default path (/usr/local/XXX-1.2.3)
# create a symlink for :home_dir (/usr/local/XXX) 
# add /user/local/XXX/bin to the enviroment PATH variable
 ark 'volodb' do
   url node[:volodb][:url]
   version node[:volodb][:version]
   path node[:volodb][:version_dir]
   home_dir node[:volodb][:home_dir]
#   checksum  '89ba5fde0c596db388c3bbd265b63007a9cc3df3a8e6d79a46780c1a39408cb5'
   append_env_path true
   owner node[:volodb][:user]
 end

private_ip = my_private_ip()
public_ip = my_public_ip()


directory "#{node[:volodb][:version_dir]}/bin" do
  owner node[:volodb][:user]
  group node[:volodb][:group]
  mode "755"
  action :create
  recursive true
end

directory "#{node[:volodb][:version_dir]}/logs" do
  owner node[:volodb][:user]
  group node[:volodb][:group]
  mode "755"
  action :create
  recursive true
end

# returns the first volodb::server private_ip in the list
server_private_ip = private_recipe_ip("volodb","server")
mgmd_private_ip = private_recipe_ip("ndb","mgmd")

ndb_connection_str = "#{mgmd_private_ip}:#{node[:ndb][:mgmd][:port]}"

file "#{node[:volodb][:version_dir]}/config/config.props" do
  owner node[:volodb][:user]
  action :delete
end

template "#{node[:volodb][:version_dir]}/config/config.props" do
  source "config.props.erb"
  owner node[:volodb][:user]
  group node[:volodb][:group]
  mode "755"
  variables({
              :server_ip => server_private_ip
              :ndb_connection_str => ndb_connection_str
            })
  action :create_if_missing
end
