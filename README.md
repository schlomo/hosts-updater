# hosts-updater


Update entries in `/etc/hosts` from DNS every 5 minutes. This is most handy when using Hostname-based access control for hosts with dynamic IPs, e.g. managed via DynDNS.

Full documentation and usage can be found in the included [man page](hosts-updater.1.ronn)

## Building a DEB


Run `make deb` to build the DEB package in out. You'll need to install [ronn](https://github.com/rtomayko/ronn) to build the package, it is used to create the man page.
