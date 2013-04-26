#
# == Class: packetfilter
#
# Convenience class to include typical endpoint rules from packetfilter::endpoint
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
# Mikko Vilpponen <vilpponen@protecomp.fi>
# 
class packetfilter {
    include packetfilter::endpoint
}
