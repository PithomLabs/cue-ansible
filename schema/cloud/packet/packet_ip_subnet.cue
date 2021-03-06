package ansible

module: packet_ip_subnet: {
	module: "packet_ip_subnet"

	short_description: "Assign IP subnet to a bare metal server."

	description: [
		"Assign or unassign IPv4 or IPv6 subnets to or from a device in the Packet host.",
		"IPv4 subnets must come from already reserved block.",
		"IPv6 subnets must come from publicly routable /56 block from your project.",
		"See U(https://support.packet.com/kb/articles/elastic-ips) for more info on IP block reservation.",
	]

	version_added: "2.10"

	author: [
		"Tomas Karasek (@t0mk) <tom.to.the.k@gmail.com>",
		"Nurfet Becirevic (@nurfet-becirevic) <nurfet.becirevic@gmail.com>",
	]

	options: {
		auth_token: {
			description: [
				"Packet api token. You can also supply it in env var C(PACKET_API_TOKEN).",
			]
			type: "str"
		}

		hostname: {
			description: [
				"A hostname of a device to/from which to assign/remove a subnet.",
			]
			required: false
			type:     "str"
		}

		device_id: {
			description: [
				"UUID of a device to/from which to assign/remove a subnet.",
			]
			required: false
			type:     "str"
		}

		project_id: {
			description: [
				"UUID of a project of the device to/from which to assign/remove a subnet.",
			]
			required: true
			type:     "str"
		}

		device_count: {
			description: [
				"The number of devices to retrieve from the project. The max allowed value is 1000.",
				"See U(https://www.packet.com/developers/api/#retrieve-all-devices-of-a-project) for more info.",
			]
			default: 100
			type:    "int"
		}

		cidr: {
			description: [
				"IPv4 or IPv6 subnet which you want to manage. It must come from a reserved block for your project in the Packet Host.",
			]
			aliases: ["name"]
			type: "str"
		}

		state: {
			description: [
				"Desired state of the IP subnet on the specified device.",
				"With state == C(present), you must specify either hostname or device_id. Subnet with given CIDR will then be assigned to the specified device.",
				"With state == C(absent), you can specify either hostname or device_id. The subnet will be removed from specified devices.",
				"If you leave both hostname and device_id empty, the subnet will be removed from any device it's assigned to.",
			]
			choices: ["present", "absent"]
			default: "present"
			type:    "str"
		}
	}

	requirements: [
		"packet-python >= 1.35",
		"python >= 2.6",
	]
}
