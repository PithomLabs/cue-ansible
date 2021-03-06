package ansible

module: fmgr_device_group: {
	module:        "fmgr_device_group"
	version_added: "2.8"
	notes: [
		"Full Documentation at U(https://ftnt-ansible-docs.readthedocs.io/en/latest/).",
	]
	author: [
		"Luke Weighall (@lweighall)",
		"Andrew Welsh (@Ghilli3)",
		"Jim Huber (@p4r4n0y1ng)",
	]
	short_description: "Alter FortiManager device groups."
	description: [
		"Add or edit device groups and assign devices to device groups FortiManager Device Manager using JSON RPC API.",
	]

	options: {
		adom: {
			description: [
				"The ADOM the configuration should belong to.",
			]
			required: false
			default:  "root"
		}

		vdom: {
			description: [
				"The VDOM of the Fortigate you want to add, must match the device in FMGR. Usually root.",
			]
			required: false
			default:  "root"
		}

		mode: {
			description: [
				"Sets one of three modes for managing the object.",
				"Allows use of soft-adds instead of overwriting existing values",
			]
			choices: ["add", "set", "delete", "update"]
			required: false
			default:  "add"
		}

		grp_name: {
			description: [
				"The name of the device group.",
			]
			required: false
		}

		grp_desc: {
			description: [
				"The description of the device group.",
			]
			required: false
		}

		grp_members: {
			description: [
				"A comma separated list of device names or device groups to be added as members to the device group.",
				"If Group Members are defined, and mode=\"delete\", only group members will be removed.",
				"If you want to delete a group itself, you must omit this parameter from the task in playbook.",
			]
			required: false
		}
	}
}
