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
            ensure => absent,
            name   => '/etc/rc.local.d/packetfilter',
    }

    Firewall {
        ensure => 'absent',
        action => 'drop',
        proto  => 'all',
    }

    # Remove DROP rules which are practically impossible to get at the end 
    # without run stages with Puppet 4's new parse order . The run stages, on 
    # other hand, have started causing various issues, such as dependency cycles 
    # and problems with iptables-save.
    firewall { '999 ipv4 drop all other requests':
        provider => 'iptables',
        chain    => 'INPUT',
    }
    firewall { '999 ipv6 drop all other requests':
        provider => 'ip6tables',
        chain    => 'INPUT',
    }
    firewall { '999 ipv4 deny all other requests':
        provider => 'iptables',
        chain    => 'FORWARD',
    }
    firewall { '999 ipv6 deny all other requests':
        provider => 'ip6tables',
        chain    => 'FORWARD',
    }
}
