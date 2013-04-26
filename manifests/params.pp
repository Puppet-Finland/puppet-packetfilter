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
    $iptables_save_cmd = $::osfamily ? {
        'RedHat'    => '/sbin/iptables-save > /etc/sysconfig/iptables',
        'Debian'    => '/sbin/iptables-save > /etc/iptables.save',
        default     => '/sbin/iptables-save > /etc/iptables.save',
    }

    $ip6tables_save_cmd = $::osfamily ? {
        'RedHat'    => '/sbin/ip6tables-save > /etc/sysconfig/ip6tables',
        'Debian'    => '/sbin/ip6tables-save > /etc/ip6tables.save',
        default     => '/sbin/ip6tables-save > /etc/ip6tables.save',
    }
}
