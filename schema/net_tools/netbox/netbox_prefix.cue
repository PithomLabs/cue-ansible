package ansible

module: netbox_prefix: {
	module:            "netbox_prefix"
	short_description: "Creates or removes prefixes from Netbox"
	description: [
		"Creates or removes prefixes from Netbox",
	]
	notes: [
		"Tags should be defined as a YAML list",
		"This should be ran with connection C(local) and hosts C(localhost)",
	]
	author: [
		"Mikhail Yohman (@FragmentedPacket)",
		"Anthony Ruhier (@Anthony25)",
	]
	requirements: [
		"pynetbox",
	]
	version_added: "2.8"
	options: {
		netbox_url: {
			description: [
				"URL of the Netbox instance resolvable by Ansible control host",
			]
			required: true
			type:     "str"
		}
		netbox_token: {
			description: [
				"The token created within Netbox to authorize API access",
			]
			required: true
			type:     "str"
		}
		data: {
			description: [
				"Defines the prefix configuration",
			]
			suboptions: {
				family: {
					description: [
						"Specifies which address family the prefix prefix belongs to",
					]
					choices: [
						4,
						6,
					]
					type: "int"
				}
				prefix: {
					description: [
						"Required if state is C(present) and first_available is False. Will allocate or free this prefix.",
					]
					type: "str"
				}
				parent: {
					description: [
						"Required if state is C(present) and first_available is C(yes). Will get a new available prefix in this parent prefix.",
					]
					type: "str"
				}
				prefix_length: {
					description: [
						"""
		Required ONLY if state is C(present) and first_available is C(yes).
		Will get a new available prefix of the given prefix_length in this parent prefix.

		""",
					]

					type: "str"
				}
				site: {
					description: [
						"Site that prefix is associated with",
					]
					type: "str"
				}
				vrf: {
					description: [
						"VRF that prefix is associated with",
					]
					type: "str"
				}
				tenant: {
					description: [
						"The tenant that the prefix will be assigned to",
					]
					type: "str"
				}
				vlan: {
					description: [
						"The VLAN the prefix will be assigned to",
					]
					type: "dict"
				}
				status: {
					description: [
						"The status of the prefix",
					]
					choices: [
						"Active",
						"Container",
						"Deprecated",
						"Reserved",
					]
					type: "str"
				}
				role: {
					description: [
						"The role of the prefix",
					]
					type: "str"
				}
				is_pool: {
					description: [
						"All IP Addresses within this prefix are considered usable",
					]
					type: "bool"
				}
				description: {
					description: [
						"The description of the prefix",
					]
					type: "str"
				}
				tags: {
					description: [
						"Any tags that the prefix may need to be associated with",
					]
					type: "list"
				}
				custom_fields: {
					description: [
						"Must exist in Netbox and in key/value format",
					]
					type: "dict"
				}
			}
			required: true
		}
		state: {
			description: [
				"Use C(present) or C(absent) for adding or removing.",
			]
			choices: ["absent", "present"]
			default: "present"
		}
		first_available: {
			description: [
				"If C(yes) and state C(present), if an parent is given, it will get the first available prefix of the given prefix_length inside the given parent (and vrf, if given). Unused with state C(absent).",
			]

			default: "no"
			type:    "bool"
		}
		validate_certs: {
			description: [
				"If C(no), SSL certificates will not be validated. This should only be used on personally controlled sites using self-signed certificates.",
			]
			default: "yes"
			type:    "bool"
		}
	}
}
