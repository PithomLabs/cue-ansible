package ansible

module: junos_vrf: {
	module:            "junos_vrf"
	version_added:     "2.4"
	author:            "Ganesh Nalawade (@ganeshrn)"
	short_description: "Manage the VRF definitions on Juniper JUNOS devices"
	description: [
		"This module provides declarative management of VRF definitions on Juniper JUNOS devices.  It allows playbooks to manage individual or the entire VRF collection.",
	]

	options: {
		name: description: [
			"The name of the VRF definition to be managed on the remote IOS device.  The VRF definition name is an ASCII string name used to uniquely identify the VRF.  This argument is mutually exclusive with the C(aggregate) argument",
		]

		description: description: [
			"Provides a short description of the VRF definition in the current active configuration.  The VRF definition value accepts alphanumeric characters used to provide additional information about the VRF.",
		]

		rd: description: [
			"The router-distinguisher value uniquely identifies the VRF to routing processes on the remote IOS system.  The RD value takes the form of C(A:B) where C(A) and C(B) are both numeric values.",
		]

		interfaces: description: [
			"Identifies the set of interfaces that should be configured in the VRF. Interfaces must be routed interfaces in order to be placed into a VRF.",
		]

		target: description: [
			"It configures VRF target community configuration. The target value takes the form of C(target:A:B) where C(A) and C(B) are both numeric values.",
		]

		table_label: {
			description: [
				"Causes JUNOS to allocate a VPN label per VRF rather than per VPN FEC. This allows for forwarding of traffic to directly connected subnets, COS Egress filtering etc.",
			]

			type: "bool"
		}
		aggregate: description: [
			"The set of VRF definition objects to be configured on the remote JUNOS device.  Ths list entries can either be the VRF name or a hash of VRF definitions and attributes.  This argument is mutually exclusive with the C(name) argument.",
		]

		state: {
			description: [
				"Configures the state of the VRF definition as it relates to the device operational configuration.  When set to I(present), the VRF should be configured in the device active configuration and when set to I(absent) the VRF should not be in the device active configuration",
			]

			default: "present"
			choices: ["present", "absent"]
		}
		active: {
			description: [
				"Specifies whether or not the configuration is active or deactivated",
			]
			default: true
			type:    "bool"
		}
	}
	requirements: [
		"ncclient (>=v0.5.2)",
	]
	notes: [
		"This module requires the netconf system service be enabled on the remote device being managed.",
		"Tested against vSRX JUNOS version 15.1X49-D15.4, vqfx-10000 JUNOS Version 15.1X53-D60.4.",
		"Recommended connection is C(netconf). See L(the Junos OS Platform Options,../network/user_guide/platform_junos.html).",
		"This module also works with C(local) connections for legacy playbooks.",
	]
	extends_documentation_fragment: "junos"
}
