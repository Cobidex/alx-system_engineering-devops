# create a manifest that kills a process named killmenow

exec { 'kill_killmenow':
  command => 'pkill -f killmenow',
  path    => '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin',
}
