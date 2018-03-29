#/bin/bash

INSTALL_DUNITER_DEBIAN_PACKAGE () {

version="v1.6.23"
git_repo="https://git.duniter.org/nodes/typescript/duniter/"
if [ $arch == "x64" ]; then
	middle_url="-/jobs/4085/artifacts/raw/work/bin/"
else
	middle_url="uploads/8ffd85dc6400b90895e0de9aa5286667/"
fi
deb="duniter-server-$version-linux-$arch.deb"
url="${git_repo}${middle_url}${deb}"

# Retrieve debian package and install it
wget -nc --quiet $url -P /tmp
deb_path="/tmp/$deb"
sudo dpkg -i $deb_path > /dev/null
sudo rm -f $deb_path
}

CONFIGURE_DUNITER () {
	sudo duniter config --ipv4 127.0.0.1 --port $port --remoteh $domain --remotep 80 --noupnp
	sudo duniter config --addep "BMAS $domain 443"
	sudo duniter config --ws2p-host 127.0.0.1 --ws2p-port 20901 --ws2p-remote-host $domain --ws2p-remote-port 443 --ws2p-noupnp
}

CONFIG_SSOWAT () {
# Add admin to the allowed users
sudo yunohost app addaccess $app -u $admin

# Protect senstive sub-routes
ynh_app_setting_set "$app" protected_uris "/webui","/webmin"

# Duniter is public app, with only some parts restricted in nginx.conf
ynh_app_setting_set "$app" unprotected_uris "/","/modules"

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
