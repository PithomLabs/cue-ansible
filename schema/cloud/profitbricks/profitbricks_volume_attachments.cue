package ansible

module: profitbricks_volume_attachments: {
	module:            "profitbricks_volume_attachments"
	short_description: "Attach or detach a volume."
	description: [
		"Allows you to attach or detach a volume from a ProfitBricks server. This module has a dependency on profitbricks >= 1.0.0",
	]
	version_added: "2.0"
	options: {
		datacenter: {
			description: [
				"The datacenter in which to operate.",
			]
			required: true
		}
		server: {
			description: [
				"The name of the server you wish to detach or attach the volume.",
			]
			required: true
		}
		volume: {
			description: [
				"The volume name or ID.",
			]
			required: true
		}
		subscription_user: {
			description: [
				"The ProfitBricks username. Overrides the PB_SUBSCRIPTION_ID environment variable.",
			]
			required: false
		}
		subscription_password: {
			description: [
				"THe ProfitBricks password. Overrides the PB_PASSWORD environment variable.",
			]
			required: false
		}
		wait: {
			description: [
				"wait for the operation to complete before returning",
			]
			required: false
			default:  "yes"
			type:     "bool"
		}
		wait_timeout: {
			description: [
				"how long before wait gives up, in seconds",
			]
			default: 600
		}
		state: {
			description: [
				"Indicate desired state of the resource",
			]
			required: false
			default:  "present"
			choices: ["present", "absent"]
		}
	}

	requirements: ["profitbricks"]
	author: "Matt Baldwin (@baldwinSPC) <baldwin@stackpointcloud.com>"
}
