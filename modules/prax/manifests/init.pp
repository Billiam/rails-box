class prax {
  vcsrepo { "/home/vagrant/prax":
    ensure => present,
    provider => git,
    source => "https://github.com/ysbaddaden/prax.git"
  }
  
  file { '/etc/init.d/prax':
    source => "/home/vagrant/prax/install/initd",
    mode => 'ug+x',
    require => [Vcsrepo['/home/vagrant/prax']],
  }

  service { 'prax':
    ensure => running,
    enable => true,
    hasrestart => true,
    hasstatus => false,
    require => [File['/etc/init.d/prax']],
  }
  
  file { "/home/vagrant/.prax":
    ensure => "directory",
    owner => "vagrant",
    group => "vagrant",
    require => [Service['prax']],
  }
}
