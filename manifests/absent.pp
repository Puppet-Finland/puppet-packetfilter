#
# == Class: packetfilter::absent
#
# Various obsolete configurations that are removed automatically to prevent 
# problems.
#
class packetfilter::absent {

    # New puppetlabs firewall modules have built-in rule persistance, so we can do 
    # away with the slightly more hacky local implementation based on the rclocal 
    # module.
    file { 'packetfilter-packetfilter':
            name => '/etc/rc.local.d/packetfilter',
            ensure => absent,
    }
}
