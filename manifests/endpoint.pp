#
# == Class: packetfilter::endpoint
# 
# Typical set of rules for endpoint nodes. Allows only limited inbound traffic 
# without placing restrictions on outbound traffic. This class can also be used 
# on routing VPN servers provided that appropriate ACCEPT rules are added to the 
# FORWARD chain.
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
class packetfilter::endpoint {

    include packetfilter
    include packetfilter::accept::inbound
    include packetfilter::deny::inbound
    include packetfilter::deny::forwarded
}
