#
# == Class: packetfilter::accept:inbound
#
# Typical set of inbound accept rules for endpoint nodes. Allows related and 
# established packets, ICMP requests and SSH connections.
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
class packetfilter::accept::inbound($stage = 'packetfilter-pre') {

    # IPv4 iptables rules
    firewall { '000 ipv4 accept related and established':
        provider => 'iptables',
        chain => 'INPUT',
        proto => 'all',
        state => [ 'ESTABLISHED', 'RELATED' ],
        action => 'accept',
    }

    firewall { '001 ipv4 accept all icmp requests':
        provider => 'iptables',
        chain => 'INPUT',
        proto => 'icmp',
        action => 'accept',
    }

    firewall { '002 ipv4 accept ssh':
        provider => 'iptables',
        chain  => 'INPUT',
        proto => 'tcp',
        port => 22,
        limit => '3/min',
        action => 'accept',
    }

    firewall { '003 ipv4 accept loopback':
        provider => 'iptables',
        chain  => 'INPUT',
        proto => 'all',
        state => [ 'NEW' ],
        iniface => 'lo',
        action => 'accept',
    }

    # IPv6 iptables rules

    firewall { '000 ipv6 accept related and established':
        provider => 'ip6tables',
        chain => 'INPUT',
        proto => 'all',
        state => [ 'ESTABLISHED', 'RELATED' ],
        action => 'accept',
    }

    # This is required for IPv6
    firewall { '001 ipv6 accept all icmp requests':
        provider => 'ip6tables',
        chain => 'INPUT',
        proto => 'icmp',
        action => 'accept',
    }

    # This is required for IPv6
    firewall { '001 ipv6 accept all ipv6-icmp requests':
        provider => 'ip6tables',
        chain => 'INPUT',
        proto => 'ipv6-icmp',
        action => 'accept',
    }

    firewall { '002 ipv6 accept ssh':
        provider => 'ip6tables',
        chain  => 'INPUT',
        proto => 'tcp',
        port => 22,
        # 'limit' not supported for ipv6
        #limit => '3/min',
        action => 'accept',
    }

    firewall { '003 ipv6 accept loopback':
        provider => 'ip6tables',
        chain  => 'INPUT',
        proto => 'all',
        iniface => 'lo',
        action => 'accept',
    }
}
