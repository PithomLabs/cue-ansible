package ansible

module: purefa_pg: {
	module:            "purefa_pg"
	version_added:     "2.4"
	short_description: "Manage protection groups on Pure Storage FlashArrays"
	description: [
		"Create, delete or modify protection groups on Pure Storage FlashArrays.",
		"If a protection group exists and you try to add non-valid types, eg. a host to a volume protection group the module will ignore the invalid types.",
		"Protection Groups on Offload targets are supported.",
	]
	author: [
		"Pure Storage Ansible Team (@sdodsley) <pure-ansible-team@purestorage.com>",
	]
	options: {
		pgroup: {
			description: [
				"The name of the protection group.",
			]
			type:     "str"
			required: true
		}
		state: {
			description: [
				"Define whether the protection group should exist or not.",
			]
			type:    "str"
			default: "present"
			choices: ["absent", "present"]
		}
		volume: {
			description: [
				"List of existing volumes to add to protection group.",
			]
			type: "list"
		}
		host: {
			description: [
				"List of existing hosts to add to protection group.",
			]
			type: "list"
		}
		hostgroup: {
			description: [
				"List of existing hostgroups to add to protection group.",
			]
			type: "list"
		}
		eradicate: {
			description: [
				"Define whether to eradicate the protection group on delete and leave in trash.",
			]
			type:    "bool"
			default: "no"
		}
		enabled: {
			description: [
				"Define whether to enabled snapshots for the protection group.",
			]
			type:    "bool"
			default: "yes"
		}
		target: {
			description: [
				"List of remote arrays or offload target for replication protection group to connect to.",
				"Note that all replicated protection groups are asynchronous.",
				"Target arrays or offload targets must already be connected to the source array.",
				"Maximum number of targets per Protection Group is 4, assuming your configuration supports this.",
			]

			type:          "list"
			version_added: "2.8"
		}
	}
	extends_documentation_fragment: ["purestorage.fa"]
}
