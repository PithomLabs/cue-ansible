package ansible

module: fortios_wireless_controller_wids_profile: {
	module:            "fortios_wireless_controller_wids_profile"
	short_description: "Configure wireless intrusion detection system (WIDS) profiles in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify wireless_controller feature and wids_profile category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
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
		state: {
			description: [
				"Indicates whether to create or remove the object. This attribute was present already in previous version in a deeper level. It has been moved out to this outer level.",
			]

			type:     "str"
			required: false
			choices: [
				"present",
				"absent",
			]
			version_added: 2.9
		}
		wireless_controller_wids_profile: {
			description: [
				"Configure wireless intrusion detection system (WIDS) profiles.",
			]
			default: null
			type:    "dict"
			suboptions: {
				state: {
					description: [
						"B(Deprecated)",
						"Starting with Ansible 2.9 we recommend using the top-level 'state' parameter.",
						"HORIZONTALLINE",
						"Indicates whether to create or remove the object.",
					]
					type:     "str"
					required: false
					choices: [
						"present",
						"absent",
					]
				}
				ap_auto_suppress: {
					description: [
						"Enable/disable on-wire rogue AP auto-suppression .",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				ap_bgscan_disable_day: {
					description: [
						"Optionally turn off scanning for one or more days of the week. Separate the days with a space. By default, no days are set.",
					]
					type: "str"
					choices: [
						"sunday",
						"monday",
						"tuesday",
						"wednesday",
						"thursday",
						"friday",
						"saturday",
					]
				}
				ap_bgscan_disable_end: {
					description: [
						"End time, using a 24-hour clock in the format of hh:mm, for disabling background scanning .",
					]
					type: "str"
				}
				ap_bgscan_disable_start: {
					description: [
						"Start time, using a 24-hour clock in the format of hh:mm, for disabling background scanning .",
					]
					type: "str"
				}
				ap_bgscan_duration: {
					description: [
						"Listening time on a scanning channel (10 - 1000 msec).",
					]
					type: "int"
				}
				ap_bgscan_idle: {
					description: [
						"Waiting time for channel inactivity before scanning this channel (0 - 1000 msec).",
					]
					type: "int"
				}
				ap_bgscan_intv: {
					description: [
						"Period of time between scanning two channels (1 - 600 sec).",
					]
					type: "int"
				}
				ap_bgscan_period: {
					description: [
						"Period of time between background scans (60 - 3600 sec).",
					]
					type: "int"
				}
				ap_bgscan_report_intv: {
					description: [
						"Period of time between background scan reports (15 - 600 sec).",
					]
					type: "int"
				}
				ap_fgscan_report_intv: {
					description: [
						"Period of time between foreground scan reports (15 - 600 sec).",
					]
					type: "int"
				}
				ap_scan: {
					description: [
						"Enable/disable rogue AP detection.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				ap_scan_passive: {
					description: [
						"Enable/disable passive scanning. Enable means do not send probe request on any channels .",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				asleap_attack: {
					description: [
						"Enable/disable asleap attack detection .",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				assoc_flood_thresh: {
					description: [
						"The threshold value for association frame flooding.",
					]
					type: "int"
				}
				assoc_flood_time: {
					description: [
						"Number of seconds after which a station is considered not connected.",
					]
					type: "int"
				}
				assoc_frame_flood: {
					description: [
						"Enable/disable association frame flooding detection .",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				auth_flood_thresh: {
					description: [
						"The threshold value for authentication frame flooding.",
					]
					type: "int"
				}
				auth_flood_time: {
					description: [
						"Number of seconds after which a station is considered not connected.",
					]
					type: "int"
				}
				auth_frame_flood: {
					description: [
						"Enable/disable authentication frame flooding detection .",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				comment: {
					description: [
						"Comment.",
					]
					type: "str"
				}
				deauth_broadcast: {
					description: [
						"Enable/disable broadcasting de-authentication detection .",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				deauth_unknown_src_thresh: {
					description: [
						"Threshold value per second to deauth unknown src for DoS attack (0: no limit).",
					]
					type: "int"
				}
				eapol_fail_flood: {
					description: [
						"Enable/disable EAPOL-Failure flooding (to AP) detection .",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				eapol_fail_intv: {
					description: [
						"The detection interval for EAPOL-Failure flooding (1 - 3600 sec).",
					]
					type: "int"
				}
				eapol_fail_thresh: {
					description: [
						"The threshold value for EAPOL-Failure flooding in specified interval.",
					]
					type: "int"
				}
				eapol_logoff_flood: {
					description: [
						"Enable/disable EAPOL-Logoff flooding (to AP) detection .",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				eapol_logoff_intv: {
					description: [
						"The detection interval for EAPOL-Logoff flooding (1 - 3600 sec).",
					]
					type: "int"
				}
				eapol_logoff_thresh: {
					description: [
						"The threshold value for EAPOL-Logoff flooding in specified interval.",
					]
					type: "int"
				}
				eapol_pre_fail_flood: {
					description: [
						"Enable/disable premature EAPOL-Failure flooding (to STA) detection .",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				eapol_pre_fail_intv: {
					description: [
						"The detection interval for premature EAPOL-Failure flooding (1 - 3600 sec).",
					]
					type: "int"
				}
				eapol_pre_fail_thresh: {
					description: [
						"The threshold value for premature EAPOL-Failure flooding in specified interval.",
					]
					type: "int"
				}
				eapol_pre_succ_flood: {
					description: [
						"Enable/disable premature EAPOL-Success flooding (to STA) detection .",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				eapol_pre_succ_intv: {
					description: [
						"The detection interval for premature EAPOL-Success flooding (1 - 3600 sec).",
					]
					type: "int"
				}
				eapol_pre_succ_thresh: {
					description: [
						"The threshold value for premature EAPOL-Success flooding in specified interval.",
					]
					type: "int"
				}
				eapol_start_flood: {
					description: [
						"Enable/disable EAPOL-Start flooding (to AP) detection .",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				eapol_start_intv: {
					description: [
						"The detection interval for EAPOL-Start flooding (1 - 3600 sec).",
					]
					type: "int"
				}
				eapol_start_thresh: {
					description: [
						"The threshold value for EAPOL-Start flooding in specified interval.",
					]
					type: "int"
				}
				eapol_succ_flood: {
					description: [
						"Enable/disable EAPOL-Success flooding (to AP) detection .",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				eapol_succ_intv: {
					description: [
						"The detection interval for EAPOL-Success flooding (1 - 3600 sec).",
					]
					type: "int"
				}
				eapol_succ_thresh: {
					description: [
						"The threshold value for EAPOL-Success flooding in specified interval.",
					]
					type: "int"
				}
				invalid_mac_oui: {
					description: [
						"Enable/disable invalid MAC OUI detection.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				long_duration_attack: {
					description: [
						"Enable/disable long duration attack detection based on user configured threshold .",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				long_duration_thresh: {
					description: [
						"Threshold value for long duration attack detection (1000 - 32767 usec).",
					]
					type: "int"
				}
				name: {
					description: [
						"WIDS profile name.",
					]
					required: true
					type:     "str"
				}
				null_ssid_probe_resp: {
					description: [
						"Enable/disable null SSID probe response detection .",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				sensor_mode: {
					description: [
						"Scan WiFi nearby stations .",
					]
					type: "str"
					choices: [
						"disable",
						"foreign",
						"both",
					]
				}
				spoofed_deauth: {
					description: [
						"Enable/disable spoofed de-authentication attack detection .",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				weak_wep_iv: {
					description: [
						"Enable/disable weak WEP IV (Initialization Vector) detection .",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				wireless_bridge: {
					description: [
						"Enable/disable wireless bridge detection .",
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
