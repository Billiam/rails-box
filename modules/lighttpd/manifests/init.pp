class lighttpd {
  package { 'lighttpd':
    ensure => present,
    require => Exec['apt-get update']
  }
  service {"lighttpd":
    ensure => running,
    enable => true,
    require => Package["lighttpd"]
  }
  package { "php5-cgi":
      ensure  => present,
      require => [Package['php5-common'], Exec['apt-get update']]
  }
  file { "/etc/lighttpd/lighttpd.conf": 
    content => template("${module_name}/lighttpd.conf.erb"),
    require => Package["lighttpd"]
  }
}