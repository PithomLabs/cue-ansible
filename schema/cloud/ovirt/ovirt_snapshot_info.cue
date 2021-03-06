package ansible

module: ovirt_snapshot_info: {
	module:            "ovirt_snapshot_info"
	short_description: "Retrieve information about one or more oVirt/RHV virtual machine snapshots"
	author:            "Ondra Machacek (@machacekondra)"
	version_added:     "2.3"
	description: [
		"Retrieve information about one or more oVirt/RHV virtual machine snapshots.",
		"This module was called C(ovirt_snapshot_facts) before Ansible 2.9, returning C(ansible_facts). Note that the M(ovirt_snapshot_info) module no longer returns C(ansible_facts)!",
	]

	notes: [
		"This module returns a variable C(ovirt_snapshots), which contains a list of snapshots. You need to register the result with the I(register) keyword to use it.",
	]

	options: {
		vm: {
			description: [
				"Name of the VM with snapshot.",
			]
			required: true
		}
		description: description: [
			"Description of the snapshot, can be used as glob expression.",
		]
		snapshot_id: description: [
			"Id of the snapshot we want to retrieve information about.",
		]
	}
	extends_documentation_fragment: "ovirt_info"
}
