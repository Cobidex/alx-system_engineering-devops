# automate the task of creating a custom HTTP header response

exec { 'update':
  command => 'sudo apt-get update',
}

package { 'nginx':
  ensure   => 'installed',
  enable   => True,
  provider => 'apt',
}

exec { 'modify':
  command => 'sudo sed -i "s/http {/&\\n\\tadd_header X-Served-By \"$HOSTNAME\";/" /etc/nginx/nginx.conf',
}

exec { 'restart':
  command => 'sudo service nginx restart',
}

service { 'nginx':
  ensure => running,
}
