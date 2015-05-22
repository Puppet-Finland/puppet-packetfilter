#
# == Class: packetfilter::service
#
# Ensure that packet filtering is enabled on boot
#
class packetfilter::service {

    case $::osfamily {
        'RedHat': { include ::packetfilter::service::redhat }
        'Debian': { include ::packetfilter::service::debian }
        default:  { }
    }
}
