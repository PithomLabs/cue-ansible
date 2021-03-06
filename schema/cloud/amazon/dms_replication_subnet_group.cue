package ansible

module: dms_replication_subnet_group: {
	module:            "dms_replication_subnet_group"
	short_description: "creates or destroys a data migration services subnet group"
	description: [
		"Creates or destroys a data migration services subnet group.",
	]
	version_added: "2.9"
	options: {
		state: {
			description: [
				"State of the subnet group.",
			]
			default: "present"
			choices: ["present", "absent"]
			type: "str"
		}
		identifier: {
			description: [
				"The name for the replication subnet group. This value is stored as a lowercase string. Must contain no more than 255 alphanumeric characters, periods, spaces, underscores, or hyphens. Must not be \"default\".",
			]

			type: "str"
		}
		description: {
			description: [
				"The description for the subnet group.",
			]
			type: "str"
		}
		subnet_ids: {
			description: [
				"A list containing the subnet ids for the replication subnet group, needs to be at least 2 items in the list.",
			]

			type:     "list"
			elements: "str"
		}
	}
	author: [
		"Rui Moreira (@ruimoreira)",
	]
	extends_documentation_fragment: [
		"aws",
		"ec2",
	]
}
