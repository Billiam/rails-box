class git {

  package { 'git':
    ensure => present
  }

  package { 'git-doc':
    ensure => present
  }

  package { 'git-man':
    ensure => present
  }

  package { 'git-svn':
    ensure => present
  }

}