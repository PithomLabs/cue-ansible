package ansible

module: netapp_e_firmware: {
	module:            "netapp_e_firmware"
	version_added:     "2.9"
	short_description: "NetApp E-Series manage firmware."
	description: [
		"Ensure specific firmware versions are activated on E-Series storage system.",
	]
	author: [
		"Nathan Swartz (@ndswartz)",
	]
	extends_documentation_fragment: [
		"netapp.eseries",
	]
	options: {
		nvsram: {
			description: [
				"Path to the NVSRAM file.",
			]
			type:     "str"
			required: true
		}
		firmware: {
			description: [
				"Path to the firmware file.",
			]
			type:     "str"
			required: true
		}
		wait_for_completion: {
			description: [
				"This flag will cause module to wait for any upgrade actions to complete.",
			]
			type:    "bool"
			default: false
		}
		ignore_health_check: {
			description: [
				"This flag will force firmware to be activated in spite of the health check.",
				"Use at your own risk. Certain non-optimal states could result in data loss.",
			]
			type:    "bool"
			default: false
		}
	}
}
