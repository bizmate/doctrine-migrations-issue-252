class tldb {

	mysql::db { 'test':
	    user            => 'dbuser',
	    password        => 'password',
	    host            => 'localhost',
	    sql             => "/vagrant/puppet/modules/tldb/files/test.sql",
	    import_timeout  => 900,
	}

	mysql_grant { 'dbuser@localhost/*.*':
	    ensure     => 'present',
	    options    => ['GRANT'],
	    privileges => ['ALL'],
	    user       => 'dbuser@localhost',
	    table      => '*.*'
	}
}