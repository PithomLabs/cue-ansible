package ansible

module: na_ontap_command: {
	author: "NetApp Ansible Team (@carchi8py) <ng-ansibleteam@netapp.com>"
	description: [
		"Run system-cli commands on ONTAP",
	]
	extends_documentation_fragment: [
		"netapp.na_ontap",
	]
	module:            "na_ontap_command"
	short_description: "NetApp ONTAP Run any cli command, the username provided needs to have console login permission."
	version_added:     "2.7"
	options: {
		command: {
			description: [
				"a comma separated list containing the command and arguments.",
			]
			required: true
		}
		privilege: {
			description: [
				"privilege level at which to run the command.",
			]
			choices: ["admin", "advanced"]
			default:       "admin"
			version_added: "2.8"
		}
		return_dict: {
			description: [
				"returns a parsesable dictionary instead of raw XML output",
			]
			type:          "bool"
			default:       false
			version_added: "2.9"
		}
	}
}
