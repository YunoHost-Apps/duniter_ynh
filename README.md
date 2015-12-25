# uCoin package for YunoHost

* [uCoin project](http://ucoin.io)
* [YunoHost project](https://yunohost.org/#/)
* Should works on Debian Jessie 64 bits, 32 bits and ARM


## Package state
The package is **not working**.
Currently, it:

* Install dependencies: node, npm
* Install uCoin, but it fail cause to this [bug](https://github.com/ucoin-io/ucoin/issues/212).
* Synchronize with node
* Configure the node
* Daemonized the node and launch it

* Remove and uprade scripts should works

Extra features:

* Proxy_pass to access to request though the path instead through the port cause it failed.
* uCoin logs are displayed on the YunoHost admin interface

## Install

```bash
sudo yunohost app install https://moul.re/repo/moul/ucoin_ynh/
```

## License
This package and the uCoin software are under GNU GPL v.3.
