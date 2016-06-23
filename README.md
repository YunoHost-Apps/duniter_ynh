# Duniter package for YunoHost

- [Duniter project](https://duniter.org)
- [YunoHost project](https://yunohost.org)
- Works on Debian Jessie 64 bits (will comming soon on ARM)
- 200Mo free RAM is necessary

## Install

```bash
sudo yunohost app install https://github.com/duniter/duniter_ynh
```

## Package state
The package is **in progress**.
Currently, it:

- Install Duniter ≥0.20.0a86
- Configure
- Synchronize
- Start

Extra features:

- Will come soon: graphical interface to manage the node.
- Path access through a proxy_pass instead through the port cause it failed.
- Duniter logs are displayed on the YunoHost admin interface

## License
This package and the Duniter software are under GNU GPL v.3.
