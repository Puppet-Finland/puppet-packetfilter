#
# == Class: packetfilter::router
#
# Typical set of rules for router nodes. Allows only limited inbound traffic 
# without placing restrictions on outbound traffic. Forwarding rules can be 
# adjusted fairly granularly.
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
class packetfilter::router
(
    $allow_source,
    $allow_destination = '0.0.0.0'
)
{
    include packetfilter::endpoint

    packetfilter::accept::forward { 'packetfilter router':
        source => $allow_source,
        destination => $allow_destination,
        proto => '',
        dport => '',
    }
}
