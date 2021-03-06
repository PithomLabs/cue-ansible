package ansible

module: katello: {
	module:            "katello"
	short_description: "Manage Katello Resources"
	deprecated: {
		removed_in:  "2.12"
		why:         "Replaced by re-designed individual modules living at https://github.com/theforeman/foreman-ansible-modules"
		alternative: "https://github.com/theforeman/foreman-ansible-modules"
	}
	description: [
		"Allows the management of Katello resources inside your Foreman server.",
	]
	version_added: "2.3"
	author: [
		"Eric D Helms (@ehelms)",
	]
	requirements: [
		"nailgun >= 0.28.0",
		"python >= 2.6",
		"datetime",
	]
	options: {
		server_url: {
			description: [
				"URL of Foreman server.",
			]
			required: true
		}
		username: {
			description: [
				"Username on Foreman server.",
			]
			required: true
		}
		password: {
			description: [
				"Password for user accessing Foreman server.",
			]
			required: true
		}
		entity: {
			description: [
				"The Foreman resource that the action will be performed on (e.g. organization, host).",
			]
			choices: [
				"repository",
				"manifest",
				"repository_set",
				"sync_plan",
				"content_view",
				"lifecycle_environment",
				"activation_key",
				"product",
			]

			required: true
		}
		action: {
			description: [
				"action associated to the entity resource to set or edit in dictionary format.",
				"Possible Action in relation to Entitys.",
				"sync (available when entity=product or entity=repository)",
				"publish (available when entity=content_view)",
				"promote (available when entity=content_view)",
			]
			choices: [
				"sync",
				"publish",
				"promote",
			]
			required: false
		}
		params: {
			description: [
				"Parameters associated to the entity resource and action, to set or edit in dictionary format.",
				"Each choice may be only available with specific entitys and actions.",
				"Possible Choices are in the format of param_name ([entry,action,action,...],[entity,..],...).",
				"The action \"None\" means no action specified.",
				"Possible Params in relation to entity and action.",
				"name ([product,sync,None], [repository,sync], [repository_set,None], [sync_plan,None],",
				"[content_view,promote,publish,None], [lifecycle_environment,None], [activation_key,None])",
				"organization ([product,sync,None] ,[repository,sync,None], [repository_set,None], [sync_plan,None], ",
				"[content_view,promote,publish,None], [lifecycle_environment,None], [activation_key,None])",
				"content ([manifest,None])",
				"product ([repository,sync,None], [repository_set,None], [sync_plan,None])",
				"basearch ([repository_set,None])",
				"releaserver ([repository_set,None])",
				"sync_date ([sync_plan,None])",
				"interval ([sync_plan,None])",
				"repositories ([content_view,None])",
				"from_environment ([content_view,promote])",
				"to_environment([content_view,promote])",
				"prior ([lifecycle_environment,None])",
				"content_view ([activation_key,None])",
				"lifecycle_environment ([activation_key,None])",
			]
			required: true
		}
		task_timeout: {
			description: [
				"The timeout in seconds to wait for the started Foreman action to finish.",
				"If the timeout is reached and the Foreman action did not complete, the ansible task fails. However the foreman action does not get canceled.",
			]
			default:       1000
			version_added: "2.7"
			required:      false
		}
		verify_ssl: {
			description: [
				"verify the ssl/https connection (e.g for a valid certificate)",
			]
			default:  false
			type:     "bool"
			required: false
		}
	}
}
