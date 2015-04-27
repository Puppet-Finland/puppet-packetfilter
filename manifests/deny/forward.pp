#
# == Class: packetfilter::deny::forward
#
# Deny forwarding packets from source IP to destination IP
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
define packetfilter::deny::forward
(
    $source,
    $destination
)
{
    # This can be at the beginning of the chain because it's just a selective
    # block. More overreaching blocks should be at the very end.
    firewall { "004 ipv4 deny forward from ${source} to ${destination}":
        provider    => 'iptables',
        chain       => 'FORWARD',
        proto       => 'all',
        action      => 'drop',
        source      => $source,
        destination => $destination,
    }
}
