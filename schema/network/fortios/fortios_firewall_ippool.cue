package ansible

module: fortios_firewall_ippool: {
	module:            "fortios_firewall_ippool"
	short_description: "Configure IPv4 IP pools in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify firewall feature and ippool category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
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
		firewall_ippool: {
			description: [
				"Configure IPv4 IP pools.",
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
				arp_intf: {
					description: [
						"Select an interface from available options that will reply to ARP requests. (If blank, any is selected). Source system.interface.name.",
					]
					type: "str"
				}
				arp_reply: {
					description: [
						"Enable/disable replying to ARP requests when an IP Pool is added to a policy .",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				associated_interface: {
					description: [
						"Associated interface name. Source system.interface.name.",
					]
					type: "str"
				}
				block_size: {
					description: [
						"Number of addresses in a block (64 to 4096).",
					]
					type: "int"
				}
				comments: {
					description: [
						"Comment.",
					]
					type: "str"
				}
				endip: {
					description: [
						"Final IPv4 address (inclusive) in the range for the address pool (format xxx.xxx.xxx.xxx).",
					]
					type: "str"
				}
				name: {
					description: [
						"IP pool name.",
					]
					required: true
					type:     "str"
				}
				num_blocks_per_user: {
					description: [
						"Number of addresses blocks that can be used by a user (1 to 128).",
					]
					type: "int"
				}
				pba_timeout: {
					description: [
						"Port block allocation timeout (seconds).",
					]
					type: "int"
				}
				permit_any_host: {
					description: [
						"Enable/disable full cone NAT.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				source_endip: {
					description: [
						"Final IPv4 address (inclusive) in the range of the source addresses to be translated (format xxx.xxx.xxx.xxx).",
					]
					type: "str"
				}
				source_startip: {
					description: [
						" First IPv4 address (inclusive) in the range of the source addresses to be translated (format xxx.xxx.xxx.xxx).",
					]
					type: "str"
				}
				startip: {
					description: [
						"First IPv4 address (inclusive) in the range for the address pool (format xxx.xxx.xxx.xxx).",
					]
					type: "str"
				}
				type: {
					description: [
						"IP pool type (overload, one-to-one, fixed port range, or port block allocation).",
					]
					type: "str"
					choices: [
						"overload",
						"one-to-one",
						"fixed-port-range",
						"port-block-allocation",
					]
				}
			}
		}
	}
}
