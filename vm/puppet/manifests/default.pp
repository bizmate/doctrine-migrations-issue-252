exec { "yum update": 
	provider => shell,
	command  => "yum update -y",
	timeout  => 0,
}

Package {
	allow_virtual => false,
	require       => Exec["yum update"],
}

include sqldb
include tldb

include webserver
include composertl

include epel
include migrations