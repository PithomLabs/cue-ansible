package ansible

module: fortios_firewall_internet_service: {
	module:            "fortios_firewall_internet_service"
	short_description: "Show Internet Service application in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify firewall feature and internet_service category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
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
		state: {
			description: [
				"Indicates whether to create or remove the object. This attribute was present already in previous version in a deeper level. It has been moved out to this outer level.",
			]

			type:     "str"
			required: false
			choices: [
				"present",
				"absent",
			]
			version_added: 2.9
		}
		firewall_internet_service: {
			description: [
				"Show Internet Service application.",
			]
			default: null
			type:    "dict"
			suboptions: {
				state: {
					description: [
						"B(Deprecated)",
						"Starting with Ansible 2.9 we recommend using the top-level 'state' parameter.",
						"HORIZONTALLINE",
						"Indicates whether to create or remove the object.",
					]
					type:     "str"
					required: false
					choices: [
						"present",
						"absent",
					]
				}
				database: {
					description: [
						"Database name this Internet Service belongs to.",
					]
					type: "str"
					choices: [
						"isdb",
						"irdb",
					]
				}
				direction: {
					description: [
						"How this service may be used in a firewall policy (source, destination or both).",
					]
					type: "str"
					choices: [
						"src",
						"dst",
						"both",
					]
				}
				entry: {
					description: [
						"Entries in the Internet Service database.",
					]
					type: "list"
					suboptions: {
						id: {
							description: [
								"Entry ID.",
							]
							required: true
							type:     "int"
						}
						ip_number: {
							description: [
								"Total number of IP addresses.",
							]
							type: "int"
						}
						ip_range_number: {
							description: [
								"Total number of IP ranges.",
							]
							type: "int"
						}
						port: {
							description: [
								"Integer value for the TCP/IP port (0 - 65535).",
							]
							type: "int"
						}
						protocol: {
							description: [
								"Integer value for the protocol type as defined by IANA (0 - 255).",
							]
							type: "int"
						}
					}
				}
				icon_id: {
					description: [
						"Icon ID of Internet Service.",
					]
					type: "int"
				}
				id: {
					description: [
						"Internet Service ID.",
					]
					required: true
					type:     "int"
				}
				name: {
					description: [
						"Internet Service name.",
					]
					type: "str"
				}
				offset: {
					description: [
						"Offset of Internet Service ID.",
					]
					type: "int"
				}
				reputation: {
					description: [
						"Reputation level of the Internet Service.",
					]
					type: "int"
				}
				sld_id: {
					description: [
						"Second Level Domain.",
					]
					type: "int"
				}
			}
		}
	}
}
