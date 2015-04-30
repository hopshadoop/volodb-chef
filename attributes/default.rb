
default[:volodb][:url] = "http://cloud7.sics.se/volodb.tar.gz"
default[:volodb][:version] = "0.1"
default[:volodb][:user] = "volodb"
default[:volodb][:group] = "volodb"

default[:volodb][:version_dir] = "/usr/local/volodb-#{node[:volodb][:version]}"
default[:volodb][:home_dir] = "/usr/local/volodb"

default[:volodb][:data_memory_mbs] = 500
default[:volodb][:timeout_ms] = 10000

