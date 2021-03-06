package ansible

module: junos_lldp_interfaces: {
	module:            "junos_lldp_interfaces"
	version_added:     2.9
	short_description: "Manage link layer discovery protocol (LLDP) attributes of interfaces on Juniper JUNOS devices"
	description: [
		"This module manages link layer discovery protocol (LLDP) attributes of interfaces on Juniper JUNOS devices.",
	]
	author: "Ganesh Nalawade (@ganeshrn)"
	options: {
		config: {
			description: "The list of link layer discovery protocol interface attribute configurations"
			type:        "list"
			elements:    "dict"
			suboptions: {
				name: {
					description: [
						"Name of the interface LLDP needs to be configured on.",
					]
					type:     "str"
					required: true
				}
				enabled: {
					description: [
						"This is a boolean value to control disabling of LLDP on the interface C(name)",
					]
					type: "bool"
				}
			}
		}
		state: {
			description: [
				"The state of the configuration after module completion.",
			]
			type: "str"
			choices: [
				"merged",
				"replaced",
				"overridden",
				"deleted",
			]
			default: "merged"
		}
	}
}
