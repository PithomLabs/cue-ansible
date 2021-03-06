package ansible

module: pn_vrouter_packet_relay: {
	module:            "pn_vrouter_packet_relay"
	author:            "Pluribus Networks (@rajaspachipulusu17)"
	version_added:     "2.9"
	short_description: "CLI command to add/remove vrouter-packet-relay"
	description: [
		"This module can be used to add packet relay configuration for DHCP on vrouter and remove packet relay configuration for DHCP on vrouter.",
	]

	options: {
		pn_cliswitch: {
			description: [
				"Target switch to run the CLI on.",
			]
			required: false
			type:     "str"
		}
		state: {
			description: [
				"vrouter-packet-relay configuration command.",
			]
			required: false
			choices: ["present", "absent"]
			type:    "str"
			default: "present"
		}
		pn_forward_ip: {
			description: [
				"forwarding IP address.",
			]
			required: true
			type:     "str"
		}
		pn_nic: {
			description: [
				"NIC.",
			]
			required: true
			type:     "str"
		}
		pn_forward_proto: {
			description: [
				"protocol type to forward packets.",
			]
			required: false
			type:     "str"
			choices: ["dhcp"]
			default: "dhcp"
		}
		pn_vrouter_name: {
			description: [
				"name of service config.",
			]
			required: true
			type:     "str"
		}
	}
}
