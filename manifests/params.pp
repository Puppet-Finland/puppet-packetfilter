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
            $required_packages = $::operatingsystemmajrelease ? {
                6  => ['iptables', 'iptables-ipv6'],
                7  => ['iptables-services'],
                21 => ['iptables-services'],
            }
        }
        'Debian': {
            $required_packages = ['iptables-persistent']
            $service_name = $::lsbdistcodename ? {
                'jessie' => 'netfilter-persistent',
                default  => 'iptables-persistent',
            }
        }
        default: {
            fail("Unsupported OS: ${::osfamily}")
        }
    }
}
