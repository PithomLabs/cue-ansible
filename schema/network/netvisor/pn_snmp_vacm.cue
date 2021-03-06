package ansible

module: pn_snmp_vacm: {
	module:            "pn_snmp_vacm"
	author:            "Pluribus Networks (@rajaspachipulusu17)"
	version_added:     "2.8"
	short_description: "CLI command to create/modify/delete snmp-vacm"
	description: [
		"This module can be used to create View Access Control Models (VACM), modify VACM and delete VACM.",
	]

	options: {
		pn_cliswitch: {
			description: [
				"Target switch to run the CLI on.",
			]
			type:     "str"
			required: false
		}
		state: {
			description: [
				"State the action to perform. Use C(present) to create snmp-vacm and C(absent) to delete snmp-vacm and C(update) to modify snmp-vacm.",
			]

			type:     "str"
			required: true
			choices: ["present", "absent", "update"]
		}
		pn_oid_restrict: {
			description: [
				"restrict OID.",
			]
			type: "str"
		}
		pn_priv: {
			description: [
				"privileges.",
			]
			type: "bool"
		}
		pn_auth: {
			description: [
				"authentication required.",
			]
			type: "bool"
		}
		pn_user_type: {
			description: [
				"SNMP user type.",
			]
			type: "str"
			choices: ["rouser", "rwuser"]
		}
		pn_user_name: {
			description: [
				"SNMP administrator name.",
			]
			type: "str"
		}
	}
}
