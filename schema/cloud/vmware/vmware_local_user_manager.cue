package ansible

module: vmware_local_user_manager: {
	module:            "vmware_local_user_manager"
	short_description: "Manage local users on an ESXi host"
	description: [
		"Manage local users on an ESXi host",
	]
	version_added: "2.2"
	author: [
		"Andreas Nafpliotis (@nafpliot-ibm)",
	]
	notes: [
		"Tested on ESXi 6.0",
		"Be sure that the ESXi user used for login, has the appropriate rights to create / delete / edit users",
	]
	requirements: [
		"python >= 2.6",
		"PyVmomi installed",
	]
	options: {
		local_user_name: {
			description: [
				"The local user name to be changed.",
			]
			required: true
			type:     "str"
		}
		local_user_password: {
			description: [
				"The password to be set.",
			]
			required: false
			type:     "str"
		}
		local_user_description: {
			description: [
				"Description for the user.",
			]
			required: false
			type:     "str"
		}
		state: {
			description: [
				"Indicate desired state of the user. If the user already exists when C(state=present), the user info is updated",
			]
			choices: ["present", "absent"]
			default: "present"
			type:    "str"
		}
	}
	extends_documentation_fragment: "vmware.documentation"
}
