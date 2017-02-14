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

# Fix https://github.com/duniter/cesium/issues/330
sudo sed -i "s@443===@443==@g" /opt/duniter/sources/node_modules/duniter-ui/public/cesium/dist_js/cesium*
sudo sed -i "s@port === 443@port == 443@g" /opt/duniter/sources/node_modules/duniter-ui/public/cesium/dist_js/cesium*

# Force Cesium to use local instance
sudo sed -i "s@\"host\".*@\"host\": \"$domain\",@" /opt/duniter/sources/node_modules/duniter-ui/public/cesium/config.js
sudo sed -i "s@\"port\".*@\"port\": \"443\"@" /opt/duniter/sources/node_modules/duniter-ui/public/cesium/config.js
}

CONFIG_SSOWAT_FOR_RESTRICTED_ACCESS () {
# Add admin to the allowed users
sudo yunohost app addaccess $app -u $admin

# Allow only allowed users to access admin panel
ynh_app_setting_set "$app" protected_uris "/webui","/webmin","/cesium"

# Duniter is public app, with only some parts restricted in nginx.conf
sudo yunohost app setting $app unprotected_uris -v "/"
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
