A set of scripts to be used on Synology boxes which use go-acme/lego to obtain
and renew TLS certs from Let's Encrypt.

Heavily based upon [this work](http://www.thedreaming.org/2020/11/18/synology-lets-encrypt/), but updated to use lego in docker, and for some personal preferences.

In addition to setting up config.sh, you'll need to create a `linode-key` file.
