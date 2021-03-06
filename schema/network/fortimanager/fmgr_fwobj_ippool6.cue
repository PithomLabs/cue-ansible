package ansible

module: fmgr_fwobj_ippool6: {
	module:        "fmgr_fwobj_ippool6"
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
		"Allows users to add/edit/delete IPv6 Pool Objects.",
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

		startip: {
			description: [
				"First IPv6 address (inclusive) in the range for the address pool.",
			]
			required: false
		}

		name: {
			description: [
				"IPv6 IP pool name.",
			]
			required: false
		}

		endip: {
			description: [
				"Final IPv6 address (inclusive) in the range for the address pool.",
			]
			required: false
		}

		comments: {
			description: [
				"Comment.",
			]
			required: false
		}

		dynamic_mapping: {
			description: [
				"EXPERTS ONLY! KNOWLEDGE OF FMGR JSON API IS REQUIRED!",
				"List of multiple child objects to be added. Expects a list of dictionaries.",
				"Dictionaries must use FortiManager API parameters, not the ansible ones listed below.",
				"If submitted, all other prefixed sub-parameters ARE IGNORED.",
				"This object is MUTUALLY EXCLUSIVE with its options.",
				"We expect that you know what you are doing with these list parameters, and are leveraging the JSON API Guide.",
				"WHEN IN DOUBT, USE THE SUB OPTIONS BELOW INSTEAD TO CREATE OBJECTS WITH MULTIPLE TASKS",
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

		dynamic_mapping_startip: {
			description: [
				"Dynamic Mapping clone of original suffixed parameter.",
			]
			required: false
		}
	}
}
