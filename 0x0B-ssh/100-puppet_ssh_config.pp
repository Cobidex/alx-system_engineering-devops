# set up your client SSH configuration file so that you can connect to a server without typing a password.
exec { 'Turn off passwd auth':
  command => 'echo "PasswordAuthentication no" >> /etc/ssh/ssh_config',
  path    => '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin',
  }
exec { 'Declare identity file':
  command => 'echo "IdentityFile ~/.ssh/school" >> /etc/ssh/ssh_config',
  path    => '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin',
  }
