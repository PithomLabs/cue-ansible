package ansible

module: ovirt_tag_info: {
	module:            "ovirt_tag_info"
	short_description: "Retrieve information about one or more oVirt/RHV tags"
	author:            "Ondra Machacek (@machacekondra)"
	version_added:     "2.3"
	description: [
		"Retrieve information about one or more oVirt/RHV tags.",
		"This module was called C(ovirt_tag_facts) before Ansible 2.9, returning C(ansible_facts). Note that the M(ovirt_tag_info) module no longer returns C(ansible_facts)!",
	]

	notes: [
		"This module returns a variable C(ovirt_tags), which contains a list of tags. You need to register the result with the I(register) keyword to use it.",
	]

	options: {
		name: description: [
			"Name of the tag which should be listed.",
		]
		vm: description: [
			"Name of the VM, which tags should be listed.",
		]
		host: description: [
			"Name of the host, which tags should be listed.",
		]
	}
	extends_documentation_fragment: "ovirt_info"
}
