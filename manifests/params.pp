#
# == Class: packetfilter::params
#
# Defines some variables based on the operating system
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
class packetfilter::params {

    case $::osfamily {
        'RedHat': {
            $required_packages = ['iptables-ipv6']
        }
        'Debian': {
            $required_packages = ['iptables-persistent']
        }
        default: {
            fail("Unsupported OS: ${::osfamily}")
        }
    }
}
