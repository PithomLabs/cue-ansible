package ansible

module: cs_snapshot_policy: {
	module:            "cs_snapshot_policy"
	short_description: "Manages volume snapshot policies on Apache CloudStack based clouds."
	description: [
		"Create, update and delete volume snapshot policies.",
	]
	version_added: "2.2"
	author:        "René Moser (@resmo)"
	options: {
		volume: {
			description: [
				"Name of the volume.",
				"Either I(volume) or I(vm) is required.",
			]
			type: "str"
		}
		volume_type: {
			description: ["Type of the volume."]
			type: "str"
			choices: [
				"DATADISK",
				"ROOT",
			]
			version_added: "2.3"
		}
		vm: {
			description: [
				"Name of the instance to select the volume from.",
				"Use I(volume_type) if VM has a DATADISK and ROOT volume.",
				"In case of I(volume_type=DATADISK), additionally use I(device_id) if VM has more than one DATADISK volume.",
				"Either I(volume) or I(vm) is required.",
			]
			type:          "str"
			version_added: "2.3"
		}
		device_id: {
			description: [
				"ID of the device on a VM the volume is attached to.",
				"This will only be considered if VM has multiple DATADISK volumes.",
			]
			type:          "int"
			version_added: "2.3"
		}
		vpc: {
			description: ["Name of the vpc the instance is deployed in."]
			type:          "str"
			version_added: "2.3"
		}
		interval_type: {
			description: ["Interval of the snapshot."]
			type:    "str"
			default: "daily"
			choices: ["hourly", "daily", "weekly", "monthly"]
			aliases: ["interval"]
		}
		max_snaps: {
			description: ["Max number of snapshots."]
			type:    "int"
			default: 8
			aliases: ["max"]
		}
		schedule: {
			description: [
				"Time the snapshot is scheduled. Required if I(state=present).",
				"Format for I(interval_type=HOURLY): C(MM)",
				"Format for I(interval_type=DAILY): C(MM:HH)",
				"Format for I(interval_type=WEEKLY): C(MM:HH:DD (1-7))",
				"Format for I(interval_type=MONTHLY): C(MM:HH:DD (1-28))",
			]
			type: "str"
		}
		time_zone: {
			description: ["Specifies a timezone for this command."]
			type:    "str"
			default: "UTC"
			aliases: ["timezone"]
		}
		state: {
			description: ["State of the snapshot policy."]
			type:    "str"
			default: "present"
			choices: ["present", "absent"]
		}
		domain: {
			description: ["Domain the volume is related to."]
			type: "str"
		}
		account: {
			description: ["Account the volume is related to."]
			type: "str"
		}
		project: {
			description: ["Name of the project the volume is related to."]
			type: "str"
		}
	}
	extends_documentation_fragment: "cloudstack"
}
