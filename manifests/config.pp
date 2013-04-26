#
# == Class: packetfilter::config
#
# Setup run stages and install a rclocal script (if rclocal is used)
#
class packetfilter::config {
    # Define packetfilter stages: The initial rules are set in pre-stage,
    # before all normal rules. Rules belonging to the end are set in post-stage.
    # Finally, rules are saved to a file in the save-stage.
    
    stage {'packetfilter-pre':  before  => Stage['main'] }
    stage {'packetfilter-post': require => Stage['main'] }
    stage {'packetfilter-save': require => Stage['packetfilter-post'] }

	# Install a /etc/rc.local.d script to load the saved firewall 
	# rules on boot.
    if tagged('rclocal') {
	    rclocal::script { "packetfilter-rc.local-script":
		    modulename => "packetfilter",
	    }
    }
}
