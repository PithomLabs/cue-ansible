package ansible

module: online_server_facts: {
	module: "online_server_facts"
	deprecated: {
		removed_in:  "2.13"
		why:         "Deprecated in favour of C(_info) module."
		alternative: "Use M(online_server_info) instead."
	}
	short_description: "Gather facts about Online servers."
	description: [
		"Gather facts about the servers.",
		"U(https://www.online.net/en/dedicated-server)",
	]
	version_added: "2.8"
	author: [
		"Remy Leone (@sieben)",
	]
	extends_documentation_fragment: "online"
}
