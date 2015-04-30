name             'volodb'
maintainer       "jdowling"
maintainer_email "jdowling@kth.se"
license          "Apache v2.0"
description      'Installs/Configures volodb'
version          "0.1"

recipe            "volodb::server", "Installs and starts volodb server"
recipe            "volodb::client", "Installs volodb client libraries"

depends 'ark'
depends 'protobuf'
depends 'zeromq'
depends 'ndb'

%w{ ubuntu debian rhel centos }.each do |os|
  supports os
end

attribute "volodb/version",
:description => "Version of volodb",
:type => 'string',
:default => "0.1"


attribute "volodb/url",
:description => "Url to download binaries for volodb",
:type => 'string',
:default => ""

attribute "volodb/user",
:description => "Run volodb as this user",
:type => 'string',
:default => "volodb"

attribute "volodb/no_definer_threads",
:description => "Number of Definer Threads",
:type => 'string'

attribute "volodb/no_executor_threads",
:description => "Number of Executor Threads",
:type => 'string'

