#/bin/bash

INSTALL_DUNITER_DEBIAN_PACKAGE () {

version="v1.6.21"
git_repo="https://git.duniter.org/nodes/typescript/duniter/"
if [ $arch == "x64" ]; then
        middle_url="-/jobs/3296/artifacts/raw/work/bin/"
else
        middle_url="uploads/94f13f3dd61357ddf2539afbc5dc7893/"
fi
deb="duniter-server-$version-linux-$arch.deb"
url="${git_repo}${middle_url}${deb}"

# Retrieve debian package and install it
wget -nc --quiet $url -P /tmp
deb_path="/tmp/$deb"
sudo dpkg -i $deb_path > /dev/null
sudo rm -f $deb_path
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
