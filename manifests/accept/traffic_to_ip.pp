# == Define: packetfilter::accept::traffic_to_ip
#
# Allow traffic to/from a specific IPv4/IPv6 IPs
#
# == Parameters
#
# [*iface*]
#   The interface the rule applies to
# [*ipv4_address*]
#   Allow (all) traffic to/from this IPv4 address
# [*ipv6_address*]
#   Allow (all) traffic to/from this IPv6 address
#
# == Examples
#
#   packetfilter::accept::traffic_to_ip { 'allow access from management node':
#       iface => 'eth0',
#       ipv4_address => '192.168.30.30',
#       ipv6_address => '::1',
#   }
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
define packetfilter::accept::traffic_to_ip(
    $iface,
    $ipv4_address,
    $ipv6_address
)
{
    firewall { "007 ipv4 accept outbound to ${ipv4_address}":
        protocol    => 'iptables',
        chain       => 'OUTPUT',
        proto       => 'all',
        jump        => 'accept',
        destination => $ipv4_address,
        outiface    => $iface,
    }

    firewall { "007 ipv4 accept inbound from ${ipv4_address}":
        protocol => 'iptables',
        chain    => 'INPUT',
        proto    => 'all',
        jump     => 'accept',
        source   => $ipv4_address,
        iniface  => $iface,
    }

    firewall { "007 ipv6 accept outbound to ${ipv6_address}":
        protocol    => 'ip6tables',
        chain       => 'OUTPUT',
        proto       => 'all',
        jump        => 'accept',
        destination => $ipv6_address,
        outiface    => $iface,
    }

    firewall { "007 ipv6 accept inbound from ${ipv6_address}":
        protocol => 'ip6tables',
        chain    => 'INPUT',
        proto    => 'all',
        jump     => 'accept',
        source   => $ipv6_address,
        iniface  => $iface,
    }
}
