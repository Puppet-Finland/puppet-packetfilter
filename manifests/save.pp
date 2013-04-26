#
# == Class: packetfilter::save
#
# Defines some variables based on the operating system
# 
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
class packetfilter::save ($stage="packetfilter-save") {

    include packetfilter::params

	# Save IPv4 rules
	exec { "packetfilter-ipv4-save":
		command => $packetfilter::params::iptables_save_cmd,
	}

	# Save IPv6 rules
	exec { "packetfilter-ipv6-save":
		command => $packetfilter::params::ip6tables_save_cmd,
	}
}
