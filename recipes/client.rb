libpath = File.expand_path '../../../kagent/libraries', __FILE__

server_ip = private_recipe_ip("volodb","server")


template "#{node[:volodb][:version_dir]}/bin/client.sh" do
  source "client.sh.erb"
  owner node[:volodb][:user]
  group node[:volodb][:group]
  mode 0754
  variables({
              :server_ip => server_ip
            })
end

