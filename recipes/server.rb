
template "#{node[:volodb][:version_dir]}/bin/server.sh" do
  source "server.sh.erb"
  owner node[:volodb][:user]
  group node[:volodb][:group]
  mode 0754
end

