#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

# dependencies used by the app
pkg_dependencies="deb1 deb2 php$YNH_DEFAULT_PHP_VERSION-deb1 php$YNH_DEFAULT_PHP_VERSION-deb2"

#=================================================
# PERSONAL HELPERS
#=================================================
CONFIGURE_DUNITER() {
	ynh_exec_as duniter duniter --home $datadir config --bma --ipv4 127.0.0.1 --port $port --remoteh $domain --remotep 443 --noupnp
	ynh_exec_as duniter duniter --home $datadir config --ws2p-host 127.0.0.1 --ws2p-port 20901 --ws2p-remote-host $domain --ws2p-remote-port 443 --ws2p-remote-path "/ws2p" --ws2p-noupnp

	# Add BMAS with path, remove auto-generated BMAS endpoint
	ynh_exec_as duniter duniter --home $datadir config --addep "BMAS $domain 443 /bma" --remep "BMAS $domain 443"
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
