class migrations (
	$path = '/var/www/bin/migrations.php',
	$env  = 'UNDEF',
) {
  file { "$path":
    ensure  => present,
    mode    => 644,
    owner   => 'vagrant',
    group   => 'vagrant',
  }

  exec { "migrations:migrate":
    cwd => '/var/www',
    command => "php $path migrate --no-interaction",
    require => [Service['mysqld'], File[$path], Class['composertl']],
    timeout => 900, # This can take a long time
    onlyif => [
      "test -f $path",
      "test -f migrations.yml",
      "test -f migrations-db.php",
    ],
    path => [ "/usr/local/bin/", "/usr/bin", "/bin"],
    environment => ['HOME=/tmp']
  }
}
