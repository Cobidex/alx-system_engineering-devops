# install flask using pip3

exec { 'install_flask':
  command => 'pip3 install flask==2.1.0',
  path    => '/usr/bin:/usr/sbin:/bin',
}
