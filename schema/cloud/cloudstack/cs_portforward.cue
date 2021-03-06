package ansible

module: cs_portforward: {
	module:            "cs_portforward"
	short_description: "Manages port forwarding rules on Apache CloudStack based clouds."
	description: [
		"Create, update and remove port forwarding rules.",
	]
	version_added: "2.0"
	author:        "René Moser (@resmo)"
	options: {
		ip_address: {
			description: ["Public IP address the rule is assigned to."]
			type:     "str"
			required: true
		}
		vm: {
			description: [
				"Name of virtual machine which we make the port forwarding rule for.",
				"Required if I(state=present).",
			]
			type: "str"
		}
		state: {
			description: ["State of the port forwarding rule."]
			type:    "str"
			default: "present"
			choices: ["present", "absent"]
		}
		protocol: {
			description: ["Protocol of the port forwarding rule."]
			type:    "str"
			default: "tcp"
			choices: ["tcp", "udp"]
		}
		public_port: {
			description: ["Start public port for this rule."]
			type:     "int"
			required: true
		}
		public_end_port: {
			description: [
				"End public port for this rule.",
				"If not specified equal I(public_port).",
			]
			type: "int"
		}
		private_port: {
			description: ["Start private port for this rule."]
			type:     "int"
			required: true
		}
		private_end_port: {
			description: [
				"End private port for this rule.",
				"If not specified equal I(private_port).",
			]
			type: "int"
		}
		open_firewall: {
			description: [
				"Whether the firewall rule for public port should be created, while creating the new rule.",
				"Use M(cs_firewall) for managing firewall rules.",
			]
			default: false
			type:    "bool"
		}
		vm_guest_ip: {
			description: ["VM guest NIC secondary IP address for the port forwarding rule."]
			type: "str"
		}
		network: {
			description: ["Name of the network."]
			type:          "str"
			version_added: "2.3"
		}
		vpc: {
			description: ["Name of the VPC."]
			version_added: "2.3"
			type:          "str"
		}
		domain: {
			description: ["Domain the I(vm) is related to."]
			type: "str"
		}
		account: {
			description: ["Account the I(vm) is related to."]
			type: "str"
		}
		project: {
			description: ["Name of the project the I(vm) is located in."]
			type: "str"
		}
		zone: {
			description: [
				"Name of the zone in which the virtual machine is in.",
				"If not set, default zone is used.",
			]
			type: "str"
		}
		poll_async: {
			description: ["Poll async jobs until job has finished."]
			default: true
			type:    "bool"
		}
		tags: {
			description: [
				"List of tags. Tags are a list of dictionaries having keys I(key) and I(value).",
				"To delete all tags, set a empty list e.g. I(tags: []).",
			]
			type: "list"
			aliases: ["tag"]
			version_added: "2.4"
		}
	}
	extends_documentation_fragment: "cloudstack"
}
