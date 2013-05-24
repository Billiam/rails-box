class postgres {
  $username = "root"
  $password = "root"

  package { 'postgresql-9.1':
    ensure => present,
    require => Exec['apt-get update']
  }

  package { 'libpq-dev':
    ensure => present,
    require => Exec['apt-get update']
  }

  exec { 'utf8 postgres':
    command => 'pg_dropcluster --stop 9.1 main ; pg_createcluster --start --locale en_US.UTF-8 9.1 main',
    unless  => 'sudo -u postgres psql -t -c "\l" | grep template1 | grep -q UTF',
    require => Package['postgresql-9.1'],
    path    => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
  }

  service { 'postgresql':
    ensure => running,
    require => Exec['utf8 postgres']
  }

  # Create database user if it doesn't already exist
  exec { 'create_db_user':
    command => "sudo -u postgres createuser -d -l -S -r $username && sudo -u postgres psql -tAc \"ALTER USER $username WITH ENCRYPTED PASSWORD '$password'\"",
    unless  => "sudo -u postgres psql -tAc \"SELECT 1 FROM pg_roles WHERE rolname='$username'\" | grep -q 1",
    require => Service['postgresql'],
  }

  # Create database if it doesn't already exist
  #exec { 'create_user':
  #  command => "sudo -u postgres createdb -O $username $database",
  #  unless  => "sudo -u postgres psql -tAc \"SELECT 1 FROM pg_catalog.pg_database WHERE datname='$database'\" | grep -q 1",
  #require => [ Exec['create_db_user'], Service['postgresql'] ],
  #}
}
