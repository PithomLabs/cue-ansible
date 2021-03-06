package ansible

module: cnos_user: {
	module:            "cnos_user"
	version_added:     "2.8"
	author:            "Anil Kumar Muraleedharan (@amuraleedhar)"
	short_description: "Manage the collection of local users on Lenovo CNOS devices"
	description: [
		"This module provides declarative management of the local usernames configured on Lenovo CNOS devices.  It allows playbooks to manage either individual usernames or the collection of usernames in the current running config.  It also supports purging usernames from the configuration that are not explicitly defined.",
	]

	options: {
		aggregate: {
			description: [
				"The set of username objects to be configured on the remote Lenovo CNOS device.  The list entries can either be the username or a hash of username and properties.  This argument is mutually exclusive with the C(name) argument.",
			]

			aliases: ["users", "collection"]
		}
		name: description: [
			"The username to be configured on the remote Lenovo CNOS device.  This argument accepts a string value and is mutually exclusive with the C(aggregate) argument.",
		]

		configured_password: description: [
			"The password to be configured on the network device. The password needs to be provided in cleartext and it will be encrypted on the device. Please note that this option is not same as C(provider password).",
		]

		update_password: {
			description: [
				"Since passwords are encrypted in the device running config, this argument will instruct the module when to change the password.  When set to C(always), the password will always be updated in the device and when set to C(on_create) the password will be updated only if the username is created.",
			]

			default: "always"
			choices: ["on_create", "always"]
		}
		role: {
			description: [
				"The C(role) argument configures the role for the username in the device running configuration.  The argument accepts a string value defining the role name.  This argument does not check if the role has been configured on the device.",
			]

			aliases: ["roles"]
		}
		sshkey: description: [
			"The C(sshkey) argument defines the SSH public key to configure for the username.  This argument accepts a valid SSH key value.",
		]

		purge: {
			description: [
				"The C(purge) argument instructs the module to consider the resource definition absolute.  It will remove any previously configured usernames on the device with the exception of the `admin` user which cannot be deleted per cnos constraints.",
			]

			type:    "bool"
			default: "no"
		}
		state: {
			description: [
				"The C(state) argument configures the state of the username definition as it relates to the device operational configuration.  When set to I(present), the username(s) should be configured in the device active configuration and when set to I(absent) the username(s) should not be in the device active configuration",
			]

			default: "present"
			choices: ["present", "absent"]
		}
	}
}
