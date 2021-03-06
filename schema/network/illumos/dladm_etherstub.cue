package ansible

module: dladm_etherstub: {
	module:            "dladm_etherstub"
	short_description: "Manage etherstubs on Solaris/illumos systems."
	description: [
		"Create or delete etherstubs on Solaris/illumos systems.",
	]
	version_added: "2.2"
	author:        "Adam Števko (@xen0l)"
	options: {
		name: {
			description: ["Etherstub name."]
			required: true
		}
		temporary: {
			description: [
				"Specifies that the etherstub is temporary. Temporary etherstubs do not persist across reboots.",
			]

			required: false
			default:  false
			type:     "bool"
		}
		state: {
			description: ["Create or delete Solaris/illumos etherstub."]
			required: false
			default:  "present"
			choices: ["present", "absent"]
		}
	}
}
