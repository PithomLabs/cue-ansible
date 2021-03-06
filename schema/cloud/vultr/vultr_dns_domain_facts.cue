package ansible

module: vultr_dns_domain_facts: {
	module: "vultr_dns_domain_facts"
	deprecated: {
		removed_in:  "2.13"
		why:         "Deprecated in favour of C(_info) module."
		alternative: "Use M(vultr_dns_domain_info) instead."
	}
	short_description: "Gather facts about the Vultr DNS domains available."
	description: [
		"Gather facts about DNS domains available in Vultr.",
	]
	version_added:                  "2.7"
	author:                         "Yanis Guenane (@Spredzy)"
	extends_documentation_fragment: "vultr"
}
