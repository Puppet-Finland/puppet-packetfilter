#
# == Class: packetfilter::accept::outbound
#
# Typical set of outbound accept rules for endpoint nodes. Essentially accepts all outbound traffic.
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
class packetfilter::accept::outbound($stage = 'packetfilter-pre') {

    firewall { '004 ipv4 accept outbound':
        provider => 'iptables',
        chain    => 'OUTPUT',
        proto    => 'all',
        action   => 'accept',
    }

    firewall { '004 ipv6 accept outbound':
        provider => 'ip6tables',
        chain    => 'OUTPUT',
        proto    => 'all',
        action   => 'accept',
    }
}
