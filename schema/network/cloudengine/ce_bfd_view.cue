package ansible

module: ce_bfd_view: {
	module:            "ce_bfd_view"
	version_added:     "2.4"
	short_description: "Manages BFD session view configuration on HUAWEI CloudEngine devices."
	description: [
		"Manages BFD session view configuration on HUAWEI CloudEngine devices.",
	]
	author: "QijunPan (@QijunPan)"
	notes: [
		"This module requires the netconf system service be enabled on the remote device being managed.",
		"Recommended connection is C(netconf).",
		"This module also works with C(local) connections for legacy playbooks.",
	]
	options: {
		session_name: {
			description: [
				"Specifies the name of a BFD session. The value is a string of 1 to 15 case-sensitive characters without spaces.",
			]

			required: true
		}
		local_discr: description: [
			"Specifies the local discriminator of a BFD session. The value is an integer that ranges from 1 to 16384.",
		]

		remote_discr: description: [
			"Specifies the remote discriminator of a BFD session. The value is an integer that ranges from 1 to 4294967295.",
		]

		min_tx_interval: description: [
			"Specifies the minimum interval for receiving BFD packets. The value is an integer that ranges from 50 to 1000, in milliseconds.",
		]

		min_rx_interval: description: [
			"Specifies the minimum interval for sending BFD packets. The value is an integer that ranges from 50 to 1000, in milliseconds.",
		]

		detect_multi: description: [
			"Specifies the local detection multiplier of a BFD session. The value is an integer that ranges from 3 to 50.",
		]

		wtr_interval: description: [
			"Specifies the WTR time of a BFD session. The value is an integer that ranges from 1 to 60, in minutes. The default value is 0.",
		]

		tos_exp: description: [
			"Specifies a priority for BFD control packets. The value is an integer ranging from 0 to 7. The default value is 7, which is the highest priority.",
		]

		admin_down: {
			description: [
				"Enables the BFD session to enter the AdminDown state. By default, a BFD session is enabled. The default value is bool type.",
			]

			type:    "bool"
			default: "no"
		}
		description: description: [
			"Specifies the description of a BFD session. The value is a string of 1 to 51 case-sensitive characters with spaces.",
		]

		state: {
			description: [
				"Determines whether the config should be present or not on the device.",
			]
			default: "present"
			choices: ["present", "absent"]
		}
	}
	extends_documentation_fragment: "ce"
}
