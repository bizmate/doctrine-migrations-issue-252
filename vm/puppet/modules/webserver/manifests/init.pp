class webserver {

  $appPackages = [
    'php', 'httpd-tools', 'php-common', 'php-gd', 'php-pear', 'php-cli', 'php-pdo',
    'php-xml', 'php-mbstring', 'php-mysql', 'php-pecl-memcache' , 'php-pecl-apc', 
    'mod_ssl', 'openssl', 'php-devel', 'httpd-devel', 'gcc', 'pcre-devel'
  ]

  package { ['memcached', 'httpd']:
    ensure => latest,
  }

  service { 'apache2':
    name    => 'httpd',
    ensure  => running,
    require => Package['httpd'],
    restart => '/usr/sbin/apachectl restart'
  }

  service { memcached:
    require => Package[memcached],
    enable     => true,
    ensure => running;
  }

  package {
    $appPackages:
      ensure        => 'latest',
      allow_virtual => false ,
      require       => Package['mysql-server', 'memcached'],
  }

  file { "/etc/httpd/conf.d":
    source  => "puppet:///modules/webserver/conf.d",
    recurse => true,
    ensure  => present,
    mode    => 440,
    require => Package['httpd'],
    notify => Service['apache2']
  }

  file { "/etc/php.d":
    source  => "puppet:///modules/webserver/php.d",
    recurse => true,
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => 444,
    require => Package['httpd'],
    notify => Service['apache2']
  }


  file { "/etc/php.ini":
    source  => "puppet:///modules/webserver/php.ini",
    ensure  => present,
    mode    => 644,
    require => [Package["php"], Package['httpd']],
    notify => Service['apache2']
  }

  file { "/etc/httpd/conf/httpd.conf":
    source  => "puppet:///modules/webserver/httpd.conf",
    ensure  => present,
    mode    => 644,
    require => Package["httpd"],
    notify => Service['apache2']
  }

  exec { 'enable apache2 run from boot':
    provider => shell,
    command  => 'chkconfig httpd on',
    require  => Service['httpd']
  }
}
