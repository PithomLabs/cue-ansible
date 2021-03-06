package ansible

module: ovirt_api_info: {
	module:            "ovirt_api_info"
	short_description: "Retrieve information about the oVirt/RHV API"
	author:            "Ondra Machacek (@machacekondra)"
	version_added:     "2.5"
	description: [
		"Retrieve information about the oVirt/RHV API.",
		"This module was called C(ovirt_api_facts) before Ansible 2.9, returning C(ansible_facts). Note that the M(ovirt_api_info) module no longer returns C(ansible_facts)!",
	]

	notes: [
		"This module returns a variable C(ovirt_api), which contains a information about oVirt/RHV API. You need to register the result with the I(register) keyword to use it.",
	]

	extends_documentation_fragment: "ovirt_info"
}
