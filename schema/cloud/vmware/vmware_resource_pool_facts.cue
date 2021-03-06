package ansible

module: vmware_resource_pool_facts: {
	module: "vmware_resource_pool_facts"
	deprecated: {
		removed_in:  "2.13"
		why:         "Deprecated in favour of C(_info) module."
		alternative: "Use M(vmware_resource_pool_info) instead."
	}
	short_description: "Gathers facts about resource pool information"
	description: [
		"This module can be used to gather facts about all resource configuration information.",
	]
	version_added: "2.6"
	author: [
		"Abhijeet Kasurde (@Akasurde)",
	]
	notes: [
		"Tested on vSphere 6.5",
	]
	requirements: [
		"python >= 2.6",
		"PyVmomi",
	]
	extends_documentation_fragment: "vmware.documentation"
}
