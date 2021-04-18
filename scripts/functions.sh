#/bin/bash

INSTALL_DUNITER_DEBIAN_PACKAGE () {
	url_base="https://git.duniter.org/nodes/typescript/duniter/"
	if [ $arch == "x64" ]; then
		version="v1.8.1"
		mid_url="-/jobs/40430/artifacts/raw/work/bin/"
	else
		version="v1.8.0"
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
	duniter config --bma --ipv4 127.0.0.1 --port $port --remoteh $domain --remotep 443 --noupnp
	duniter config --ws2p-host 127.0.0.1 --ws2p-port 20901 --ws2p-remote-host $domain --ws2p-remote-port 443 --ws2p-noupnp
}

CONFIG_PERMISSIONS () {
	# Remove deprecated permission system settings to remove their effects
	if ynh_legacy_permissions_exists; then
		ynh_legacy_permissions_delete_all
	fi

	# Protect senstive sub-routes to Duniter web admin interface, give access to choosen admin
	if ! ynh_permission_exists --permission="admin"; then
		ynh_permission_create --permission "admin" --url "/webui" --additional_urls "/webmin" --allowed "$admin" --label "Administration" --show_tile=true
	fi
	
	# Set BMA and WS2P APIs accessible to visitors
	if ! ynh_permission_exists --permission="apis"; then
		ynh_permission_create --permission="apis" --url="/" --allowed="visitors" --show_tile=false --protected=true
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
