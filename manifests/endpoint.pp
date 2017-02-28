#
# == Class: packetfilter::endpoint
# 
# Typical set of rules for endpoint nodes. Allows only limited inbound traffic 
# without placing restrictions on outbound traffic. This class can also be used 
# on routing VPN servers provided that appropriate ACCEPT rules are added to the 
# FORWARD chain.
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
class packetfilter::endpoint
(
    Enum['accept', 'drop'] $input_policy = 'drop',
    Enum['accept', 'drop'] $forward_policy = 'drop',
    Enum['accept', 'drop'] $output_policy = 'accept',
    Boolean                $purge_unmanaged = true
)
{
    include ::packetfilter
    include ::packetfilter::accept::inbound

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
