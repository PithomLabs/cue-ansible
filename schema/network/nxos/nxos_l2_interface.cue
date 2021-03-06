package ansible

module: nxos_l2_interface: {
	module:                         "nxos_l2_interface"
	extends_documentation_fragment: "nxos"
	version_added:                  "2.5"
	short_description:              "Manage Layer-2 interface on Cisco NXOS devices."
	description: [
		"This module provides declarative management of Layer-2 interface on Cisco NXOS devices.",
	]

	deprecated: {
		removed_in:  "2.13"
		alternative: "nxos_l2_interfaces"
		why:         "Updated modules released with more functionality"
	}
	author: [
		"Trishna Guha (@trishnaguha)",
	]
	notes: [
		"Tested against NXOSv 7.0(3)I5(1).",
	]
	options: {
		name: {
			description: [
				"Full name of the interface excluding any logical unit number, i.e. Ethernet1/1.",
			]

			required: true
			aliases: ["interface"]
		}
		mode: {
			description: [
				"Mode in which interface needs to be configured.",
			]
			choices: ["access", "trunk"]
		}
		access_vlan: description: [
			"Configure given VLAN in access port. If C(mode=access), used as the access VLAN ID.",
		]

		native_vlan: description: [
			"Native VLAN to be configured in trunk port. If C(mode=trunk), used as the trunk native VLAN ID.",
		]

		trunk_vlans: {
			description: [
				"List of VLANs to be configured in trunk port. If C(mode=trunk), used as the VLAN range to ADD or REMOVE from the trunk.",
			]

			aliases: ["trunk_add_vlans"]
		}
		trunk_allowed_vlans: description: [
			"List of allowed VLANs in a given trunk port. If C(mode=trunk), these are the only VLANs that will be configured on the trunk, i.e. \"2-10,15\".",
		]

		aggregate: description: [
			"List of Layer-2 interface definitions.",
		]
		state: {
			description: [
				"Manage the state of the Layer-2 Interface configuration.",
			]
			default: "present"
			choices: ["present", "absent", "unconfigured"]
		}
	}
}
