package ansible

module: fortios_log_fortianalyzer3_setting: {
	module:            "fortios_log_fortianalyzer3_setting"
	short_description: "Global FortiAnalyzer settings in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify log_fortianalyzer3 feature and setting category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
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
		log_fortianalyzer3_setting: {
			description: [
				"Global FortiAnalyzer settings.",
			]
			default: null
			type:    "dict"
			suboptions: {
				__change_ip: {
					description: [
						"Hidden attribute.",
					]
					type: "int"
				}
				certificate: {
					description: [
						"Certificate used to communicate with FortiAnalyzer. Source certificate.local.name.",
					]
					type: "str"
				}
				conn_timeout: {
					description: [
						"FortiAnalyzer connection time-out in seconds (for status and log buffer).",
					]
					type: "int"
				}
				enc_algorithm: {
					description: [
						"Enable/disable sending FortiAnalyzer log data with SSL encryption.",
					]
					type: "str"
					choices: [
						"high-medium",
						"high",
						"low",
					]
				}
				faz_type: {
					description: [
						"Hidden setting index of FortiAnalyzer.",
					]
					type: "int"
				}
				hmac_algorithm: {
					description: [
						"FortiAnalyzer IPsec tunnel HMAC algorithm.",
					]
					type: "str"
					choices: [
						"sha256",
						"sha1",
					]
				}
				ips_archive: {
					description: [
						"Enable/disable IPS packet archive logging.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				mgmt_name: {
					description: [
						"Hidden management name of FortiAnalyzer.",
					]
					type: "str"
				}
				monitor_failure_retry_period: {
					description: [
						"Time between FortiAnalyzer connection retries in seconds (for status and log buffer).",
					]
					type: "int"
				}
				monitor_keepalive_period: {
					description: [
						"Time between OFTP keepalives in seconds (for status and log buffer).",
					]
					type: "int"
				}
				reliable: {
					description: [
						"Enable/disable reliable logging to FortiAnalyzer.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				server: {
					description: [
						"The remote FortiAnalyzer.",
					]
					type: "str"
				}
				source_ip: {
					description: [
						"Source IPv4 or IPv6 address used to communicate with FortiAnalyzer.",
					]
					type: "str"
				}
				ssl_min_proto_version: {
					description: [
						"Minimum supported protocol version for SSL/TLS connections .",
					]
					type: "str"
					choices: [
						"default",
						"SSLv3",
						"TLSv1",
						"TLSv1-1",
						"TLSv1-2",
					]
				}
				status: {
					description: [
						"Enable/disable logging to FortiAnalyzer.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				upload_day: {
					description: [
						"Day of week (month) to upload logs.",
					]
					type: "str"
				}
				upload_interval: {
					description: [
						"Frequency to upload log files to FortiAnalyzer.",
					]
					type: "str"
					choices: [
						"daily",
						"weekly",
						"monthly",
					]
				}
				upload_option: {
					description: [
						"Enable/disable logging to hard disk and then uploading to FortiAnalyzer.",
					]
					type: "str"
					choices: [
						"store-and-upload",
						"realtime",
						"1-minute",
						"5-minute",
					]
				}
				upload_time: {
					description: [
						"Time to upload logs (hh:mm).",
					]
					type: "str"
				}
			}
		}
	}
}
