#
# == Class: packetfilter::deny::forwarded
#
# Deny all traffic to be forwarded somewhere else
#
# == Params
# 
# None at the moment
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
# Samuli Seppänen <samuli@openvpn.net>
#
class packetfilter::deny::forwarded($stage='packetfilter-post') {

    firewall { '999 ipv4 deny all other requests':
        provider => 'iptables',
        chain  => 'FORWARD',
        proto => 'all',
        action => 'drop',
    }

    firewall { '999 ipv6 deny all other requests':
        provider => 'ip6tables',
        chain  => 'FORWARD',
        proto => 'all',
        action => 'drop',
    }
}
