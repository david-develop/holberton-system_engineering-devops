# Change the configuration file for not key

exec { 'configfile':
  command => 'echo "IdentityFile ~/.ssh/holberton" >> /etc/ssh/ssh_config; echo "PasswordAuthentication no" >> /etc/ssh/ssh_config',
  path    => ['/usr/bin', '/bin'],
}