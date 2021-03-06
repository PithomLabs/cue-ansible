package ansible

module: net_ping: {
	module:            "net_ping"
	version_added:     "2.4"
	author:            "Jacob McGill (@jmcgill298)"
	short_description: "Tests reachability using ping from a network device"
	description: [
		"Tests reachability using ping from network device to a remote destination.",
		"For Windows targets, use the M(win_ping) module instead.",
		"For targets running Python, use the M(ping) module instead.",
	]
	extends_documentation_fragment: "network_agnostic"
	options: {
		count: {
			description: [
				"Number of packets to send.",
			]
			default: 5
		}
		dest: {
			description: [
				"The IP Address or hostname (resolvable by switch) of the remote node.",
			]
			required: true
		}
		source: description: [
			"The source IP Address.",
		]
		state: {
			description: [
				"Determines if the expected result is success or fail.",
			]
			choices: ["absent", "present"]
			default: "present"
		}
		vrf: {
			description: [
				"The VRF to use for forwarding.",
			]
			default: "default"
		}
	}
	notes: [
		"For Windows targets, use the M(win_ping) module instead.",
		"For targets running Python, use the M(ping) module instead.",
	]
}
