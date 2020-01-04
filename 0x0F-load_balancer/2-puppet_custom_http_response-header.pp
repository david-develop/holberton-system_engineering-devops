# Configure Nginx so that its HTTP response contains a custom header

exec {'install':
  provider => shell,
  command  => 'sudo apt-get -y update ; sudo apt-get -y install nginx',
}

exec {'header':
  provider    => shell,
  command     => 'header_str="location \/ {\n\t\tadd_header X-Served-By \$hostname;" ; sudo sed -i "s/location \/ {/$header_str/" /etc/nginx/sites-available/default',
}

exec { 'restart':
  provider => shell,
  command  => 'sudo service nginx restart',
}
