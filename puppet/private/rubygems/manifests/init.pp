class rubygems {
  package { 'bundler':
    provider => 'gem',
    ensure => installed,
  }
  package { 'awesome_print':
  	provider => 'gem',
  	ensure => installed,
  }
  package { 'pry': 
  	provider => 'gem',
  	ensure => installed,
  }
}
