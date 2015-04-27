#
# == Define: packetfilter::accept::forward
#
# Allow forwarding of packets from source IP to destination IP
#
# == Params
#
# [*source*]
#   Source IP for the packets
# [*destination*]
#   Destination IP for the packets
# [*proto*]
#   Protocol (e.g. tcp or udp). Defaults to '' (any protocol)
# [*dport*]
#   Destination port. Defaults to '' (any port)
#
# == Examples
#
#   define { 'packetfilter::accept::forward':
#       source => '192.168.40.8',
#       destination => '10.10.122.95',
#       proto => 'udp',
#       dport => 1194,
#   }
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
define packetfilter::accept::forward
(
    $source,
    $destination,
    $proto=undef,
    $dport=undef
)
{

    # If $proto is not defined, allow any protocol
    $protocol = $proto ? {
        undef   => 'all',
        default => $proto,
    }

    firewall { "001 ipv4 accept forward ${protocol} from ${source} to ${destination}:${dport}":
        provider    => 'iptables',
        chain       => 'FORWARD',
        action      => 'accept',
        source      => $source,
        destination => $destination,
        dport       => $dport,
        proto       => $protocol,
    }
}
