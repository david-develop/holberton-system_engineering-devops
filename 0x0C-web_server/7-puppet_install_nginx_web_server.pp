# Install and configure an Nginx server using Puppet

exec {'update':
  command  => 'sudo apt-get -y update',
  provider => shell,
}

exec {'install':
  command  => 'sudo apt-get -y install nginx',
  provider => shell,
}

# package { 'nginx':
#   ensure => installed,
#   name   => 'nginx',
# }

exec { 'createfile':
  command  => 'echo "Holberton School" | sudo tee /var/www/html/index.html',
  provider => shell,
}

exec { 'config redirect':
  command  => 'redir_str="server_name _;\n\trewrite ^\/redirect_me https:\/\/www.youtube.com\/watch?v=QH2-TGUlwu4 permanent;"\
  && sudo sed -i "s/server_name _;/$redir_str/" /etc/nginx/sites-available/default',
  provider => shell,
}

exec { 'restart':
  command  => 'sudo service nginx restart',
  provider => shell,
}
