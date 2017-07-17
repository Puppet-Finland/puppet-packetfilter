#
# == Class: packetfilter::endpoint
# 
# Typical set of rules for endpoint nodes
#
# This class sets a sane default set of ACCEPT rules to prevent one from getting 
# locked out from a node, and sets the default policies for INPUT, FORWARD and
# OUTPUT chains.
#
class packetfilter::endpoint
(
    Enum['accept', 'drop'] $input_policy = 'drop',
    Enum['accept', 'drop'] $forward_policy = 'drop',
    Enum['accept', 'drop'] $output_policy = 'accept',
    Boolean                $purge_unmanaged = true
)
{
    # This class includes puppetlabs/firewall and collects virtual Firewall 
    # resources from other classes
    include ::packetfilter

    # Configure a sane default set of (accept) rules
    # IPv4 iptables rules
    firewall { '000 ipv4 accept related and established':
        provider => 'iptables',
        chain    => 'INPUT',
        proto    => 'all',
        state    => [ 'ESTABLISHED', 'RELATED' ],
        action   => 'accept',
    }

    firewall { '001 ipv4 accept all icmp requests':
        provider => 'iptables',
        chain    => 'INPUT',
        proto    => 'icmp',
        action   => 'accept',
    }

    firewall { '002 ipv4 accept ssh':
        provider => 'iptables',
        chain    => 'INPUT',
        proto    => 'tcp',
        dport    => 22,
        limit    => '3/min',
        action   => 'accept',
    }

    firewall { '003 ipv4 accept loopback':
        provider => 'iptables',
        chain    => 'INPUT',
        proto    => 'all',
        state    => [ 'NEW' ],
        iniface  => 'lo',
        action   => 'accept',
    }

    # IPv6 iptables rules
    firewall { '000 ipv6 accept related and established':
        provider => 'ip6tables',
        chain    => 'INPUT',
        proto    => 'all',
        state    => [ 'ESTABLISHED', 'RELATED' ],
        action   => 'accept',
    }

    # This is required for IPv6
    firewall { '001 ipv6 accept all icmp requests':
        provider => 'ip6tables',
        chain    => 'INPUT',
        proto    => 'icmp',
        action   => 'accept',
    }

    # This is required for IPv6
    firewall { '001 ipv6 accept all ipv6-icmp requests':
        provider => 'ip6tables',
        chain    => 'INPUT',
        proto    => 'ipv6-icmp',
        action   => 'accept',
    }

    # This is required for DHCPv6
    firewall { '001 ipv6 accept DHCPv6 responses':
        provider => 'ip6tables',
        chain    => 'INPUT',
        proto    => 'udp',
        port     => 546,
        action   => 'accept',
    }

    firewall { '002 ipv6 accept ssh':
        provider => 'ip6tables',
        chain    => 'INPUT',
        proto    => 'tcp',
        dport    => 22,
        # 'limit' not supported for ipv6
        #limit => '3/min',
        action   => 'accept',
    }

    firewall { '003 ipv6 accept loopback':
        provider => 'ip6tables',
        chain    => 'INPUT',
        proto    => 'all',
        iniface  => 'lo',
        action   => 'accept',
    }

    # Set policies for the firewall chains
    Firewallchain {
        purge => $purge_unmanaged,
    }

    firewallchain { 'INPUT:filter:IPv4':
        policy => $input_policy,
    }
    firewallchain { 'INPUT:filter:IPv6':
        policy => $input_policy,
    }
    firewallchain { 'FORWARD:filter:IPv4':
        policy => $forward_policy,
    }
    firewallchain { 'FORWARD:filter:IPv6':
        policy => $forward_policy,
    }
    firewallchain { 'OUTPUT:filter:IPv4':
        policy => $output_policy,
    }
    firewallchain { 'OUTPUT:filter:IPv6':
        policy => $output_policy,
    }
}
