#
# == Class: packetfilter::deny::outbound
#
# Deny outbound traffic on an interface. FIXME: add support for destination IP
# and port parameters.
#
# == Params
#
# [*iface*]
#   Outbound interface on which to block outbound traffic.
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
define packetfilter::deny::outbound
(
    $iface,
    $stage='packetfilter-post'
)
{
	firewall { "999 ipv4 deny outbound to ${iface}":
		provider => 'iptables',
		chain  => 'OUTPUT',
		proto => 'all',
		action => 'drop',
		outiface => "${iface}",
	}

	firewall { "999 ipv6 deny outbound to ${iface}":
		provider => 'ip6tables',
		chain  => 'OUTPUT',
		proto => 'all',
		action => 'drop',
		outiface => "${iface}",
	}
}
