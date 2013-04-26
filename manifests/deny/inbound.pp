#
# == Class: packetfilter::deny::inbound
#
# Drop all requests not specifically allowed
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
class packetfilter::deny::inbound ($stage='packetfilter-post') {
	include packetfilter::save

	firewall { '999 ipv4 drop all other requests':
		provider => 'iptables',
		chain => 'INPUT',
		proto => 'all',
		action => 'drop',
		notify => Class['packetfilter::save'],
	}

	firewall { '999 ipv6 drop all other requests':
		provider => 'ip6tables',
		chain => 'INPUT',
		proto => 'all',
		action => 'drop',
		notify => Class['packetfilter::save'],
	}
}