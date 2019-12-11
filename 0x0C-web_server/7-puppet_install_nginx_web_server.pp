# Install and configure an Nginx server using Puppet

exec { 'update':
  command => 'apt-get -y update',
  path    => ['/usr/bin', '/bin'],
  user    => root,
}

package { 'nginx':
  ensure => installed,
  name   => 'nginx',
}

exec { 'createfile':
  command => 'echo "Holberton School" | tee /var/www/html/index.html',
  path    => ['/bin', '/usr/bin'],
  user    => root,
}

exec {'config redirect':
  command  => 'redir_str="server_name _;\n\trewrite ^\/redirect_me https:\/\/www.youtube.com\/watch?v=QH2-TGUlwu4 permanent;" && sed -i "s/serve\
r_name _;/$redir_str/" /etc/nginx/sites-available/default',
  provider => shell,
  user => root,
}

exec { 'restart':
  command => 'service nginx restart',
  path    => ['/usr/bin', '/bin', '/usr/sbin'],
  user    => root,
}
