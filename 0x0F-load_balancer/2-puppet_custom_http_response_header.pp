# automate the task of creating a custom HTTP header response

exec { 'update':
  command => 'sudo apt-get update',
}

package { 'nginx':
  ensure   => 'installed',
  enable   => True,
  provider => 'apt',
}

file_line { 'header':
  path  => '/etc/nginx/nginx.conf',
  line  => 'http {\n\tadd_header X-Served-By $HOSTNAME;',
  match => 'http {',
}

exec { 'restart':
  command => 'sudo service nginx restart',
}

service { 'nginx':
  ensure => running,
}
