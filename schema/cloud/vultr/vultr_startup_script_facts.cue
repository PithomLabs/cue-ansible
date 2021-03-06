package ansible

module: vultr_startup_script_facts: {
	module: "vultr_startup_script_facts"
	deprecated: {
		removed_in:  "2.13"
		why:         "Deprecated in favour of C(_info) module."
		alternative: "Use M(vultr_startup_script_info) instead."
	}
	short_description: "Gather facts about the Vultr startup scripts available."
	description: [
		"Gather facts about vultr_startup_scripts available.",
	]
	version_added:                  "2.7"
	author:                         "Yanis Guenane (@Spredzy)"
	extends_documentation_fragment: "vultr"
}
