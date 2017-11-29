# packetfilter

A general-purpose packetfilter module for Puppet. Uses Puppet Labs firewall for
the hard lifting. Supports both IPv4 (iptables) and IPv6 (ip6tables).

Previously this module added blanket DENY rules to INPUT and FORWARD chains.
This was achieved with a separate run stage which came after the main stage. In
Puppet 3 this was a "belt-and-suspenders" approach in that prepending the
resource title with, say, '999' already had the same effect. Puppet's parse
order changed, however, in Puppet 4, and there was no longer any reasonable way
to order a resource except with explicit resource relationships or with run
stages. Setting such explicit relationships (as described in current
puppetlabs/firewall documentation) only works for simplistic cases, not when
firewall rules are combined from several different, independent modules, and
when one does not want to create arbitrary dependencies on the
"packetfilter::deny" classes.

Unfortunately run stages had two major problems in Puppet 4 at least:

* Rules in post run stage were not saved to /etc/iptables.save or equivalent
* They could create dependency cycles in some cases

So run stages had to go. In lieue of explicit resource relationships the only
fairly secure approach, which version 1.0.0 of this module uses, is to get rid
of the DENY rules, and replace them with a DROP policy for the whole chain. As
Puppet now applies resources in the parse order, we can be fairly certain that
the ACCEPT rules in packetfilter module get applied first, and only after that
the policy is set to DROP in the INPUT and FORWARD chains. Then other modules
can apply their ACCEPT rules in whatever order they want.

Many of the subclasses could probably be merged if parameters and their default
values were chosen carefully.

# Module usage

Typical usage on a leaf node from Hiera:

    classes:
        - packetfilter::endpoint

For details, see

* [Class: packetfilter](manifests/init.pp)
* [Class: packetfilter::endpoint](manifests/endpoint.pp)
* [Class: packetfilter::router](manifests/router.pp)

# Dependencies

See [metadata.json](metadata.json).

# Operating system support

This module has been tested on

* Ubuntu 12.04, 14.04 and 16.04
* Debian 7-9
* CentOS 6-7

Any Linux-based operating system should work with minor modifications.

For details see [params.pp](manifests/params.pp).
