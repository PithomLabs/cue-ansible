package ansible

module: na_ontap_unix_group: {
	author: "NetApp Ansible Team (@carchi8py) <ng-ansibleteam@netapp.com>"
	description: [
		"Create/Delete Unix user group",
	]
	extends_documentation_fragment: [
		"netapp.na_ontap",
	]
	module: "na_ontap_unix_group"
	options: {
		state: {
			description: [
				"Whether the specified group should exist or not.",
			]
			choices: ["present", "absent"]
			default: "present"
		}

		name: {
			description: [
				"Specifies UNIX group's name, unique for each group.",
				"Non-modifiable.",
			]
			required: true
		}

		id: description: [
			"Specifies an identification number for the UNIX group.",
			"Group ID is unique for each UNIX group.",
			"Required for create, modifiable.",
		]

		vserver: {
			description: [
				"Specifies the Vserver for the UNIX group.",
				"Non-modifiable.",
			]
			required: true
		}

		skip_name_validation: {
			description: [
				"Specifies if group name validation is skipped.",
			]
			type: "bool"
		}

		users: {
			description: [
				"Specifies the users associated with this group. Should be comma separated.",
				"It represents the expected state of a list of users at any time.",
				"Add a user into group if it is specified in expected state but not in current state.",
				"Delete a user from group if it is specified in current state but not in expected state.",
				"To delete all current users, use '' as value.",
			]
			type:          "list"
			version_added: "2.9"
		}
	}

	short_description: "NetApp ONTAP UNIX Group"
	version_added:     "2.8"
}
