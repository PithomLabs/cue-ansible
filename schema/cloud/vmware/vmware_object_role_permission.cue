package ansible

module: vmware_object_role_permission: {
	module:            "vmware_object_role_permission"
	short_description: "Manage local roles on an ESXi host"
	description:       "This module can be used to manage object permissions on the given host."
	version_added:     2.8
	author: [
		"Derek Rushing (@kryptsi)",
		"Joseph Andreatta (@vmwjoseph)",
	]
	notes: [
		"Tested on ESXi 6.5, vSphere 6.7",
		"The ESXi login user must have the appropriate rights to administer permissions.",
		"Permissions for a distributed switch must be defined and managed on either the datacenter or a folder containing the switch.",
	]
	requirements: [
		"python >= 2.7",
		"PyVmomi",
	]
	options: {
		role: {
			description: [
				"The role to be assigned permission.",
			]
			required: true
			type:     "str"
		}
		principal: {
			description: [
				"The user to be assigned permission.",
				"Required if C(group) is not specified.",
			]
			type: "str"
		}
		group: {
			description: [
				"The group to be assigned permission.",
				"Required if C(principal) is not specified.",
			]
			type: "str"
		}
		object_name: {
			description: [
				"The object name to assigned permission.",
			]
			type:     "str"
			required: true
		}
		object_type: {
			description: [
				"The object type being targeted.",
			]
			default: "Folder"
			choices: [
				"Folder",
				"VirtualMachine",
				"Datacenter",
				"ResourcePool",
				"Datastore",
				"Network",
				"HostSystem",
				"ComputeResource",
				"ClusterComputeResource",
				"DistributedVirtualSwitch",
			]
			type: "str"
		}
		recursive: {
			description: [
				"Should the permissions be recursively applied.",
			]
			default: true
			type:    "bool"
		}
		state: {
			description: [
				"Indicate desired state of the object's permission.",
				"When C(state=present), the permission will be added if it doesn't already exist.",
				"When C(state=absent), the permission is removed if it exists.",
			]
			choices: ["present", "absent"]
			default: "present"
			type:    "str"
		}
	}
	extends_documentation_fragment: "vmware.documentation"
}
