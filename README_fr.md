# Duniter pour YunoHost

[![Niveau d'intégration](https://dash.yunohost.org/integration/duniter.svg)](https://dash.yunohost.org/appci/app/duniter) ![](https://ci-apps.yunohost.org/ci/badges/duniter.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/duniter.maintain.svg)  
[![Installer Duniter avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=duniter)

*[Read this readme in english.](./README.md)*
*[Lire ce readme en français.](./README_fr.md)*

> *Ce package vous permet d'installer Duniter rapidement et simplement sur un serveur YunoHost.
Si vous n'avez pas YunoHost, regardez [ici](https://yunohost.org/#/install) pour savoir comment l'installer et en profiter.*

## Vue d'ensemble

Nœud qui permet de participer à l’écriture de blocs.

**Version incluse :** 1.8.1~ynh1

**Démo :** https://demo.example.com

## Captures d'écran

![](./doc/screenshots/duniter_admin_g1.png)

## Documentations et ressources

* Site officiel de l'app : https://duniter.org
* Documentation officielle de l'admin : https://yunohost.org/packaging_apps
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