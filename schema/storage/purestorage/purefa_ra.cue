package ansible

module: purefa_ra: {
	module:            "purefa_ra"
	version_added:     "2.8"
	short_description: "Enable or Disable Pure Storage FlashArray Remote Assist"
	description: [
		"Enable or Disable Remote Assist for a Pure Storage FlashArray.",
	]
	author: [
		"Pure Storage Ansible Team (@sdodsley) <pure-ansible-team@purestorage.com>",
	]
	options: state: {
		description: [
			"Define state of remote assist",
			"When set to I(enable) the RA port can be exposed using the I(debug) module.",
		]

		type:    "str"
		default: "enable"
		choices: ["enable", "disable"]
	}
	extends_documentation_fragment: ["purestorage.fa"]
}
