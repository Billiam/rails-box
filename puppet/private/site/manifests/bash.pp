class site::bash {
  file { '/home/vagrant/.bash_aliases':
    content => template("site/bash_aliases.erb"),
  }
}