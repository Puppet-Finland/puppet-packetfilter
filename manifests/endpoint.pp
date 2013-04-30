#
# == Class: packetfilter::endpoint
# 
# Typical set of rules for endpoint nodes. Allows only limited inbound traffic 
# without placing restrictions on outbound traffic.
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
class packetfilter::endpoint {
    include packetfilter::config
    include packetfilter::accept::inbound
    include packetfilter::deny::inbound
    include packetfilter::deny::forwarded
}
