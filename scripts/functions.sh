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
}

CONFIG_SSOWAT () {
# Add admin to the allowed users
sudo yunohost app addaccess $app -u $admin

# Protect senstive sub-routes
ynh_app_setting_set "$app" protected_uris "/webui","/webmin","/modules"

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
