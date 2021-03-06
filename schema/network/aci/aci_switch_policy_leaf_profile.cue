package ansible

module: aci_switch_policy_leaf_profile: {
	module:            "aci_switch_policy_leaf_profile"
	short_description: "Manage switch policy leaf profiles (infra:NodeP)"
	description: [
		"Manage switch policy leaf profiles on Cisco ACI fabrics.",
	]
	version_added: "2.5"
	options: {
		leaf_profile: {
			description: [
				"The name of the Leaf Profile.",
			]
			type: "str"
			aliases: ["leaf_profile_name", "name"]
		}
		description: {
			description: [
				"Description for the Leaf Profile.",
			]
			type: "str"
			aliases: ["descr"]
		}
		state: {
			description: [
				"Use C(present) or C(absent) for adding or removing.",
				"Use C(query) for listing an object or multiple objects.",
			]
			type: "str"
			choices: ["absent", "present", "query"]
			default: "present"
		}
	}
	extends_documentation_fragment: "aci"
	seealso: [{
		module: "aci_switch_policy_leaf_profile"
	}, {
		name:        "APIC Management Information Model reference"
		description: "More information about the internal APIC class B(infra:NodeP)."
		link:        "https://developer.cisco.com/docs/apic-mim-ref/"
	}]
	author: ["Bruno Calogero (@brunocalogero)"]
}
