# Configure Nginx so that its HTTP response contains a custom header

exec {'header':
  provider    => shell,
  command     => 'sudo apt-get -y update ; sudo apt-get -y install nginx ; header_str="location \/ {\n\t\tadd_header X-Served-By \$hostname;" ; sudo sed -i "s/location \/ {/$header_str/" /etc/nginx/sites-available/default ; sudo service nginx restart',
}
