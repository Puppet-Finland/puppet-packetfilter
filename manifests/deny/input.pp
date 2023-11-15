#
# == Class: packetfilter::deny::input
#
# Deny incoming packets from source IP to destination IP
#
# == Params
#
# [*source*]
#   Source IP for the packets
# [*destination*]
#   Destination IP for the packets
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
define packetfilter::deny::input(
    $source,
    $destination
)
{
    firewall { "004 ipv4 deny input from ${source} to ${destination}":
        protocol    => 'iptables',
        chain       => 'INPUT',
        proto       => 'all',
        jump        => 'drop',
        source      => $source,
        destination => $destination,
    }
}
