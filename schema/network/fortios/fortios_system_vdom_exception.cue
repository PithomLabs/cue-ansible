package ansible

module: fortios_system_vdom_exception: {
	module:            "fortios_system_vdom_exception"
	short_description: "Global configuration objects that can be configured independently for all VDOMs or for the defined VDOM scope in Fortinet's FortiOS and FortiGate."

	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify system feature and vdom_exception category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
	]

	version_added: "2.9"
	author: [
		"Miguel Angel Munoz (@mamunozgonzalez)",
		"Nicolas Thomas (@thomnico)",
	]
	notes: [
		"Requires fortiosapi library developed by Fortinet",
		"Run as a local_action in your playbook",
	]
	requirements: [
		"fortiosapi>=0.9.8",
	]
	options: {
		host: {
			description: [
				"FortiOS or FortiGate IP address.",
			]
			type:     "str"
			required: false
		}
		username: {
			description: [
				"FortiOS or FortiGate username.",
			]
			type:     "str"
			required: false
		}
		password: {
			description: [
				"FortiOS or FortiGate password.",
			]
			type:    "str"
			default: ""
		}
		vdom: {
			description: [
				"Virtual domain, among those defined previously. A vdom is a virtual instance of the FortiGate that can be configured and used as a different unit.",
			]

			type:    "str"
			default: "root"
		}
		https: {
			description: [
				"Indicates if the requests towards FortiGate must use HTTPS protocol.",
			]
			type:    "bool"
			default: true
		}
		ssl_verify: {
			description: [
				"Ensures FortiGate certificate must be verified by a proper CA.",
			]
			type:    "bool"
			default: true
		}
		state: {
			description: [
				"Indicates whether to create or remove the object.",
			]
			type:     "str"
			required: true
			choices: [
				"present",
				"absent",
			]
		}
		system_vdom_exception: {
			description: [
				"Global configuration objects that can be configured independently for all VDOMs or for the defined VDOM scope.",
			]
			default: null
			type:    "dict"
			suboptions: {
				id: {
					description: [
						"Index <1-4096>.",
					]
					required: true
					type:     "int"
				}
				object: {
					description: [
						"Name of the configuration object that can be configured independently for all VDOMs.",
					]
					type: "str"
					choices: [
						"log.fortianalyzer.setting",
						"log.fortianalyzer.override-setting",
					]
				}
				oid: {
					description: [
						"Object ID.",
					]
					type: "int"
				}
				scope: {
					description: [
						"Determine whether the configuration object can be configured separately for all VDOMs or if some VDOMs share the same configuration.",
					]
					type: "str"
					choices: [
						"all",
						"inclusive",
						"exclusive",
					]
				}
				vdom: {
					description: [
						"Names of the VDOMs.",
					]
					type: "list"
					suboptions: name: {
						description: [
							"VDOM name. Source system.vdom.name.",
						]
						required: true
						type:     "str"
					}
				}
			}
		}
	}
}
