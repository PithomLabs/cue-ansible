package ansible

module: vultr_network: {
	module:            "vultr_network"
	short_description: "Manages networks on Vultr."
	description: [
		"Manage networks on Vultr. A network cannot be updated. It needs to be deleted and re-created.",
	]
	version_added: "2.7"
	author:        "Yanis Guenane (@Spredzy)"
	options: {
		name: {
			description: [
				"Name of the network.",
			]
			required: true
			aliases: ["description", "label"]
		}
		cidr: description: [
			"The CIDR IPv4 network block to be used when attaching servers to this network. Required if I(state=present).",
		]
		region: description: [
			"Region the network is deployed into. Required if I(state=present).",
		]
		state: {
			description: [
				"State of the network.",
			]
			default: "present"
			choices: ["present", "absent"]
		}
	}
	extends_documentation_fragment: "vultr"
}
