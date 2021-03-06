package ansible

module: na_ontap_ntp: {
	module:            "na_ontap_ntp"
	short_description: "NetApp ONTAP NTP server"
	extends_documentation_fragment: [
		"netapp.na_ontap",
	]
	version_added: "2.6"
	author:        "NetApp Ansible Team (@carchi8py) <ng-ansibleteam@netapp.com>"
	description: [
		"Create or delete or modify NTP server in ONTAP",
	]
	options: {
		state: {
			description: [
				"Whether the specified NTP server should exist or not.",
			]
			choices: ["present", "absent"]
			default: "present"
		}
		server_name: {
			description: [
				"The name of the NTP server to manage.",
			]
			required: true
		}
		version: {
			description: [
				"give version for NTP server",
			]
			choices: ["auto", "3", "4"]
			default: "auto"
		}
	}
}
