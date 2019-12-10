# Change the configuration file for not key

exec { 'configfile':
  command => 'cat "    IdentityFile ~/.ssh/holberton\n    PasswordAuthentication no\n" >> /etc/ssh/ssh_config',
  path    => ['/usr/bin', '/bin'],
}