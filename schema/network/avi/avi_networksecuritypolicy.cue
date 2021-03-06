package ansible

module: avi_networksecuritypolicy: {
	module: "avi_networksecuritypolicy"
	author: "Gaurav Rastogi (@grastogi23) <grastogi@avinetworks.com>"

	short_description: "Module for setup of NetworkSecurityPolicy Avi RESTful Object"
	description: [
		"This module is used to configure NetworkSecurityPolicy object",
		"more examples at U(https://github.com/avinetworks/devops)",
	]
	requirements: ["avisdk"]
	version_added: "2.4"
	options: {
		state: {
			description: [
				"The state that should be applied on the entity.",
			]
			default: "present"
			choices: ["absent", "present"]
		}
		avi_api_update_method: {
			description: [
				"Default method for object update is HTTP PUT.",
				"Setting to patch will override that behavior to use HTTP PATCH.",
			]
			version_added: "2.5"
			default:       "put"
			choices: ["put", "patch"]
		}
		avi_api_patch_op: {
			description: [
				"Patch operation to use when using avi_api_update_method as patch.",
			]
			version_added: "2.5"
			choices: ["add", "replace", "delete"]
		}
		cloud_config_cksum: description: [
			"Checksum of cloud configuration for network sec policy.",
			"Internally set by cloud connector.",
		]
		created_by: description: [
			"Creator name.",
		]
		description: description: [
			"User defined description for the object.",
		]
		name: description: [
			"Name of the object.",
		]
		rules: description: [
			"List of networksecurityrule.",
		]
		tenant_ref: description: [
			"It is a reference to an object of type tenant.",
		]
		url: description: [
			"Avi controller URL of the object.",
		]
		uuid: description: [
			"Unique object identifier of the object.",
		]
	}
	extends_documentation_fragment: ["avi"]
}
