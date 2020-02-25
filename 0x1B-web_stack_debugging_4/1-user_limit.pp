# Fix /etc/security/limits.conf file to allow more files opened by holberton

exec { 'Correct hard':
  command  => 'sudo sed -i "s/holberton hard nofile 5/holberton hard nofile 30000/" /etc/security/limits.conf',
  provider => shell,
}

exec { 'Correct soft':
  command  => 'sudo sed -i "s/holberton soft nofile 4/holberton soft nofile 10000/" /etc/security/limits.conf',
  provider => shell,
}
