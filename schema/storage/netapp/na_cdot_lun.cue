package ansible

module: na_cdot_lun: {
	module: "na_cdot_lun"

	short_description: "Manage  NetApp cDOT luns"
	extends_documentation_fragment: [
		"netapp.ontap",
	]
	version_added: "2.3"
	author:        "Sumit Kumar (@timuster) <sumit4@netapp.com>"

	deprecated: {
		removed_in:  "2.11"
		why:         "Updated modules released with increased functionality"
		alternative: "Use M(na_ontap_lun) instead."
	}

	description: [
		"Create, destroy, resize luns on NetApp cDOT.",
	]

	options: {

		state: {
			description: [
				"Whether the specified lun should exist or not.",
			]
			required: true
			choices: ["present", "absent"]
		}

		name: {
			description: [
				"The name of the lun to manage.",
			]
			required: true
		}

		flexvol_name: description: [
			"The name of the FlexVol the lun should exist on.",
			"Required when C(state=present).",
		]

		size: description: [
			"The size of the lun in C(size_unit).",
			"Required when C(state=present).",
		]

		size_unit: {
			description: [
				"The unit used to interpret the size parameter.",
			]
			choices: ["bytes", "b", "kb", "mb", "gb", "tb", "pb", "eb", "zb", "yb"]
			default: "gb"
		}

		force_resize: {
			description: [
				"Forcibly reduce the size. This is required for reducing the size of the LUN to avoid accidentally reducing the LUN size.",
			]
			default: false
		}

		force_remove: {
			description: [
				"If \"true\", override checks that prevent a LUN from being destroyed if it is online and mapped.",
				"If \"false\", destroying an online and mapped LUN will fail.",
			]
			default: false
		}

		force_remove_fenced: {
			description: [
				"If \"true\", override checks that prevent a LUN from being destroyed while it is fenced.",
				"If \"false\", attempting to destroy a fenced LUN will fail.",
				"The default if not specified is \"false\". This field is available in Data ONTAP 8.2 and later.",
			]
			default: false
		}

		vserver: {
			required: true
			description: [
				"The name of the vserver to use.",
			]
		}
	}
}
