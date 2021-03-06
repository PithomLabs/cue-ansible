package ansible

module: os_keystone_endpoint: {
	module:                         "os_keystone_endpoint"
	short_description:              "Manage OpenStack Identity service endpoints"
	extends_documentation_fragment: "openstack"
	author: [
		"Mohammed Naser (@mnaser)",
		"Alberto Murillo (@albertomurillo)",
	]
	version_added: "2.5"
	description: [
		"Create, update, or delete OpenStack Identity service endpoints. If a service with the same combination of I(service), I(interface) and I(region) exist, the I(url) and I(state) (C(present) or C(absent)) will be updated.",
	]

	options: {
		service: {
			description: [
				"Name or id of the service.",
			]
			required: true
		}
		endpoint_interface: {
			description: [
				"Interface of the service.",
			]
			choices: ["admin", "public", "internal"]
			required: true
		}
		url: {
			description: [
				"URL of the service.",
			]
			required: true
		}
		region: description: [
			"Region that the service belongs to. Note that I(region_name) is used for authentication.",
		]
		enabled: {
			description: [
				"Is the service enabled.",
			]
			default: true
			type:    "bool"
		}
		state: {
			description: [
				"Should the resource be C(present) or C(absent).",
			]
			choices: ["present", "absent"]
			default: "present"
		}
	}
	requirements: ["openstacksdk >= 0.13.0"]
}
