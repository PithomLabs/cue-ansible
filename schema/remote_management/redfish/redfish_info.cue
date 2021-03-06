package ansible

module: redfish_info: {
	module:            "redfish_info"
	version_added:     "2.7"
	short_description: "Manages Out-Of-Band controllers using Redfish APIs"
	description: [
		"Builds Redfish URIs locally and sends them to remote OOB controllers to get information back.",
		"Information retrieved is placed in a location specified by the user.",
		"This module was called C(redfish_facts) before Ansible 2.9, returning C(ansible_facts). Note that the M(redfish_info) module no longer returns C(ansible_facts)!",
	]

	options: {
		category: {
			required: false
			description: [
				"List of categories to execute on OOB controller",
			]
			default: ["Systems"]
			type: "list"
		}
		command: {
			required: false
			description: [
				"List of commands to execute on OOB controller",
			]
			type: "list"
		}
		baseuri: {
			required: true
			description: [
				"Base URI of OOB controller",
			]
			type: "str"
		}
		username: {
			required: true
			description: [
				"User for authentication with OOB controller",
			]
			type:          "str"
			version_added: "2.8"
		}
		password: {
			required: true
			description: [
				"Password for authentication with OOB controller",
			]
			type: "str"
		}
		timeout: {
			description: [
				"Timeout in seconds for URL requests to OOB controller",
			]
			default:       10
			type:          "int"
			version_added: "2.8"
		}
	}

	author: "Jose Delarosa (@jose-delarosa)"
}
