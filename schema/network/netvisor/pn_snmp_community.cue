package ansible

module: pn_snmp_community: {
	module:            "pn_snmp_community"
	author:            "Pluribus Networks (@rajaspachipulusu17)"
	version_added:     "2.8"
	short_description: "CLI command to create/modify/delete snmp-community"
	description: [
		"This module can be used to create SNMP communities for SNMPv1 or delete SNMP communities for SNMPv1 or modify SNMP communities for SNMPv1.",
	]

	options: {
		pn_cliswitch: {
			description: [
				"Target switch to run the CLI on.",
			]
			required: false
		}
		state: {
			description: [
				"State the action to perform. Use C(present) to create snmp-community and C(absent) to delete snmp-community C(update) to update snmp-community.",
			]

			required: true
			type:     "str"
			choices: ["present", "absent", "update"]
		}
		pn_community_type: {
			description: [
				"community type.",
			]
			type: "str"
			choices: ["read-only", "read-write"]
		}
		pn_community_string: {
			description: [
				"community name.",
			]
			type: "str"
		}
	}
}
