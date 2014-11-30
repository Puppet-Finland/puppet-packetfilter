#
# == Class: packetfilter::install
#
# Install tools required for packet filtering to work properly
#
class packetfilter::install
(
    $stage='packetfilter-pre'

) inherits packetfilter::params
{
    package { $::packetfilter::params::required_packages:
        ensure => installed,
    }
}
