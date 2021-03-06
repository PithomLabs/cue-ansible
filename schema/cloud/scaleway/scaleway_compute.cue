package ansible

module: scaleway_compute: {
	module:            "scaleway_compute"
	short_description: "Scaleway compute management module"
	version_added:     "2.6"
	author:            "Remy Leone (@sieben)"
	description: [
		"This module manages compute instances on Scaleway.",
	]
	extends_documentation_fragment: "scaleway"

	options: {

		public_ip: {
			description: [
				"Manage public IP on a Scaleway server",
				"Could be Scaleway IP address UUID",
				"C(dynamic) Means that IP is destroyed at the same time the host is destroyed",
				"C(absent) Means no public IP at all",
			]
			version_added: "2.8"
			default:       "absent"
		}

		enable_ipv6: {
			description: [
				"Enable public IPv6 connectivity on the instance",
			]
			default: false
			type:    "bool"
		}

		image: {
			description: [
				"Image identifier used to start the instance with",
			]
			required: true
		}

		name: description: [
			"Name of the instance",
		]

		organization: {
			description: [
				"Organization identifier",
			]
			required: true
		}

		state: {
			description: [
				"Indicate desired state of the instance.",
			]
			default: "present"
			choices: [
				"present",
				"absent",
				"running",
				"restarted",
				"stopped",
			]
		}

		tags: {
			description: [
				"List of tags to apply to the instance (5 max)",
			]
			required: false
			default: []
		}

		region: {
			description: [
				"Scaleway compute zone",
			]
			required: true
			choices: [
				"ams1",
				"EMEA-NL-EVS",
				"par1",
				"EMEA-FR-PAR1",
			]
		}

		commercial_type: {
			description: [
				"Commercial name of the compute node",
			]
			required: true
		}

		wait: {
			description: [
				"Wait for the instance to reach its desired state before returning.",
			]
			type:    "bool"
			default: "no"
		}

		wait_timeout: {
			description: [
				"Time to wait for the server to reach the expected state",
			]
			required: false
			default:  300
		}

		wait_sleep_time: {
			description: [
				"Time to wait before every attempt to check the state of the server",
			]
			required: false
			default:  3
		}

		security_group: {
			description: [
				"Security group unique identifier",
				"If no value provided, the default security group or current security group will be used",
			]
			required:      false
			version_added: "2.8"
		}
	}
}
