package ansible

module: slxos_interface: {
	module:            "slxos_interface"
	version_added:     "2.6"
	author:            "Lindsay Hill (@LindsayHill)"
	short_description: "Manage Interfaces on Extreme SLX-OS network devices"
	description: [
		"This module provides declarative management of Interfaces on Extreme SLX-OS network devices.",
	]

	notes: [
		"Tested against SLX-OS 17s.1.02",
	]
	options: {
		name: {
			description: [
				"Name of the Interface.",
			]
			required: true
		}
		description: description: [
			"Description of Interface.",
		]
		enabled: {
			description: [
				"Interface link status.",
			]
			default: true
			type:    "bool"
		}
		speed: description: [
			"Interface link speed.",
		]
		mtu: description: [
			"Maximum size of transmit packet.",
		]
		tx_rate: description: [
			"Transmit rate in bits per second (bps).",
		]
		rx_rate: description: [
			"Receiver rate in bits per second (bps).",
		]
		neighbors: {
			description: [
				"Check the operational state of given interface C(name) for LLDP neighbor.",
				"The following suboptions are available.",
			]
			suboptions: {
				host: description: [
					"LLDP neighbor host for given interface C(name).",
				]
				port: description: [
					"LLDP neighbor port to which given interface C(name) is connected.",
				]
			}
		}
		aggregate: description: "List of Interfaces definitions."
		delay: {
			description: [
				"Time in seconds to wait before checking for the operational state on remote device. This wait is applicable for operational state argument which are I(state) with values C(up)/C(down), I(tx_rate) and I(rx_rate).",
			]

			default: 10
		}
		state: {
			description: [
				"State of the Interface configuration, C(up) means present and operationally up and C(down) means present and operationally C(down)",
			]

			default: "present"
			choices: ["present", "absent", "up", "down"]
		}
	}
}
