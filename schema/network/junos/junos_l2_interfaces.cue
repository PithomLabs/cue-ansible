package ansible

module: junos_l2_interfaces: {
	module:            "junos_l2_interfaces"
	version_added:     2.9
	short_description: "Manage Layer-2 interface on Juniper JUNOS devices"
	description:       "This module provides declarative management of a Layer-2 interface on Juniper JUNOS devices."
	author:            "Ganesh Nalawade (@ganeshrn)"
	options: {
		config: {
			description: "A dictionary of Layer-2 interface options"
			type:        "list"
			elements:    "dict"
			suboptions: {
				name: {
					description: [
						"Full name of interface, e.g. ge-0/0/1.",
					]
					type:     "str"
					required: true
				}
				unit: {
					description: [
						"Logical interface number. Value of C(unit) should be of type integer.",
					]

					type: "int"
				}
				access: {
					description: [
						"Configure the interface as a Layer 2 access mode.",
					]
					type: "dict"
					suboptions: vlan: {
						description: [
							"Configure the access VLAN ID.",
						]
						type: "str"
					}
				}
				trunk: {
					description: [
						"Configure the interface as a Layer 2 trunk mode.",
					]
					type: "dict"
					suboptions: {
						allowed_vlans: {
							description: [
								"List of VLANs to be configured in trunk port. It's used as the VLAN range to ADD or REMOVE from the trunk.",
							]

							type: "list"
						}
						native_vlan: {
							description: [
								"Native VLAN to be configured in trunk port. It is used as the trunk native VLAN ID.",
							]
							type: "str"
						}
					}
				}
				enhanced_layer: {
					description: [
						"True if your device has Enhanced Layer 2 Software (ELS). If the l2 configuration is under C(interface-mode) the value is True else if the l2 configuration is under C(port-mode) value is False",
					]

					type: "bool"
				}
			}
		}
		state: {
			choices: [
				"merged",
				"replaced",
				"overridden",
				"deleted",
			]
			default: "merged"
			description: [
				"The state of the configuration after module completion",
			]
			type: "str"
		}
	}
	requirements: [
		"ncclient (>=v0.6.4)",
	]
	notes: [
		"This module requires the netconf system service be enabled on the remote device being managed.",
		"Tested against vSRX JUNOS version 18.4R1.",
		"This module works with connection C(netconf). See L(the Junos OS Platform Options,../network/user_guide/platform_junos.html).",
	]
}
