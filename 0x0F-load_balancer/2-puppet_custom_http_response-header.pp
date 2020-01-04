# Configure Nginx so that its HTTP response contains a custom header

exec {'headernginx':
  provider    => shell,
  environment => ["HOST=${hostname}"],
  command     => 'header_str="location \/ {\n\t\tadd_header X-Served-By \"$HOST\";" ; sudo sed -i "s/location \/ {/$header_str/" /etc/nginx/sites-available/default',
}
