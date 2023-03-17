## First synchronization

The first synchronization can be very time consuming, it can be considered to do it from the command line via ssh rather than via the graphical WEB interface. In order to let the synchronization be done without keeping the terminal window open connected in ssh, it is recommended to use `tmux` or `screen`. `screen -S duniter` in order to open a new "screen". In this screen called "duniter":

```
sudo systemctl stop duniter
sudo su - duniter -c "duniter --home \$HOME sync g1.duniter.org" && sudo systemctl start duniter
```

During the synchronization, you can press CTRL+SHIFT+a+d to exit without closing the "duniter" screen, you can then leave the ssh connection.
To come back to your "duniter" screen to see if the sync is finished, you have to run the command `screen -d duniter`

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
