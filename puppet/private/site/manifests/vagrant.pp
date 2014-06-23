class site::vagrant {
  include ::vagrant

  vagrant::plugin { 'vagrant-aws':
    require => Class['::vagrant']
  }
}