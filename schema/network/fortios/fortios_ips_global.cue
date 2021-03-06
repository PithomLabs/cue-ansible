package ansible

module: fortios_ips_global: {
	module:            "fortios_ips_global"
	short_description: "Configure IPS global parameter in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify ips feature and global category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
	]

	version_added: "2.8"
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
			type:          "bool"
			default:       true
			version_added: 2.9
		}
		ips_global: {
			description: [
				"Configure IPS global parameter.",
			]
			default: null
			type:    "dict"
			suboptions: {
				anomaly_mode: {
					description: [
						"Global blocking mode for rate-based anomalies.",
					]
					type: "str"
					choices: [
						"periodical",
						"continuous",
					]
				}
				database: {
					description: [
						"Regular or extended IPS database. Regular protects against the latest common and in-the-wild attacks. Extended includes protection from legacy attacks.",
					]

					type: "str"
					choices: [
						"regular",
						"extended",
					]
				}
				deep_app_insp_db_limit: {
					description: [
						"Limit on number of entries in deep application inspection database (1 - 2147483647, 0 = use recommended setting)",
					]
					type: "int"
				}
				deep_app_insp_timeout: {
					description: [
						"Timeout for Deep application inspection (1 - 2147483647 sec., 0 = use recommended setting).",
					]
					type: "int"
				}
				engine_count: {
					description: [
						"Number of IPS engines running. If set to the default value of 0, FortiOS sets the number to optimize performance depending on the number of CPU cores.",
					]

					type: "int"
				}
				exclude_signatures: {
					description: [
						"Excluded signatures.",
					]
					type: "str"
					choices: [
						"none",
						"industrial",
					]
				}
				fail_open: {
					description: [
						"Enable to allow traffic if the IPS process crashes. Default is disable and IPS traffic is blocked when the IPS process crashes.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				intelligent_mode: {
					description: [
						"Enable/disable IPS adaptive scanning (intelligent mode). Intelligent mode optimizes the scanning method for the type of traffic.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				session_limit_mode: {
					description: [
						"Method of counting concurrent sessions used by session limit anomalies. Choose between greater accuracy (accurate) or improved performance (heuristics).",
					]

					type: "str"
					choices: [
						"accurate",
						"heuristic",
					]
				}
				skype_client_public_ipaddr: {
					description: [
						"Public IP addresses of your network that receive Skype sessions. Helps identify Skype sessions. Separate IP addresses with commas.",
					]
					type: "str"
				}
				socket_size: {
					description: [
						"IPS socket buffer size (0 - 256 MB). Default depends on available memory. Can be changed to tune performance.",
					]
					type: "int"
				}
				sync_session_ttl: {
					description: [
						"Enable/disable use of kernel session TTL for IPS sessions.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				traffic_submit: {
					description: [
						"Enable/disable submitting attack data found by this FortiGate to FortiGuard.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
			}
		}
	}
}
