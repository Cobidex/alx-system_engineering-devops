# configuer custom header for nginx web server
package { 'nginx':
  ensure => 'installed',
}

file { '/etc/nginx/conf.d/custom_headers.conf':
  ensure  => file,
  content => 'add_header X-Served-By $hostname;',
  require => Package['nginx'],
  notify  => Service['nginx'],
}

service { 'nginx':
  ensure => running,
  enable => true,
}
