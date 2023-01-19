# automate the task of creating a custom HTTP header response
exec { 'update':
  command  => 'sudo apt-get update',
  provider => shell,
}

package { 'nginx':
  ensure  => 'installed',
  require => Exec['update'],
}

file_line { 'header':
  path    => '/etc/nginx/nginx.conf',
  line    => 'http {\n\tadd_header X-Served-By $HOSTNAME;',
  match   => 'http {',
  require => Package['nginx'],
}

exec { 'restart':
  command => 'service nginx restart',
  require => File_line['header'],
}
