## Configurations
- In order to compute blocks you will have to set your member credentials with `duniter wizard key` or from the webadmin.
- The BMA API is accessible from `https://duniter.domain.tld/` if enabled.
- **Warning**: In case the Webui tells you your network configuration is wrong and proposes to correct it, do not apply it, otherwise it breaks the specific configuration made for this package.
You can manually reset the configuration with following command:
`duniter config --bma --ipv4 127.0.0.1 --port CHOSEN_PORT --remoteh YOUR_DOMAIN --remotep 443 --noupnp`

## Cesium
Cesium is a wallet webapp. You can install it with:
- [With the YunoHost app](https://github.com/YunoHost-Apps/cesium_ynh)
<!--- With a Duniter plugin: `duniter plug git+https://github.com/duniter/duniter-ui-cesium.git`-->