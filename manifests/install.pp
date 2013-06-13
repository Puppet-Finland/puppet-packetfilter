#
# == Class: packetfilter::install
#
# Install tools required for packet filtering to work properly
#
class packetfilter::install($stage='packetfilter-pre') {

    if $osfamily == 'Debian' {
        package { 'packetfilter-iptables-persistent':
            name => 'iptables-persistent',
            ensure => installed,
        }
    }
}
