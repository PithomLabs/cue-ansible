package ansible

module: junos_vlans: {
	module:            "junos_vlans"
	version_added:     2.9
	short_description: "Create and manage VLAN configurations on Junos OS"
	description:       "This module creates and manages VLAN configurations on Junos OS."
	author:            "Daniel Mellado (@danielmellado)"
	requirements: [
		"ncclient (>=v0.6.4)",
	]
	notes: [
		"This module requires the netconf system service be enabled on the remote device being managed",
		"Tested against Junos OS 18.4R1",
		"This module works with connection C(netconf). See L(the Junos OS Platform Options,../network/user_guide/platform_junos.html).",
	]

	options: {
		config: {
			description: "A dictionary of Vlan options"
			type:        "list"
			elements:    "dict"
			suboptions: {
				vlan_id: {
					description: [
						"IEEE 802.1q VLAN identifier for VLAN (1..4094).",
					]
					type:     "int"
					required: true
				}
				name: {
					description: [
						"Name of VLAN.",
					]
					type:     "str"
					required: true
				}
				description: {
					description: [
						"Text description of VLANs",
					]
					type: "str"
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
