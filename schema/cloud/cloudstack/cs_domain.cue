package ansible

module: cs_domain: {
	module:            "cs_domain"
	short_description: "Manages domains on Apache CloudStack based clouds."
	description: [
		"Create, update and remove domains.",
	]
	version_added: "2.0"
	author:        "René Moser (@resmo)"
	options: {
		path: {
			description: [
				"Path of the domain.",
				"Prefix C(ROOT/) or C(/ROOT/) in path is optional.",
			]
			type:     "str"
			required: true
		}
		network_domain: {
			description: ["Network domain for networks in the domain."]
			type: "str"
		}
		clean_up: {
			description: [
				"Clean up all domain resources like child domains and accounts.",
				"Considered on I(state=absent).",
			]
			type:    "bool"
			default: false
		}
		state: {
			description: ["State of the domain."]
			type: "str"
			choices: ["present", "absent"]
			default: "present"
		}
		poll_async: {
			description: ["Poll async jobs until job has finished."]
			type:    "bool"
			default: true
		}
	}
	extends_documentation_fragment: "cloudstack"
}
