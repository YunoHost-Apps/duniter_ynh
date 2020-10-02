#/bin/bash

INSTALL_DUNITER_DEBIAN_PACKAGE () {
	version="v1.8.0"
	url_base="https://git.duniter.org/nodes/typescript/duniter/"
	if [ $arch == "x64" ]; then
		mid_url="-/jobs/40349/artifacts/raw/work/bin/"
	else
		mid_url="uploads/afe00e6e6cb318fbdbb977d8c73f4645/"
	fi

        deb="duniter-server-$version-linux-$arch.deb"
	url="${url_base}${mid_url}${deb}"

	# Retrieve debian package and install it
	wget -nc --quiet $url -P /tmp
	deb_path="/tmp/$deb"
	dpkg -i $deb_path > /dev/null
	rm -f $deb_path
}

INSTALL_SYSTEMD () {
	cp ../conf/duniter.service /etc/systemd/system/duniter.service
	systemctl enable duniter.service
}

CONFIGURE_DUNITER () {
	duniter config --ipv4 127.0.0.1 --port $port --remoteh $domain --remotep 80 --noupnp
	duniter config --addep "BMAS $domain 443"
	duniter config --ws2p-host 127.0.0.1 --ws2p-port 20901 --ws2p-remote-host $domain --ws2p-remote-port 443 --ws2p-noupnp
}

CONFIG_SSOWAT () {
	# Protect senstive sub-routes to Duniter web admin interface, give access to choosen admin
	if ! ynh_permission_exists --permission "admin"; then
		ynh_permission_create --permission "admin" --url "/webui","/webmin" --allowed "$admin"
	fi

	# Add access to BMA
	ynh_permission_update --permission main --add visitors

	# Set URL redirection from root to webadmin
	ynh_app_setting_set "$app" redirected_urls "{'$domain/':'$domain/webui'}"

	# Remove deprecated permission system settings
	if [ ! -z "$(ynh_app_setting_get --app=$app --key=protected_uris)" ]; then
		ynh_app_setting_delete --app=$app --key=protected_uris
		ynh_app_setting_delete --app=$app --key=unprotected_uris
	fi
}

CONFIG_NGINX () {
	nginx_conf="../conf/nginx.conf"
	sed -i "s@YNH_EXAMPLE_PORT@$port@" $nginx_conf
	sed -i "s@YNH_EXAMPLE_DOMAIN@$domain@" $nginx_conf
	cp $nginx_conf /etc/nginx/conf.d/$domain.d/$app.conf
	systemctl reload nginx
}

REMOVE_DUNITER () {
	# Stop duniter daemon
        systemctl stop duniter

	# Remove Duniter package
	dpkg -r duniter
}
