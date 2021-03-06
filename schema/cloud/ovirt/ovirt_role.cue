package ansible

module: ovirt_role: {
	module:            "ovirt_role"
	short_description: "Module to manage roles in oVirt/RHV"
	version_added:     "2.8"
	author:            "Martin Necas (@mnecas)"
	description: [
		"Module to manage roles in oVirt/RHV.",
	]
	options: {
		name: description: [
			"Name of the role to manage.",
		]
		id: description: [
			"ID of the role to manage.",
		]
		description: description: [
			"Description of the role.",
		]
		state: {
			description: [
				"Should the role be present/absent.",
			]
			choices: ["present", "absent"]
			default: "present"
		}
		administrative: {
			description: [
				"Defines the role as administrative-only or not.",
			]
			type: "bool"
		}
		permits: description: [
			"List of permits which role will have",
			"Permit 'login' is default and all roles will have it.",
			"List can contain name of permit.",
		]
	}
	extends_documentation_fragment: "ovirt"
}
