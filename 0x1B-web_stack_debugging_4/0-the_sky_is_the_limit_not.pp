# Fix /etc/default/nginx file, to allow more files open

exec { 'change ulimit value':
  command  => 'sed -i "s/15/30000/" /etc/default/nginx',
  provider => shell,
}

-> exec { 'restart nginx':
  command  => 'sudo service nginx restart',
  provider => shell,
}
