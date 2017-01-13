#
# == Class: packetfilter::deny::inbound
#
# Drop all requests not specifically allowed
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
class packetfilter::deny::inbound () {

    firewallchain { 'INPUT:filter:IPv4':
        policy => 'drop',
        purge  => true,
    }

    firewallchain { 'INPUT:filter:IPv6':
        policy => 'drop',
        purge  => true,
    }
}
