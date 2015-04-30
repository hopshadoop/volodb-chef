default[:volodb][:url] = "http://cloud7.sics.se/volodb.tar.gz"
default[:volodb][:version] = "0.1"
default[:volodb][:user] = "volodb"
default[:volodb][:group] = "volodb"

default[:volodb][:version_dir] = "/usr/local/volodb-#{node[:volodb][:version]}"
default[:volodb][:home_dir] = "/usr/local/volodb"

default[:volodb][:db] = "vdb"

default[:volodb][:no_definer_threads]  = "5"
default[:volodb][:no_executor_threads] = "30"
