#
# == Class: packetfilter::accept::outbound
#
# Typical set of outbound accept rules for endpoint nodes. Essentially accepts all outbound traffic.
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
class packetfilter::accept::outbound() {

    firewall { '004 ipv4 accept outbound':
        protocol => 'iptables',
        chain    => 'OUTPUT',
        proto    => 'all',
        jump     => 'accept',
    }

    firewall { '004 ipv6 accept outbound':
        protocol => 'ip6tables',
        chain    => 'OUTPUT',
        proto    => 'all',
        jump     => 'accept',
    }
}
