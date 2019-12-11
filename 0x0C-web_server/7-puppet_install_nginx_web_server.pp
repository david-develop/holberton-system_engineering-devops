# Install and configure an Nginx server using Puppet

exec {'update':
  provider => shell,
  command  => 'sudo apt-get -y update ; sudo apt-get -y install nginx ; echo "Holberton School" | sudo tee /var/www/html/index.html ; redir_str="server_name _;\n\trewrite ^\/redirect_me https:\/\/www.youtube.com\/watch?v=QH2-TGUlwu4 permanent;" ; sudo sed -i "s/server_name _;/$redir_str/" /etc/nginx/sites-available/default ; sudo service nginx restart',
}
