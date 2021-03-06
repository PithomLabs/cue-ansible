package ansible

module: tower_send: {
	module:            "tower_send"
	author:            "John Westcott IV (@john-westcott-iv)"
	version_added:     "2.8"
	short_description: "Send assets to Ansible Tower."
	description: [
		"Send assets to Ansible Tower. See U(https://www.ansible.com/tower) for an overview.",
	]

	options: {
		assets: {
			description: [
				"The assets to import.",
				"This can be the output of tower_receive or loaded from a file",
			]
			required: false
		}
		files: {
			description: [
				"List of files to import.",
			]
			required: false
			default: []
		}
		prevent: {
			description: [
				"A list of asset types to prevent import for",
			]
			required: false
			default: []
		}
		password_management: {
			description: [
				"The password management option to use.",
				"The prompt option is not supported.",
			]
			required: false
			default:  "default"
			choices: ["default", "random"]
		}
	}

	notes: [
		"One of assets or files needs to be passed in",
	]

	requirements: [
		"ansible-tower-cli >= 3.3.0",
		"six.moves.StringIO",
		"sys",
	]

	extends_documentation_fragment: "tower"
}
