package ansible

module: na_ontap_lun_map: {
	module: "na_ontap_lun_map"

	short_description: "NetApp ONTAP LUN maps"
	extends_documentation_fragment: [
		"netapp.na_ontap",
	]
	version_added: "2.6"
	author:        "NetApp Ansible Team (@carchi8py) <ng-ansibleteam@netapp.com>"

	description: [
		"Map and unmap LUNs on NetApp ONTAP.",
	]

	options: {

		state: {
			description: [
				"Whether the specified LUN should exist or not.",
			]
			choices: ["present", "absent"]
			default: "present"
		}

		initiator_group_name: {
			description: [
				"Initiator group to map to the given LUN.",
			]
			required: true
		}

		path: {
			description: [
				"Path of the LUN..",
			]
			required: true
		}

		vserver: {
			required: true
			description: [
				"The name of the vserver to use.",
			]
		}

		lun_id: description: [
			"LUN ID assigned for the map.",
		]
	}
}
