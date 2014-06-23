class site::tmux {
  tmux::config {'tmux':
    target => '/home/vagrant/.tmux.conf',
    owner => 'vagrant',
  }
}
