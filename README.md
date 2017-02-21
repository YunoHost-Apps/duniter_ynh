# Duniter package for YunoHost

- [Duniter project](https://duniter.org)
- [YunoHost project](https://yunohost.org)
- Works on Debian Jessie 64 bits and ARM
- 200Mo free RAM is necessary

## Install

- Web admin can only be installed on root path for now.
Use a domain name like `duniter.domain.tld` for instance.
See [#18](https://github.com/duniter/duniter_ynh/issues/18) for more details.

```bash
sudo yunohost app install https://github.com/duniter/duniter_ynh
```

## Package state
The package is **in progress**.
Currently, it:

- Install Duniter ≥ 0.30.0
- Configure
- Synchronize
- Start

## Usage

- Graphical interface to manage the node is accessible at `https://duniter.domain.tld/webui`.
- The API is accessible at `https://duniter.domain.tld/`.

## License
This package and the Duniter software are under GNU GPL v.3.
