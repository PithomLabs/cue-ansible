package ansible

module: fortios_router_policy: {
	module:            "fortios_router_policy"
	short_description: "Configure IPv4 routing policies in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify router feature and policy category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
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
		router_policy: {
			description: [
				"Configure IPv4 routing policies.",
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
				action: {
					description: [
						"Action of the policy route.",
					]
					type: "str"
					choices: [
						"deny",
						"permit",
					]
				}
				comments: {
					description: [
						"Optional comments.",
					]
					type: "str"
				}
				dst: {
					description: [
						"Destination IP and mask (x.x.x.x/x).",
					]
					type: "list"
					suboptions: subnet: {
						description: [
							"IP and mask.",
						]
						required: true
						type:     "str"
					}
				}
				dst_negate: {
					description: [
						"Enable/disable negating destination address match.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				dstaddr: {
					description: [
						"Destination address name.",
					]
					type: "list"
					suboptions: name: {
						description: [
							"Address/group name. Source firewall.address.name firewall.addrgrp.name.",
						]
						required: true
						type:     "str"
					}
				}
				end_port: {
					description: [
						"End destination port number (0 - 65535).",
					]
					type: "int"
				}
				end_source_port: {
					description: [
						"End source port number (0 - 65535).",
					]
					type: "int"
				}
				gateway: {
					description: [
						"IP address of the gateway.",
					]
					type: "str"
				}
				input_device: {
					description: [
						"Incoming interface name.",
					]
					type: "list"
					suboptions: name: {
						description: [
							"Interface name. Source system.interface.name.",
						]
						required: true
						type:     "str"
					}
				}
				output_device: {
					description: [
						"Outgoing interface name. Source system.interface.name.",
					]
					type: "str"
				}
				protocol: {
					description: [
						"Protocol number (0 - 255).",
					]
					type: "int"
				}
				seq_num: {
					description: [
						"Sequence number.",
					]
					type: "int"
				}
				src: {
					description: [
						"Source IP and mask (x.x.x.x/x).",
					]
					type: "list"
					suboptions: subnet: {
						description: [
							"IP and mask.",
						]
						required: true
						type:     "str"
					}
				}
				src_negate: {
					description: [
						"Enable/disable negating source address match.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				srcaddr: {
					description: [
						"Source address name.",
					]
					type: "list"
					suboptions: name: {
						description: [
							"Address/group name. Source firewall.address.name firewall.addrgrp.name.",
						]
						required: true
						type:     "str"
					}
				}
				start_port: {
					description: [
						"Start destination port number (0 - 65535).",
					]
					type: "int"
				}
				start_source_port: {
					description: [
						"Start source port number (0 - 65535).",
					]
					type: "int"
				}
				status: {
					description: [
						"Enable/disable this policy route.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				tos: {
					description: [
						"Type of service bit pattern.",
					]
					type: "str"
				}
				tos_mask: {
					description: [
						"Type of service evaluated bits.",
					]
					type: "str"
				}
			}
		}
	}
}
