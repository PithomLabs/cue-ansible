package ansible

module: os_keypair: {
	module:                         "os_keypair"
	short_description:              "Add/Delete a keypair from OpenStack"
	author:                         "Benno Joy (@bennojoy)"
	extends_documentation_fragment: "openstack"
	version_added:                  "2.0"
	description: [
		"Add or Remove key pair from OpenStack",
	]
	options: {
		name: {
			description: [
				"Name that has to be given to the key pair",
			]
			required: true
		}
		public_key: description: [
			"The public key that would be uploaded to nova and injected into VMs upon creation.",
		]

		public_key_file: description: [
			"Path to local file containing ssh public key. Mutually exclusive with public_key.",
		]

		state: {
			description: [
				"Should the resource be present or absent.",
			]
			choices: ["present", "absent"]
			default: "present"
		}
		availability_zone: description: ["Ignored. Present for backwards compatibility"]
	}
}
