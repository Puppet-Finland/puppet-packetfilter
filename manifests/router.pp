#
# == Class: packetfilter::router
#
# Typical set of rules for simplistic router nodes. Allows only limited inbound 
# traffic without placing restrictions on outbound traffic. This also sets the 
# net.ipv4.ip_forward sysctl parameter to 1; without that change this class 
# would not do much good.
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
class packetfilter::router
(
    $source,
    $iniface,
    $outiface
)
{
    ensure_resource('sysctl::value', 'net.ipv4.ip_forward', { 'value' => 1 })

    # Masquerade rules
    firewall { "101 ipv4 masquerade ${outiface}":
        protocol => 'iptables',
        chain    => 'POSTROUTING',
        proto    => 'all',
        outiface => $outiface,
        source   => $source,
        table    => 'nat',
        jump     => 'MASQUERADE',
    }

    # INPUT chain
    firewall { '102 ipv4 accept masquerade iniface':
        protocol => 'iptables',
        chain    => 'INPUT',
        proto    => 'all',
        state    => 'NEW',
        iniface  => $iniface,
        jump     => 'accept',
    }

    # FORWARD chain
    firewall { '102 ipv4 forward masquerade iniface':
        protocol => 'iptables',
        chain    => 'FORWARD',
        proto    => 'all',
        state    => 'NEW',
        iniface  => $iniface,
        jump     => 'accept',
    }

    firewall { '104 ipv4 forward related and established':
        protocol => 'iptables',
        chain    => 'FORWARD',
        proto    => 'all',
        state    => [ 'ESTABLISHED', 'RELATED' ],
        jump     => 'accept',
    }
}
