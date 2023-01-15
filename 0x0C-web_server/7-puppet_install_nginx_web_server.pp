# install and configure nginx


exec { 'update':
  command => 'sudo apt-get update';
}

exec { 'upgrade':
  command => 'sudo apt-get upgrade';
}

exec { 'nginx':
  command => 'sudo apt-get nginx -y';
}

exec { 'configure_nginx':
  command => 'sudo echo "server {
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
}" | tee /etc/nginx/sites-available/default';
}

exec { 'create_symbolic_link':
  command => 'sudo ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/';
}

exec { 'restart':
  command => 'sudo service nginx restart';
}
