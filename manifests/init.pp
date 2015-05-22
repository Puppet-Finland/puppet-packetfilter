#
# == Class: packetfilter
#
# Common packet filtering configurations for any host that has a puppet-managed 
# firewall.
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

    # Define packetfilter stages: The initial rules are set in pre-stage,
    # before all normal rules. Rules belonging to the end are set in post-stage.
    stage {'packetfilter-pre':  before  => Stage['main'] }
    stage {'packetfilter-post': require => Stage['main'] }

    # Install the required packages
    include ::packetfilter::install

    # Enable iptables/ip6tables services
    include ::packetfilter::service

    # Remove obsolete configurations
    include ::packetfilter::absent
}
