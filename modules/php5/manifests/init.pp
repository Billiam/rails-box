class php5 {
    package { "php5-common":
        ensure  => present,
        require => Exec['apt-get update']
    }
    package { "php5-cli":
        ensure  => present,
        require => Exec['apt-get update']
    }
}