class composertl(
  $command_name = 'composer',
  $target_dir   = '/usr/local/bin',
  $auto_update  = true
){
  class { 'composer':
    command_name => 'composer',
    target_dir   => '/usr/local/bin',
    auto_update  => true
  }

  exec { "run_composer_install":
    cwd => '/var/www',
    command => 'composer install --prefer-source --no-interaction --working-dir /var/www',
    #require => Package['php-cli'],
    require => [Class["composer"], Package['php-cli'], File['/etc/php.d'], File['/etc/php.ini']],
    timeout => 1800, # This can take a long time
    onlyif => [
      "test -f /var/www/composer.json"
    ],
    path => [ "/usr/local/bin/", "/usr/bin", "/bin"],
    environment => ['HOME=/tmp']
  }
}