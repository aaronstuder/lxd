# LXQ

LXQ takes your server or VPS installs LXD and runs each app in it own LXD Container. During setup a wild card certificate is generated for your domain, and apps are reachable via appname.domain.com - apps are automaticly configured to work with the nginx reverse proxy, so no setup is needed. Simply type `lxd install <appname>` wait for the installation to finish, then browse to appname.domain.com This allows you to quickly and easily install apps on one server, while keep them isolated.

# System Requirements

* LXQ is tested on Ubuntu 18.04 and is designed to be used on a fresh Ubuntu 18.04 installation.
* All containers are Ubuntu 18.04
* Processor, RAM, and Hard drive requirements are based on what/how many apps you install and usage of those apps.
* Cloudflare DNS - Other DNS Providers can be added by request :)
* A domain name with support for Wildcard DNS

# Commands

`lxq update`

* Updates LXQ

`lxq init`

* Enables UFW (SSH Only)
* Updates the Host
* Removes LXD Packages and Installs LXD via Snap
* Runs lxd init
* Setup and Configures a nginx container to serve as a reverse proxy
* Forwards ports 443 from the host to the nginx container
* Setups Wild Card cert from Let's Encrpt

`lxq install <appname>`

* Creates and updates a container
* Installs the app inside the contianer
* Generates a .conf file, pushs it to the nginx container and reloads nginx *(if needed)*
* Automatically forwards any needed ports to your app *(if needed)*

`lxq remove <appname>`

* Removes Container
* Deletes .conf from the nginx container
* Reloads Nginx
* Updates Firewall Rules

`lxq backup <appname>`

* Creates a backup of the app
* Run without a appname, it backups all containers.

`lxq conf <option>`
* purge - delete the LXQ conf file
* edit - opens the conf file to edit it
* run without an option shows you the LXQ configuation

## Install

First, get the script and make it executable :

`wget https://raw.githubusercontent.com/aaronstuder/lxq/master/installer/setup.sh`

`chmod +x setup.sh`

Then run it :

`./setup.sh`

After the install is complete :

`source ~/.profile`

## One-Liner

`wget https://raw.githubusercontent.com/aaronstuder/lxq/master/installer/setup.sh && chmod +x setup.sh && ./setup.sh && source ~/.profile`

## Available Apps

* BookStack
* Cockpit *(Installed on the Host, Proxied via the NGINX container)*
* Nextcloud
* Netdata *(Installed on the Host, Proxied via the NGINX container)*
* Pi-hole
* Rocket.Chat

## Directory Structure

* `/etc/lxq/lxq.cfg` - Main LXQ conf

* `/opt/lxq/` LXQ Install Directory

* `/opt/lxq/apps/<appname>` One folder for each app

* `/opt/lxq/apps/<appname>/<appname>.conf` Conf file for that app

* `/opt/lxq/apps/<appname>/<appname>.install` installation procedure

* `/opt/lxq/apps/<appname>/<appname>.rules` Firewall Rules for app

* `/opt/lxq/apps/<appname>/files/` files needed for installation or configuration

