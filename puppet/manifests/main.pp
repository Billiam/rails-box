Exec { path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games' }

group { 'puppet':
  ensure => present
}

exec { 'apt-get update':
  command => 'sudo /usr/bin/apt-get update'
}

include git
include subversion

include rubygems
include php5
include lighttpd
include mysql
include postgres
include adminer::lighttp
include sqlite3
include prax

include nodejs
include site_tmux
include site_bash
