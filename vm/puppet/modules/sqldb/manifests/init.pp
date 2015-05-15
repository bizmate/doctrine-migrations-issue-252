class sqldb{
	class { '::mysql::server':
		override_options => { 'mysqld' => { 
			'max_connections' 					=> '1024',
			'user' 								=> 'mysql',
			'datadir' 							=> '/var/lib/mysql',
			'socket' 							=> '/var/lib/mysql/mysql.sock',
			'pid-file' 							=> '/var/run/mysqld/mysqld.pid',
			'user' 								=> 'mysql',
			'port' 								=> '3306',
			'max_connections' 					=> '512',
			'max_allowed_packet' 				=> '32M',
			'skip-name-resolve'					=> '',
			'key_buffer_size' 					=> '1024M',
			'table_cache' 						=> '1024',
			'read_rnd_buffer_size' 				=> '8M',
			'myisam_sort_buffer_size' 			=> '64M',
			'thread_cache_size' 				=> '16',
			'query_cache_size' 					=> '512M',
			'sort_buffer_size' 					=> '2M',
			'read_buffer_size' 					=> '1M',
			'innodb_buffer_pool_size' 			=> '1024M',
			'innodb_log_buffer_size' 			=> '16M',
			'innodb_additional_mem_pool_size' 	=> '16M',
			'innodb_flush_log_at_trx_commit' 	=> '2',
			'innodb_flush_method' 				=> 'O_DIRECT',
			'innodb_file_per_table'				=> '',
			'innodb_thread_concurrency' 		=> '8',
			'tmp_table_size' 					=> '64M',
			'max_heap_table_size' 				=> '64M',
			'wait_timeout' 						=> '900',
			'connect_timeout' 					=> '10',
		}}
  	}	

	exec { 'enable mysqld run from boot':
	    provider => shell,
	    command  => 'chkconfig mysqld on',
	    require  => Service['mysqld']
	}
}	
