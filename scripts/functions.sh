#/bin/bash

INSTALL_DUNITER_DEBIAN_PACKAGE () {
# Retrieve url of last version and version number
url=$(curl -s https://api.github.com/repos/duniter/duniter/releases | grep "browser_" | grep $arch | grep "linux" | grep "server" | head -1 | cut -d\" -f4)
version=$(echo $url | cut -d/ -f8)

# Retrieve debian package and install it
wget -nc --quiet $url -P /tmp
deb="/tmp/duniter-server-$version-linux-$arch.deb"
sudo dpkg -i $deb > /dev/null
sudo rm -f $deb
}

CONFIG_SSOWAT_FOR_RESTRICTED_ACCESS () {
# Add admin to the allowed users
sudo yunohost app addaccess $app -u $admin

# Allow only allowed users to access admin panel
ynh_app_setting_set "$app" protected_uris "/" 

# SSOwat Configuration
#ynh_app_setting_set "$app" unprotected_uris "/api/"
}

CONFIG_NGINX_FOR_WEB_ADMIN () {
# Configure Nginx
nginx_conf="../conf/nginx.conf"
#sudo sed -i "s@YNH_EXAMPLE_PATH@$path@g" $nginx_conf
sudo sed -i "s@YNH_EXAMPLE_PORT@$port@" $nginx_conf
sudo sed -i "s@YNH_EXAMPLE_DOMAIN@$domain@" $nginx_conf
sudo cp $nginx_conf /etc/nginx/conf.d/$domain.d/$app.conf
sudo nginx -t && sudo service nginx reload
}
