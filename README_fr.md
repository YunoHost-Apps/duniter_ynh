# Duniter pour YunoHost

[![Niveau d'intégration](https://dash.yunohost.org/integration/duniter.svg)](https://dash.yunohost.org/appci/app/duniter) ![](https://ci-apps.yunohost.org/ci/badges/duniter.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/duniter.maintain.svg)  
[![Installer Duniter avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=duniter)

*[Read this readme in english.](./README.md)*
*[Lire ce readme en français.](./README_fr.md)*

> *Ce package vous permet d'installer Duniter rapidement et simplement sur un serveur YunoHost.
Si vous n'avez pas YunoHost, regardez [ici](https://yunohost.org/#/install) pour savoir comment l'installer et en profiter.*

## Vue d'ensemble

Logiciel de cryptomonnaie pour faire fonctionner la monnaie libre Ğ1

**Version incluse :** 1.8.2~ynh2



## Captures d'écran

![](./doc/screenshots/duniter_admin_g1.png)

## Avertissements / informations importantes

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

## Documentations et ressources

* Site officiel de l'app : https://duniter.org
* Dépôt de code officiel de l'app : https://git.duniter.org/nodes/typescript/duniter
* Documentation YunoHost pour cette app : https://yunohost.org/app_duniter
* Signaler un bug : https://github.com/YunoHost-Apps/duniter_ynh/issues

## Informations pour les développeurs

Merci de faire vos pull request sur la [branche testing](https://github.com/YunoHost-Apps/duniter_ynh/tree/testing).

Pour essayer la branche testing, procédez comme suit.
```
sudo yunohost app install https://github.com/YunoHost-Apps/duniter_ynh/tree/testing --debug
ou
sudo yunohost app upgrade duniter -u https://github.com/YunoHost-Apps/duniter_ynh/tree/testing --debug
```

**Plus d'infos sur le packaging d'applications :** https://yunohost.org/packaging_apps