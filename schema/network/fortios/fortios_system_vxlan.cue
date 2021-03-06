package ansible

module: fortios_system_vxlan: {
	module:            "fortios_system_vxlan"
	short_description: "Configure VXLAN devices in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify system feature and vxlan category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
	]

	version_added: "2.9"
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
			type:    "bool"
			default: true
		}
		state: {
			description: [
				"Indicates whether to create or remove the object.",
			]
			type:     "str"
			required: true
			choices: [
				"present",
				"absent",
			]
		}
		system_vxlan: {
			description: [
				"Configure VXLAN devices.",
			]
			default: null
			type:    "dict"
			suboptions: {
				dstport: {
					description: [
						"VXLAN destination port (1 - 65535).",
					]
					type: "int"
				}
				interface: {
					description: [
						"Outgoing interface for VXLAN encapsulated traffic. Source system.interface.name.",
					]
					type: "str"
				}
				ip_version: {
					description: [
						"IP version to use for the VXLAN interface and so for communication over the VXLAN. IPv4 or IPv6 unicast or multicast.",
					]
					type: "str"
					choices: [
						"ipv4-unicast",
						"ipv6-unicast",
						"ipv4-multicast",
						"ipv6-multicast",
					]
				}
				multicast_ttl: {
					description: [
						"VXLAN multicast TTL (1-255).",
					]
					type: "int"
				}
				name: {
					description: [
						"VXLAN device or interface name. Must be a unique interface name.",
					]
					required: true
					type:     "str"
				}
				remote_ip: {
					description: [
						"IPv4 address of the VXLAN interface on the device at the remote end of the VXLAN.",
					]
					type: "list"
					suboptions: ip: {
						description: [
							"IPv4 address.",
						]
						required: true
						type:     "str"
					}
				}
				remote_ip6: {
					description: [
						"IPv6 IP address of the VXLAN interface on the device at the remote end of the VXLAN.",
					]
					type: "list"
					suboptions: ip6: {
						description: [
							"IPv6 address.",
						]
						required: true
						type:     "str"
					}
				}
				vni: {
					description: [
						"VXLAN network ID.",
					]
					type: "int"
				}
			}
		}
	}
}
