package ansible

module: rabbitmq_user: {
	module:            "rabbitmq_user"
	short_description: "Manage RabbitMQ users"
	description: [
		"Add or remove users to RabbitMQ and assign permissions",
	]
	version_added: "1.1"
	author:        "Chris Hoffman (@chrishoffman)"
	options: {
		user: {
			description: [
				"Name of user to add",
			]
			required: true
			aliases: ["username", "name"]
		}
		password: description: [
			"Password of user to add.",
			"To change the password of an existing user, you must also specify C(update_password=always).",
		]

		tags: description: [
			"User tags specified as comma delimited",
		]
		permissions: {
			description: [
				"a list of dicts, each dict contains vhost, configure_priv, write_priv, and read_priv, and represents a permission rule for that vhost.",
				"This option should be preferable when you care about all permissions of the user.",
				"You should use vhost, configure_priv, write_priv, and read_priv options instead if you care about permissions for just some vhosts.",
			]

			default: []
		}
		vhost: {
			description: [
				"vhost to apply access privileges.",
				"This option will be ignored when permissions option is used.",
			]
			default: "/"
		}
		node: {
			description: [
				"erlang node name of the rabbit we wish to configure",
			]
			default:       "rabbit"
			version_added: "1.2"
		}
		configure_priv: {
			description: [
				"Regular expression to restrict configure actions on a resource for the specified vhost.",
				"By default all actions are restricted.",
				"This option will be ignored when permissions option is used.",
			]
			default: "^$"
		}
		write_priv: {
			description: [
				"Regular expression to restrict configure actions on a resource for the specified vhost.",
				"By default all actions are restricted.",
				"This option will be ignored when permissions option is used.",
			]
			default: "^$"
		}
		read_priv: {
			description: [
				"Regular expression to restrict configure actions on a resource for the specified vhost.",
				"By default all actions are restricted.",
				"This option will be ignored when permissions option is used.",
			]
			default: "^$"
		}
		force: {
			description: [
				"Deletes and recreates the user.",
			]
			type:    "bool"
			default: "no"
		}
		state: {
			description: [
				"Specify if user is to be added or removed",
			]
			default: "present"
			choices: ["present", "absent"]
		}
		update_password: {
			description: [
				"C(on_create) will only set the password for newly created users.  C(always) will update passwords if they differ.",
			]
			required: false
			default:  "on_create"
			choices: ["on_create", "always"]
			version_added: "2.6"
		}
	}
}
