package ansible

module: scaleway_security_group_info: {
	module:            "scaleway_security_group_info"
	short_description: "Gather information about the Scaleway security groups available."
	description: [
		"Gather information about the Scaleway security groups available.",
	]
	version_added: "2.9"
	author: [
		"Yanis Guenane (@Spredzy)",
		"Remy Leone (@sieben)",
	]
	options: region: {
		description: [
			"Scaleway region to use (for example C(par1)).",
		]
		required: true
		choices: [
			"ams1",
			"EMEA-NL-EVS",
			"par1",
			"EMEA-FR-PAR1",
		]
	}
	extends_documentation_fragment: "scaleway"
}
