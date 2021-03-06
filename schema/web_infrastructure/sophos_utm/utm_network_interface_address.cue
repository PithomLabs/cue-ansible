package ansible

module: utm_network_interface_address: {
	module: "utm_network_interface_address"

	author: [
		"Juergen Wiebe (@steamx)",
	]

	short_description: "Create, update or destroy network/interface_address object"

	description: [
		"Create, update or destroy a network/interface_address object in SOPHOS UTM.",
		"This module needs to have the REST Ability of the UTM to be activated.",
	]

	version_added: "2.8"

	options: {
		name: {
			description: [
				"The name of the object. Will be used to identify the entry",
			]
			required: true
		}
		address: {
			description: [
				"The ip4 address of the network/interface_address object.",
			]
			required: true
		}
		address6: {
			description: [
				"The ip6 address of the network/interface_address object.",
			]
			required: false
		}
		comment: description: [
			"An optional comment to add to the object",
		]
		resolved: description: [
			"Whether or not the object is resolved",
		]
		resolved6: description: [
			"Whether or not the object is resolved",
		]
	}

	extends_documentation_fragment: ["utm"]
}
