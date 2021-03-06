package ansible

module: ovh_ip_loadbalancing_backend: {
	module:            "ovh_ip_loadbalancing_backend"
	short_description: "Manage OVH IP LoadBalancing backends"
	description: [
		"Manage OVH (French European hosting provider) LoadBalancing IP backends",
	]
	version_added: "2.2"
	author:        "Pascal Heraud (@pascalheraud)"
	notes: [
		"Uses the python OVH Api U(https://github.com/ovh/python-ovh). You have to create an application (a key and secret) with a consumer key as described into U(https://eu.api.ovh.com/g934.first_step_with_api)",
	]

	requirements: [
		"ovh >  0.3.5",
	]
	options: {
		name: {
			required: true
			description: [
				"Name of the LoadBalancing internal name (ip-X.X.X.X)",
			]
		}
		backend: {
			required: true
			description: [
				"The IP address of the backend to update / modify / delete",
			]
		}
		state: {
			default: "present"
			choices: ["present", "absent"]
			description: [
				"Determines whether the backend is to be created/modified or deleted",
			]
		}

		probe: {
			default: "none"
			choices: ["none", "http", "icmp", "oco"]
			description: [
				"Determines the type of probe to use for this backend",
			]
		}
		weight: {
			default: 8
			description: [
				"Determines the weight for this backend",
			]
		}
		endpoint: {
			required: true
			description: [
				"The endpoint to use ( for instance ovh-eu)",
			]
		}
		application_key: {
			required: true
			description: [
				"The applicationKey to use",
			]
		}
		application_secret: {
			required: true
			description: [
				"The application secret to use",
			]
		}
		consumer_key: {
			required: true
			description: [
				"The consumer key to use",
			]
		}
		timeout: {
			default: 120
			description: [
				"The timeout in seconds used to wait for a task to be completed.",
			]
		}
	}
}
