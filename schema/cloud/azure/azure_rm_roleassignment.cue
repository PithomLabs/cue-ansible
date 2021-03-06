package ansible

module: azure_rm_roleassignment: {
	module:            "azure_rm_roleassignment"
	version_added:     "2.8"
	short_description: "Manage Azure Role Assignment"
	description: [
		"Create and delete instance of Azure Role Assignment.",
	]

	options: {
		name: description: [
			"Unique name of role assignment.",
		]
		assignee_object_id: description: [
			"The object id of assignee. This maps to the ID inside the Active Directory.",
			"It can point to a user, service principal or security group.",
			"Required when creating role assignment.",
		]
		role_definition_id: description: [
			"The role definition id used in the role assignment.",
			"Required when creating role assignment.",
		]
		scope: description: [
			"The scope of the role assignment to create.",
			"For example, use /subscriptions/{subscription-id}/ for subscription.",
			"/subscriptions/{subscription-id}/resourceGroups/{resource-group-name} for resource group.",
			"/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/{resource-provider}/{resource-type}/{resource-name} for resource.",
		]
		state: {
			description: [
				"Assert the state of the role assignment.",
				"Use C(present) to create or update a role assignment and C(absent) to delete it.",
			]
			default: "present"
			choices: [
				"absent",
				"present",
			]
		}
	}

	extends_documentation_fragment: [
		"azure",
	]

	author: [
		"Yunge Zhu(@yungezz)",
	]
}
