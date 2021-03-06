package ansible

module: cp_mgmt_threat_protection_override: {
	module:            "cp_mgmt_threat_protection_override"
	short_description: "Edit existing object using object name or uid."
	description: [
		"Edit existing object using object name or uid.",
		"All operations are performed over Web Services API.",
	]
	version_added: "2.9"
	author:        "Or Soffer (@chkp-orso)"
	options: {
		name: {
			description: [
				"Object name.",
			]
			type: "str"
		}
		comments: {
			description: [
				"Protection comments.",
			]
			type: "str"
		}
		follow_up: {
			description: [
				"Tag the protection with pre-defined follow-up flag.",
			]
			type: "bool"
		}
		overrides: {
			description: [
				"Overrides per profile for this protection<br> Note, Remove override for Core protections removes only the action's override. Remove override for Threat Cloud protections removes the action, track and packet captures.",
			]

			type: "list"
			suboptions: {
				action: {
					description: [
						"Protection action.",
					]
					type: "str"
					choices: ["Threat Cloud: Inactive", "Detect", "Prevent <br> Core: Drop", "Inactive", "Accept"]
				}
				profile: {
					description: [
						"Profile name.",
					]
					type: "str"
				}
				capture_packets: {
					description: [
						"Capture packets.",
					]
					type: "bool"
				}
				track: {
					description: [
						"Tracking method for protection.",
					]
					type: "str"
					choices: ["none", "log", "alert", "mail", "snmp trap", "user alert", "user alert 1", "user alert 2"]
				}
			}
		}
		details_level: {
			description: [
				"The level of detail for some of the fields in the response can vary from showing only the UID value of the object to a fully detailed representation of the object.",
			]

			type: "str"
			choices: ["uid", "standard", "full"]
		}
	}
	extends_documentation_fragment: "checkpoint_commands"
}
