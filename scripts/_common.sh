#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

#=================================================
# PERSONAL HELPERS
#=================================================

CONFIGURE_DUNITER() {
    ynh_exec_as "duniter" duniter --home "$data_dir" config \
        --bma --ipv4 127.0.0.1 --port "$port_local_bma" --remoteh $domain --remotep 443 --noupnp

    ynh_exec_as "duniter" duniter --home "$data_dir" config \
        --ws2p-host 127.0.0.1 --ws2p-port "$port_local_ws2p" \
        --ws2p-remote-host "$domain" --ws2p-remote-port 443 \
        --ws2p-remote-path "/ws2p" --ws2p-noupnp

    # Add BMAS with path, remove auto-generated BMAS endpoint
    ynh_exec_as "duniter" duniter --home "$data_dir" config \
        --addep "BMAS $domain 443 /bma" --remep "BMAS $domain 443"
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
