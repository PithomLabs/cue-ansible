package ansible

module: bigip_message_routing_route: {
	module:            "bigip_message_routing_route"
	short_description: "Manages static routes for routing message protocol messages"
	description: [
		"Manages static routes for routing message protocol messages.",
	]
	version_added: 2.9
	options: {
		name: {
			description: [
				"Specifies the name of the static route.",
			]
			required: true
			type:     "str"
		}
		description: {
			description: [
				"The user defined description of the static route.",
			]
			type: "str"
		}
		type: {
			description: [
				"Parameter used to specify the type of the route to manage.",
				"Default setting is C(generic) with more options added in future.",
			]
			type: "str"
			choices: [
				"generic",
			]
			default: "generic"
		}
		src_address: {
			description: [
				"Specifies the source address of the route.",
				"Setting the attribute to an empty string will create a wildcard matching all message source-addresses, which is the default when creating a new route.",
			]

			type: "str"
		}
		dst_address: {
			description: [
				"Specifies the destination address of the route.",
				"Setting the attribute to an empty string will create a wildcard matching all message destination-addresses, which is the default when creating a new route.",
			]

			type: "str"
		}
		peer_selection_mode: {
			description: [
				"Specifies the method to use when selecting a peer from the provided list of C(peers).",
			]
			type: "str"
			choices: [
				"ratio",
				"sequential",
			]
		}
		peers: {
			description: [
				"Specifies a list of ltm messagerouting-peer objects.",
				"The specified peer must be on the same partition as the route.",
			]
			type: "list"
		}
		partition: {
			description: [
				"Device partition to create route object on.",
			]
			type:    "str"
			default: "Common"
		}
		state: {
			description: [
				"When C(present), ensures that the route exists.",
				"When C(absent), ensures the route is removed.",
			]
			type: "str"
			choices: [
				"present",
				"absent",
			]
			default: "present"
		}
	}
	notes: [
		"Requires BIG-IP >= 14.0.0",
	]
	extends_documentation_fragment: "f5"
	author: ["Wojciech Wypior (@wojtek0806)"]
}
