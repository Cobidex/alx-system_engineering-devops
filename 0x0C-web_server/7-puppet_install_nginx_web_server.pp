# install nginx and configure it

package { 'nginx':
  ensure => 'installed',
}

service { 'nginx':
  ensure => 'running',
  enable => true,
}

file { '/etc/nginx/sites-available/default':
  ensure  => 'file',
  mode    => '0644',
  content => 'server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /var/www/html;

        index index.html index.htm index.nginx-debian.html;

        server_name _;

        location / {
                return 200
        \"Hello World\";
        }

        location /redirect_me {
            return 301
        https://www.youtube.com/watch?v=QH2-TGUlwu4;
        }
	}',
}

exec { 'create_symb_link':
  command => 'sudo ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/',
}

exec { 'start':
  command => 'sudo service nginx restart',
}
