package ansible

module: ovirt_template_info: {
	module:            "ovirt_template_info"
	short_description: "Retrieve information about one or more oVirt/RHV templates"
	author:            "Ondra Machacek (@machacekondra)"
	version_added:     "2.3"
	description: [
		"Retrieve information about one or more oVirt/RHV templates.",
		"This module was called C(ovirt_template_facts) before Ansible 2.9, returning C(ansible_facts). Note that the M(ovirt_template_info) module no longer returns C(ansible_facts)!",
	]

	notes: [
		"This module returns a variable C(ovirt_templates), which contains a list of templates. You need to register the result with the I(register) keyword to use it.",
	]

	options: pattern: description: [
		"Search term which is accepted by oVirt/RHV search backend.",
		"For example to search template X from datacenter Y use following pattern: name=X and datacenter=Y",
	]

	extends_documentation_fragment: "ovirt_info"
}
