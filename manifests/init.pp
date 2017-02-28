#
# == Class: packetfilter
#
# Common packet filtering configurations for any host that has a puppet-managed
# firewall. The puppetlabs/firewall module takes care of most of the basic
# setup.
#
# Other Puppet-Finland modules include per-daemon packet filtering rules, but 
# realize them only if this class, or any of its subclasses, is included on the 
# node.
#
# == Parameters
#
# None at the moment
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
# Samuli Seppänen <samuli@openvpn.net>
#
# Mikko Vilpponen <vilpponen@protecomp.fi>
# 
# == License
#
# BSD-license. See file LICENSE for details.
#
class packetfilter {

    # Basic setup by puppetlabs/packetfilter
    include ::firewall

    # Remove obsolete configurations
    include ::packetfilter::absent

    # Collect packet filter rules from other modules
    Firewall <| tag == 'default' |>
}
