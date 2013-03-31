class postgres {
  $username = "root"
  $password = "root"

  package { 'postgresql-9.1':
    ensure => present
  }

  package { 'libpq-dev':
    ensure => present
  }

  service { 'postgresql':
    ensure => running,
    require => Package['postgresql-9.1', 'libpq-dev']
  }

  # Create database user if it doesn't already exist
  exec { 'create_db_user':
    command => "sudo -u postgres createuser -D -l -S -R $username",
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
