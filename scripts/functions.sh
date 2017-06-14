#/bin/bash

INSTALL_DUNITER_DEBIAN_PACKAGE () {
# Retrieve url of last version and version number
url=$(curl -s https://api.github.com/repos/duniter/duniter/releases/latest | grep "browser_" | grep $arch | grep "linux" | grep "server" | sort -r | head -1 | cut -d\" -f4)
version=$(echo $url | cut -d/ -f8)

# Retrieve debian package and install it
wget -nc --quiet $url -P /tmp
deb="/tmp/duniter-server-$version-linux-$arch.deb"
sudo dpkg -i $deb > /dev/null
sudo rm -f $deb

# Patch Cesium to access local instance
# Note by cgeek: Cesium has been removed from Duniter since v1.3
# cesium_conf="/opt/duniter/sources/node_modules/duniter-ui/public/cesium/config.js"
# sudo sed -i "s@\"host\".*@\"host\": \"$domain\",@" $cesium_conf
# sudo sed -i "s@\"port\".*@\"port\": \"443\"@" $cesium_conf
}

CONFIG_SSOWAT () {
# Add admin to the allowed users
sudo yunohost app addaccess $app -u $admin

# Allow only allowed users to access admin panel
if [ "$is_cesium_public" = "Yes" ]; then
  # Cesium is public, do not protect it
  ynh_app_setting_set "$app" protected_uris "/webui","/webmin","/modules"
else
  # Cesium is not public, protect it
  ynh_app_setting_set "$app" protected_uris "/webui","/webmin","/modules","/cesium"
fi

# Duniter is public app, with only some parts restricted in nginx.conf
ynh_app_setting_set "$app" unprotected_uris "/"

# Set URL redirection from root to webadmin
ynh_app_setting_set "$app" redirected_urls "{'$domain/':'$domain/webui'}"
}

CONFIG_NGINX () {
# Configure Nginx
nginx_conf="../conf/nginx.conf"
sudo sed -i "s@YNH_EXAMPLE_PORT@$port@" $nginx_conf
sudo sed -i "s@YNH_EXAMPLE_DOMAIN@$domain@" $nginx_conf
sudo cp $nginx_conf /etc/nginx/conf.d/$domain.d/$app.conf
sudo service nginx reload
}

REMOVE_DUNITER () {
# Stop duniter daemon if running
sudo duniter status
if [ `echo "$?"` == 0 ]; then
    sudo duniter stop
fi

# Remove Duniter package
sudo dpkg -r duniter
}
