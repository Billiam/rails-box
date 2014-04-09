class prax {
  vcsrepo { "/opt/prax":
    ensure => present,
    provider => git,
    source => "https://github.com/ysbaddaden/prax.git",
    revision => "unstable"
  }
  
  exec { "install-prax":
    cwd => "/opt/prax",
    creates => "/etc/init.d/prax",
    command => "sudo bin/prax install",
    require => [Vcsrepo['/opt/prax']],
  }

  service { 'prax':
    ensure => running,
    enable => true,
    hasrestart => true,
    hasstatus => false,
    require => [Exec["install-prax"]],
  }
  
  file { "/home/vagrant/.prax":
    ensure => "directory",
    owner => "vagrant",
    group => "vagrant",
    require => [Service['prax']],
  }
}
