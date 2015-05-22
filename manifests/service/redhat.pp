#
# == Class: packetfilter::service::redhat
#
# Ensure that iptables and ip6tables services are enabled on boot and that 
# firewalld is disabled. This class was inspired by 
#
# <https://github.com/genebean/genebean-firewalld2iptables>
#
class packetfilter::service::redhat inherits packetfilter::params {

    service { 'firewalld':
        ensure => 'stopped',
        enable => false,
    }

    service { 'iptables':
        ensure  => 'running',
        enable  => true,
        require => Service['firewalld'],
    }

    service { 'ip6tables':
        ensure  => 'running',
        enable  => true,
        require => Service['firewalld'],
    }
}
