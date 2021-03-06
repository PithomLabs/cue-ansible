package ansible

module: dimensiondata_vlan: {
	module:            "dimensiondata_vlan"
	short_description: "Manage a VLAN in a Cloud Control network domain."
	extends_documentation_fragment: [
		"dimensiondata",
		"dimensiondata_wait",
	]
	description: [
		"Manage VLANs in Cloud Control network domains.",
	]
	version_added: "2.5"
	author:        "Adam Friedman (@tintoy)"
	options: {
		name: description: [
			"The name of the target VLAN.",
			"Required if C(state) is C(present).",
		]
		description: description: [
			"A description of the VLAN.",
		]
		network_domain: {
			description: [
				"The Id or name of the target network domain.",
			]
			required: true
		}
		private_ipv4_base_address: description: [
			"The base address for the VLAN's IPv4 network (e.g. 192.168.1.0).",
		]
		private_ipv4_prefix_size: description: [
			"The size of the IPv4 address space, e.g 24.",
			"Required, if C(private_ipv4_base_address) is specified.",
		]
		state: {
			description: [
				"The desired state for the target VLAN.",
				"C(readonly) ensures that the state is only ever read, not modified (the module will fail if the resource does not exist).",
			]
			choices: ["present", "absent", "readonly"]
			default: "present"
		}
		allow_expand: {
			description: [
				"Permit expansion of the target VLAN's network if the module parameters specify a larger network than the VLAN currently possesses.",
				"If C(False), the module will fail under these conditions.",
				"This is intended to prevent accidental expansion of a VLAN's network (since this operation is not reversible).",
			]
			type:    "bool"
			default: "no"
		}
	}
}
