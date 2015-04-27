# packetfilter

A general-purpose packetfilter module for Puppet. Uses Puppet Labs firewall for 
the hard lifting. Supports both IPv4 (iptables) and IPv6 (ip6tables).

Note that many of the subclasses could probably be merged if parameters and 
their default values were chosen carefully.

# Module usage

* [Class: packetfilter](manifests/init.pp)
* [Class: packetfilter::endpoint](manifests/endpoint.pp)
* [Class: packetfilter::router](manifests/router.pp)

# Dependencies

See [metadata.json](metadata.json).

# Operating system support

This module has been tested on

* Ubuntu 12.04 and 14.04
* Debian 7 and 8
* CentOS 6

Any Linux-based operating system should work with minor modifications.

For details see [params.pp](manifests/params.pp).
