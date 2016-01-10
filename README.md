# uCoin package for YunoHost

* [uCoin project](http://ucoin.io)
* [YunoHost project](https://yunohost.org/#/)
* Should works on Debian Jessie 64 bits, 32 bits and ARM


## Package state
The package is **in progress**.
Currently, it:

* Install uCoin 0.13.x and it's dependencies: node, npm
* Synchronize
* Configure
* Start

Extra features:

* Path access through a proxy_pass instead through the port cause it failed.
* uCoin logs are displayed on the YunoHost admin interface

## Install

```bash
sudo yunohost app install https://github.com/ucoin-io/ucoin_ynh
```

## License
This package and the uCoin software are under GNU GPL v.3.
