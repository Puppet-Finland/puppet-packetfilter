#
# == Class: packetfilter::deny::forwarded
#
# Deny all traffic to be forwarded somewhere else
#
# == Params
# 
# None at the moment
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
# Samuli Seppänen <samuli@openvpn.net>
#
class packetfilter::deny::forwarded() {

    firewallchain { 'FORWARD:filter:IPv4':
        policy => 'drop',
        purge  => true,
    }

    firewallchain { 'FORWARD:filter:IPv6':
        policy => 'drop',
        purge  => true,
    }
}
