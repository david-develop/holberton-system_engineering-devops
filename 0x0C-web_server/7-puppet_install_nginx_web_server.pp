# Install and configure an Nginx server using Puppet

exec { 'update':
  command => 'apt-get -y update',
  path    => ['/usr/bin', '/bin'],
  user    => root,
}

exec { 'install':
  command => 'apt-get -y install nginx',
  path    => ['/usr/bin', '/bin'],
  user    => root,
}

exec { 'createfile':
  command => 'echo "Holberton School" | tee /var/www/html/index.html',
  path    => ['/bin', '/usr/bin'],
  user    => root,
}

file_line { 'redirect':
  ensure => present,
  path   => '/etc/nginx/sites-available/default',
  line   => "\tserver_name _;\n\trewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;",
  match  => '^*server_name _;',
}

exec { 'restart':
  command => 'service nginx restart',
  path    => ['/usr/bin', '/bin', '/usr/sbin'],
  user    => root,
}
