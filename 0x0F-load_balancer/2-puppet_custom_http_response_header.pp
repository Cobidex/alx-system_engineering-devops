# automate the task of creating a custom HTTP header response
exec {'update':
  command => 'apt-get update',
}

package {'nginx':
    ensure   => 'installed',
}

file_line {'header':
  path  => '/etc/nginx/nginx.conf',
  line  => 'http {\n\tadd_header X-Served-By $HOSTNAME;',
  match => 'http {',
}

exec {'restart':
  command     => 'service nginx restart',
  refreshonly => true
}
