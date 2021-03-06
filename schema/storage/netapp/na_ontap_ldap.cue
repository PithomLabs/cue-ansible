package ansible

module: na_ontap_ldap: {
	module: "na_ontap_ldap"

	short_description: "NetApp ONTAP LDAP"
	extends_documentation_fragment: [
		"netapp.na_ontap",
	]
	version_added: "2.9"
	author:        "Milan Zink (@zeten30) <zeten30@gmail.com>/<mzink@redhat.com>"

	description: [
		"Create, modify or delete LDAP on NetApp ONTAP SVM/vserver",
	]

	options: {

		state: {
			description: [
				"Whether the LDAP is present or not.",
			]
			choices: ["present", "absent"]
			default: "present"
			type:    "str"
		}

		vserver: {
			description: [
				"vserver/svm configured to use LDAP",
			]
			required: true
			type:     "str"
		}

		name: {
			description: [
				"The name of LDAP client configuration",
			]
			required: true
			type:     "str"
		}

		skip_config_validation: {
			description: [
				"Skip LDAP validation",
			]
			choices: ["true", "false"]
			type: "str"
		}
	}
}
