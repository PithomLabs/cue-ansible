package ansible

module: na_ontap_software_update: {
	author: "NetApp Ansible Team (@carchi8py) <ng-ansibleteam@netapp.com>"
	description: [
		"Update ONTAP software",
		"Requires an https connection and is not supported over http",
	]
	extends_documentation_fragment: [
		"netapp.na_ontap",
	]
	module: "na_ontap_software_update"
	options: {
		state: {
			choices: ["present", "absent"]
			description: [
				"Whether the specified ONTAP package should update or not.",
			]
			default: "present"
		}
		nodes: {
			description: [
				"List of nodes to be updated, the nodes have to be a part of a HA Pair.",
			]
			aliases: [
				"node",
			]
		}
		package_version: {
			required: true
			description: [
				"Specifies the package version to update software.",
			]
		}
		package_url: {
			required: true
			description: [
				"Specifies the package URL to download the package.",
			]
		}
		ignore_validation_warning: {
			description: [
				"Allows the update to continue if warnings are encountered during the validation phase.",
			]
			default: false
			type:    "bool"
		}
	}
	short_description: "NetApp ONTAP Update Software"
	version_added:     "2.7"
}
