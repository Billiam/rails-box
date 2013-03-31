class lighttpd {
  package { 'lighttpd':
    ensure => present
  }
  service {"lighttpd":
    ensure => running,
    enable => true,
    require => Package["lighttpd"],
  }
}