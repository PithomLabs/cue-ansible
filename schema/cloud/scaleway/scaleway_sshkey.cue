package ansible

module: scaleway_sshkey: {
	module:            "scaleway_sshkey"
	short_description: "Scaleway SSH keys management module"
	version_added:     "2.6"
	author:            "Remy Leone (@sieben)"
	description: [
		"This module manages SSH keys on Scaleway account U(https://developer.scaleway.com)",
	]

	extends_documentation_fragment: "scaleway"

	options: {
		state: {
			description: [
				"Indicate desired state of the SSH key.",
			]
			default: "present"
			choices: [
				"present",
				"absent",
			]
		}
		ssh_pub_key: {
			description: [
				"The public SSH key as a string to add.",
			]
			required: true
		}
		api_url: {
			description: [
				"Scaleway API URL",
			]
			default: "https://account.scaleway.com"
			aliases: ["base_url"]
		}
	}
}
