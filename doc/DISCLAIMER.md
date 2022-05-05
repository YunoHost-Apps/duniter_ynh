## Configurations
- In order to compute blocks you will have to set your member credentials with `sudo su - duniter -c "duniter --home \$HOME wizard key"` or from the webadmin.
- BMA, the client API is accessible from `https://duniter.domain.tld/bma/` if enabled . The last `/` is necessary. It can be used in Cesium and Silkaj.
- The web administration interface is accessible via `https://duniter.domain.tld/` and is only accessible to the administrator specified at the installation.
- **Warning**: In case the Webui tells you your network configuration is wrong and proposes to correct it, do not apply it, otherwise it breaks the specific configuration made for this package.
You can manually reset the configuration with following command:
`sudo su - duniter -c "duniter --home \$HOME config --bma --ipv4 127.0.0.1 --port CHOSEN_PORT --remoteh YOUR_DOMAIN --remotep 443 --noupnp"`

## Cesium
Cesium is a wallet webapp. You can install it with:
- [With the YunoHost app](https://github.com/YunoHost-Apps/cesium_ynh)
