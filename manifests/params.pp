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
            # Nothing here at the moment
        }
        'Debian': {
            # Nothing here at the moment
        }
        default: {
            fail("Unsupported OS: ${::osfamily}")
        }
    }
}
