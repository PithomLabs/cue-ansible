package ansible

module: fortios_log_null_device_filter: {
	module:            "fortios_log_null_device_filter"
	short_description: "Filters for null device logging in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify log_null_device feature and filter category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
	]

	version_added: "2.8"
	author: [
		"Miguel Angel Munoz (@mamunozgonzalez)",
		"Nicolas Thomas (@thomnico)",
	]
	notes: [
		"Requires fortiosapi library developed by Fortinet",
		"Run as a local_action in your playbook",
	]
	requirements: [
		"fortiosapi>=0.9.8",
	]
	options: {
		host: {
			description: [
				"FortiOS or FortiGate IP address.",
			]
			type:     "str"
			required: false
		}
		username: {
			description: [
				"FortiOS or FortiGate username.",
			]
			type:     "str"
			required: false
		}
		password: {
			description: [
				"FortiOS or FortiGate password.",
			]
			type:    "str"
			default: ""
		}
		vdom: {
			description: [
				"Virtual domain, among those defined previously. A vdom is a virtual instance of the FortiGate that can be configured and used as a different unit.",
			]

			type:    "str"
			default: "root"
		}
		https: {
			description: [
				"Indicates if the requests towards FortiGate must use HTTPS protocol.",
			]
			type:    "bool"
			default: true
		}
		ssl_verify: {
			description: [
				"Ensures FortiGate certificate must be verified by a proper CA.",
			]
			type:          "bool"
			default:       true
			version_added: 2.9
		}
		log_null_device_filter: {
			description: [
				"Filters for null device logging.",
			]
			default: null
			type:    "dict"
			suboptions: {
				anomaly: {
					description: [
						"Enable/disable anomaly logging.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				dns: {
					description: [
						"Enable/disable detailed DNS event logging.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				filter: {
					description: [
						"Null-device log filter.",
					]
					type: "str"
				}
				filter_type: {
					description: [
						"Include/exclude logs that match the filter.",
					]
					type: "str"
					choices: [
						"include",
						"exclude",
					]
				}
				forward_traffic: {
					description: [
						"Enable/disable forward traffic logging.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				gtp: {
					description: [
						"Enable/disable GTP messages logging.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				local_traffic: {
					description: [
						"Enable/disable local in or out traffic logging.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				multicast_traffic: {
					description: [
						"Enable/disable multicast traffic logging.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				netscan_discovery: {
					description: [
						"Enable/disable netscan discovery event logging.",
					]
					type: "str"
				}
				netscan_vulnerability: {
					description: [
						"Enable/disable netscan vulnerability event logging.",
					]
					type: "str"
				}
				severity: {
					description: [
						"Lowest severity level to log.",
					]
					type: "str"
					choices: [
						"emergency",
						"alert",
						"critical",
						"error",
						"warning",
						"notification",
						"information",
						"debug",
					]
				}
				sniffer_traffic: {
					description: [
						"Enable/disable sniffer traffic logging.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				ssh: {
					description: [
						"Enable/disable SSH logging.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				voip: {
					description: [
						"Enable/disable VoIP logging.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
			}
		}
	}
}
