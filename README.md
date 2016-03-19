# uCoin package for YunoHost

* [uCoin project](http://ucoin.io)
* [YunoHost project](https://yunohost.org/#/)
* Works on Debian Jessie 64 bits, 32 bits (and ARM)
* 200Mo free RAM is necessary

## Install

```bash
sudo yunohost app install https://github.com/ucoin-io/ucoin_ynh
```

## Package state
The package is **in progress**.
Currently, it:

* Install uCoin 0.14.2 and it's dependencies: node, npm
* Configure
* Synchronize
* Start

Extra features:

* Path access through a proxy_pass instead through the port cause it failed.
* uCoin logs are displayed on the YunoHost admin interface

## License
This package and the uCoin software are under GNU GPL v.3.
