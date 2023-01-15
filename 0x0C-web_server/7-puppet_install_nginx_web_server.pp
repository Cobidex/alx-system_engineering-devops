# Install Nginx package
package { 'nginx':
  ensure => 'installed',
}

service { 'nginx':
  ensure => 'running',
  enable => true,
}

file { '/etc/nginx/sites-available/default':
  ensure  => 'file',
  content => '
server {
    listen 80;
    root /var/www/html;
    index index.html;
    server_name _;

    location / {
        try_files $uri $uri/ =404;
    }
    location /redirect_me {
        return 301 /;
    }
}',
  notify  => Service['nginx'],
}

file { '/var/www/html/index.html':
  ensure  => 'file',
  content => 'Hello World!',
  notify  => Service['nginx'],
}
