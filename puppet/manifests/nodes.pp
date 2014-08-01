node 'rails.dev' {

  group { 'puppet':
    ensure => present
  }

  include git

  include rubygems
  include php5
  include lighttpd
  include mysql
  include postgres
  include adminer::lighttp
  include sqlite3
  include prax

  include nodejs
  include site::tmux
  include site::bash
}