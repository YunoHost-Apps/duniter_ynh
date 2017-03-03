# Duniter package for YunoHost

- [Duniter project](https://duniter.org)
- [YunoHost project](https://yunohost.org)
- Works on Debian Jessie 64 bits and ARM
- 200Mo free RAM is necessary
- The package state is **working**.

## Install
- You will need to use a dedicated domain name as the app is installed on root path. For instance, use `duniter.domain.tld`.
- An admin user will be asked to access the web admin.
- Cesium wallet webapp could be set as public. It is accessible at `duniter.domain.tld/cesium`.
- Web interface is accessible at `duniter.domain.tld/webui`.
- The API is accessible at `duniter.domain.tld/`.
- After installation, to compute blocks you will have to configure your identity on the node with `duniter wizard key` command or from webadmin using HTTPS.

```bash
sudo yunohost app install https://github.com/duniter/duniter_ynh
```

## Upgrade
The app is not on the list of official apps of YunoHost repository.
You will have to upgrade manually with following command:

```bash
sudo yunohost app upgrade duniter -u https://github.com/duniter/duniter_ynh
```

## What the package do?
Currently, it:
- Install Duniter
- Configure
- Synchronize
- Start

## Tutorial
- [(fr) “Installation d’un nœud Duniter à l’aide de YunoHost”](https://forum.duniter.org/t/installation-d-un-noeud-duniter-a-l-aide-de-yunohost/1420)

## License
This package and the Duniter software are under GNU AGPL v.3.
