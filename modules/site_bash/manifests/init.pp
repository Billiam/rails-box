class site_bash {
    file { '/home/vagrant/.bash_aliases':
        content => template("site_bash/bash_aliases.erb"),
    }
}