package ansible

module: purefb_s3user: {
	module:            "purefb_s3user"
	version_added:     "2.8"
	short_description: "Create or delete FlashBlade Object Store account users"
	description: [
		"Create or delete object store account users on a Pure Storage FlashBlade.",
	]
	author: [
		"Pure Storage Ansible Team (@sdodsley) <pure-ansible-team@purestorage.com>",
	]
	options: {
		state: {
			description: [
				"Create or delete object store account user",
			]
			default: "present"
			choices: ["absent", "present"]
			type: "str"
		}
		name: {
			description: [
				"The name of object store user",
			]
			type: "str"
		}
		account: {
			description: [
				"The name of object store account associated with user",
			]
			type: "str"
		}
		access_key: {
			description: [
				"Create secret access key.",
				"Key can be exposed using the I(debug) module",
			]
			type:    "bool"
			default: true
		}
	}
	extends_documentation_fragment: ["purestorage.fb"]
}
