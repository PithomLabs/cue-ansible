package ansible

module: infinity: {
	module:            "infinity"
	short_description: "Manage Infinity IPAM using Rest API"
	description: [
		"Manage Infinity IPAM using REST API.",
	]
	version_added: "2.4"
	author: [
		"Meirong Liu (@MeganLiu)",
	]
	options: {
		server_ip: {
			description: [
				"Infinity server_ip with IP address.",
			]
			type:     "str"
			required: true
		}
		username: {
			description: [
				"Username to access Infinity.",
				"The user must have REST API privileges.",
			]
			type:     "str"
			required: true
		}
		password: {
			description: [
				"Infinity password.",
			]
			type:     "str"
			required: true
		}
		action: {
			description: [
				"Action to perform",
			]
			type:     "str"
			required: true
			choices: ["add_network", "delete_network", "get_network", "get_network_id", "release_ip", "release_network", "reserve_network", "reserve_next_available_ip"]
		}
		network_id: {
			description: [
				"Network ID.",
			]
			type:    "str"
			default: ""
		}
		ip_address: {
			description: [
				"IP Address for a reservation or a release.",
			]
			type:    "str"
			default: ""
		}
		network_address: {
			description: [
				"Network address with CIDR format (e.g., 192.168.310.0).",
			]
			type:    "str"
			default: ""
		}
		network_size: {
			description: [
				"Network bitmask (e.g. 255.255.255.220) or CIDR format (e.g., /26).",
			]
			type:    "str"
			default: ""
		}
		network_name: {
			description: [
				"The name of a network.",
			]
			type:    "str"
			default: ""
		}
		network_location: {
			description: [
				"The parent network id for a given network.",
			]
			type:    "int"
			default: -1
		}
		network_type: {
			description: [
				"Network type defined by Infinity",
			]
			type: "str"
			choices: ["lan", "shared_lan", "supernet"]
			default: "lan"
		}
		network_family: {
			description: [
				"Network family defined by Infinity, e.g. IPv4, IPv6 and Dual stack",
			]
			type: "str"
			choices: [4, 6, "dual"]
			default: 4
		}
	}
}
