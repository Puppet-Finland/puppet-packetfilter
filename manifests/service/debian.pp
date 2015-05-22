#
# == Class: packetfilter::service::debian
#
# Ensure that iptables rules are loaded on boot
#
class packetfilter::service::debian inherits packetfilter::params {

    service { 'iptables':
        name   => $::packetfilter::params::service_name,
        enable => true,
    }
}
