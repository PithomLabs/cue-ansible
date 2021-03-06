package ansible

module: bigip_message_routing_transport_config: {
	module:            "bigip_message_routing_transport_config"
	short_description: "Manages configuration for an outgoing connection"
	description: [
		"Manages configuration for an outgoing connection in BIG-IP message routing.",
	]
	version_added: 2.9
	options: {
		name: {
			description: [
				"Specifies the name of the transport config to manage.",
			]
			type:     "str"
			required: true
		}
		description: {
			description: [
				"The user defined description of the transport config.",
			]
			type: "str"
		}
		profiles: {
			description: [
				"Specifies a list profiles for the outgoing connection to use to direct and manage traffic.",
			]
			type: "list"
		}
		src_addr_translation: {
			description: [
				"Specifies the type of source address translation enabled for the transport config and the pool that the source address translation will use.",
			]

			suboptions: {
				type: {
					description: [
						"Specifies the type of source address translation associated with the specified transport config.",
						"When set to C(snat) the C(pool) parameter needs to contain a name for a valid LSN or SNAT pool.",
					]
					type: "str"
					choices: [
						"snat",
						"none",
						"automap",
					]
				}
				pool: {
					description: [
						"Specifies the name of a LSN or SNAT pool used by the specified transport config.",
						"Name can also be specified in C(fullPath) format: C(/Common/foobar)",
						"When C(type) is C(none) or C(automap) the pool parameter will be replaced by C(none) keyword, thus any defined C(pool) parameter will be ignored.",
					]

					type: "str"
				}
			}
			type: "dict"
		}
		src_port: {
			description: [
				"Specifies the source port to be used for the connection being created.",
				"If no value is specified an ephemeral port is chosen for the connection being created.",
				"The accepted range is between 0 and 65535 inclusive.",
			]
			type: "int"
		}
		rules: {
			description: [
				"The iRules you want run on this transport config. iRules help automate the intercepting, processing, and routing of application traffic.",
			]

			type: "list"
		}
		type: {
			description: [
				"Parameter used to specify the type of the transport-config object to manage.",
				"Default setting is C(generic) with more options added in future.",
			]
			type: "str"
			choices: [
				"generic",
			]
			default: "generic"
		}
		partition: {
			description: [
				"Device partition to create transport-config object on.",
			]
			type:    "str"
			default: "Common"
		}
		state: {
			description: [
				"When C(present), ensures that the transport-config object exists.",
				"When C(absent), ensures the transport-config object is removed.",
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
