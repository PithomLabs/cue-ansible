package ansible

module: zabbix_host_info: {
	module:            "zabbix_host_info"
	short_description: "Gather information about Zabbix host"
	description: [
		"This module allows you to search for Zabbix host entries.",
		"This module was called C(zabbix_host_facts) before Ansible 2.9. The usage did not change.",
	]
	version_added: "2.7"
	author: [
		"Michael Miko (@RedWhiteMiko)",
	]
	requirements: [
		"python >= 2.6",
		"zabbix-api >= 0.5.3",
	]
	options: {
		host_name: {
			description: [
				"Name of the host in Zabbix.",
				"host_name is the unique identifier used and cannot be updated using this module.",
			]
			required: true
		}
		host_ip: {
			description: [
				"Host interface IP of the host in Zabbix.",
			]
			required: false
		}
		exact_match: {
			description: [
				"Find the exact match",
			]
			type:    "bool"
			default: false
		}
		remove_duplicate: {
			description: [
				"Remove duplicate host from host result",
			]
			type:    "bool"
			default: true
		}
		host_inventory: {
			description: [
				"List of host inventory keys to display in result.",
				"Whole host inventory is retrieved if keys are not specified.",
			]
			type:          "list"
			required:      false
			version_added: 2.8
		}
	}
	extends_documentation_fragment: ["zabbix"]
}
