package ansible

module: fmgr_fwobj_ippool: {
	module:        "fmgr_fwobj_ippool"
	version_added: "2.8"
	notes: [
		"Full Documentation at U(https://ftnt-ansible-docs.readthedocs.io/en/latest/).",
	]
	author: [
		"Luke Weighall (@lweighall)",
		"Andrew Welsh (@Ghilli3)",
		"Jim Huber (@p4r4n0y1ng)",
	]
	short_description: "Allows the editing of IP Pool Objects within FortiManager."
	description: [
		"Allows users to add/edit/delete IP Pool Objects.",
	]

	options: {
		adom: {
			description: [
				"The ADOM the configuration should belong to.",
			]
			required: false
			default:  "root"
		}

		mode: {
			description: [
				"Sets one of three modes for managing the object.",
				"Allows use of soft-adds instead of overwriting existing values",
			]
			choices: ["add", "set", "delete", "update"]
			required: false
			default:  "add"
		}

		type: {
			description: [
				"IP pool type (overload, one-to-one, fixed port range, or port block allocation).",
				"choice | overload | IP addresses in the IP pool can be shared by clients.",
				"choice | one-to-one | One to one mapping.",
				"choice | fixed-port-range | Fixed port range.",
				"choice | port-block-allocation | Port block allocation.",
			]
			required: false
			choices: ["overload", "one-to-one", "fixed-port-range", "port-block-allocation"]
		}

		startip: {
			description: [
				"First IPv4 address (inclusive) in the range for the address pool (format xxx.xxx.xxx.xxx, Default| 0.0.0.0).",
			]
			required: false
		}

		source_startip: {
			description: [
				"First IPv4 address (inclusive) in the range of the source addresses to be translated (format xxx.xxx.xxx.xxx, Default| 0.0.0.0).",
			]

			required: false
		}

		source_endip: {
			description: [
				"Final IPv4 address (inclusive) in the range of the source addresses to be translated (format xxx.xxx.xxx.xxx, Default| 0.0.0.0).",
			]

			required: false
		}

		permit_any_host: {
			description: [
				"Enable/disable full cone NAT.",
				"choice | disable | Disable full cone NAT.",
				"choice | enable | Enable full cone NAT.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		pba_timeout: {
			description: [
				"Port block allocation timeout (seconds).",
			]
			required: false
		}

		num_blocks_per_user: {
			description: [
				"Number of addresses blocks that can be used by a user (1 to 128, default = 8).",
			]
			required: false
		}

		name: {
			description: [
				"IP pool name.",
			]
			required: false
		}

		endip: {
			description: [
				"Final IPv4 address (inclusive) in the range for the address pool (format xxx.xxx.xxx.xxx, Default| 0.0.0.0).",
			]
			required: false
		}

		comments: {
			description: [
				"Comment.",
			]
			required: false
		}

		block_size: {
			description: [
				"Number of addresses in a block (64 to 4096, default = 128).",
			]
			required: false
		}

		associated_interface: {
			description: [
				"Associated interface name.",
			]
			required: false
		}

		arp_reply: {
			description: [
				"Enable/disable replying to ARP requests when an IP Pool is added to a policy (default = enable).",
				"choice | disable | Disable ARP reply.",
				"choice | enable | Enable ARP reply.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		arp_intf: {
			description: [
				"Select an interface from available options that will reply to ARP requests. (If blank, any is selected).",
			]
			required: false
		}

		dynamic_mapping: {
			description: [
				"EXPERTS ONLY! KNOWLEDGE OF FMGR JSON API IS REQUIRED!",
				"List of multiple child objects to be added. Expects a list of dictionaries.",
				"Dictionaries must use FortiManager API parameters, not the ansible ones listed below.",
				"If submitted, all other prefixed sub-parameter.ARE IGNORED.",
				"This object is MUTUALLY EXCLUSIVE with its options.",
				"We expect that you know what you are doing with these list parameters, and are leveraging the JSON API Guide.",
				"WHEN IN DOUBT, USE THE SUB OPTIONS BELOW INSTEAD TO CREATE OBJECTS WITH MULTIPLE TASKS",
			]
			required: false
		}

		dynamic_mapping_arp_intf: {
			description: [
				"Dynamic Mapping clone of original suffixed parameter.",
			]
			required: false
		}

		dynamic_mapping_arp_reply: {
			description: [
				"Dynamic Mapping clone of original suffixed parameter.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		dynamic_mapping_associated_interface: {
			description: [
				"Dynamic Mapping clone of original suffixed parameter.",
			]
			required: false
		}

		dynamic_mapping_block_size: {
			description: [
				"Dynamic Mapping clone of original suffixed parameter.",
			]
			required: false
		}

		dynamic_mapping_comments: {
			description: [
				"Dynamic Mapping clone of original suffixed parameter.",
			]
			required: false
		}

		dynamic_mapping_endip: {
			description: [
				"Dynamic Mapping clone of original suffixed parameter.",
			]
			required: false
		}

		dynamic_mapping_num_blocks_per_user: {
			description: [
				"Dynamic Mapping clone of original suffixed parameter.",
			]
			required: false
		}

		dynamic_mapping_pba_timeout: {
			description: [
				"Dynamic Mapping clone of original suffixed parameter.",
			]
			required: false
		}

		dynamic_mapping_permit_any_host: {
			description: [
				"Dynamic Mapping clone of original suffixed parameter.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		dynamic_mapping_source_endip: {
			description: [
				"Dynamic Mapping clone of original suffixed parameter.",
			]
			required: false
		}

		dynamic_mapping_source_startip: {
			description: [
				"Dynamic Mapping clone of original suffixed parameter.",
			]
			required: false
		}

		dynamic_mapping_startip: {
			description: [
				"Dynamic Mapping clone of original suffixed parameter.",
			]
			required: false
		}

		dynamic_mapping_type: {
			description: [
				"Dynamic Mapping clone of original suffixed parameter.",
			]
			required: false
			choices: ["overload", "one-to-one", "fixed-port-range", "port-block-allocation"]
		}
	}
}
