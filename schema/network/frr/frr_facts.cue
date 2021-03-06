package ansible

module: frr_facts: {
	module:            "frr_facts"
	version_added:     "2.8"
	author:            "Nilashish Chakraborty (@NilashishC)"
	short_description: "Collect facts from remote devices running Free Range Routing (FRR)."
	description: [
		"Collects a base set of device facts from a remote device that is running FRR.  This module prepends all of the base network fact keys with C(ansible_net_<fact>).  The facts module will always collect a base set of facts from the device and can enable or disable collection of additional facts.",
	]

	notes: [
		"Tested against FRR 6.0.",
	]
	options: gather_subset: {
		description: [
			"When supplied, this argument restricts the facts collected to a given subset.",
			"Possible values for this argument include C(all), C(hardware), C(config), and C(interfaces).",
			"Specify a list of values to include a larger subset.",
			"Use a value with an initial C(!) to collect all facts except that subset.",
		]
		required: false
		default:  "!config"
	}
}
