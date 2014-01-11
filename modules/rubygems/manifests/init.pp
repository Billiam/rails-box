class rubygems {
  package { 'bundler':
    provider => 'gem',
    ensure => installed,
  }
}
