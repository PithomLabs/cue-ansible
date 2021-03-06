package ansible

module: lightsail: {
	module:            "lightsail"
	short_description: "Create or delete a virtual machine instance in AWS Lightsail"
	description: [
		"Creates or instances in AWS Lightsail and optionally wait for it to be 'running'.",
	]
	version_added: "2.4"
	author:        "Nick Ball (@nickball)"
	options: {
		state: {
			description: [
				"Indicate desired state of the target.",
			]
			default: "present"
			choices: ["present", "absent", "running", "restarted", "stopped"]
			type: "str"
		}
		name: {
			description: [
				"Name of the instance.",
			]
			required: true
			type:     "str"
		}
		zone: {
			description: [
				"AWS availability zone in which to launch the instance.",
				"Required when I(state=present)",
			]
			type: "str"
		}
		blueprint_id: {
			description: [
				"ID of the instance blueprint image.",
				"Required when I(state=present)",
			]
			type: "str"
		}
		bundle_id: {
			description: [
				"Bundle of specification info for the instance.",
				"Required when I(state=present).",
			]
			type: "str"
		}
		user_data: {
			description: [
				"Launch script that can configure the instance with additional data.",
			]
			type: "str"
		}
		key_pair_name: {
			description: [
				"Name of the key pair to use with the instance.",
			]
			type: "str"
		}
		wait: {
			description: [
				"Wait for the instance to be in state 'running' before returning.",
				"If I(wait=false) an ip_address may not be returned.",
			]
			type:    "bool"
			default: true
		}
		wait_timeout: {
			description: [
				"How long before I(wait) gives up, in seconds.",
			]
			default: 300
			type:    "int"
		}
	}

	requirements: [
		"python >= 2.6",
		"boto3",
	]

	extends_documentation_fragment: [
		"aws",
		"ec2",
	]
}
