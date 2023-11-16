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
    $iface
)
{
    firewall { "99999 ipv4 deny outbound to ${iface}":
        protocol => 'iptables',
        chain    => 'OUTPUT',
        proto    => 'all',
        jump     => 'drop',
        outiface => $iface,
    }

    firewall { "99999 ipv6 deny outbound to ${iface}":
        protocol => 'ip6tables',
        chain    => 'OUTPUT',
        proto    => 'all',
        jump     => 'drop',
        outiface => $iface,
    }
}
