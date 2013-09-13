#
# == Class: packetfilter
#
# Common packet filtering configurations for any host that has a puppet-managed 
# firewall.
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
# Samuli Seppänen <samuli@openvpn.net>
# Mikko Vilpponen <vilpponen@protecomp.fi>
# 
class packetfilter {

# Rationale for this is explained in init.pp of the sshd module
if hiera('manage_packetfilter') != 'false' {

    # Define packetfilter stages: The initial rules are set in pre-stage,
    # before all normal rules. Rules belonging to the end are set in post-stage.
    stage {'packetfilter-pre':  before  => Stage['main'] }
    stage {'packetfilter-post': require => Stage['main'] }

    # Install the required packages
    include packetfilter::install

    # Remove obsolete configurations
    include packetfilter::absent
}
}
