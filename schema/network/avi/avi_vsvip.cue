package ansible

module: avi_vsvip: {
	module: "avi_vsvip"
	author: "Gaurav Rastogi (@grastogi23) <grastogi@avinetworks.com>"

	short_description: "Module for setup of VsVip Avi RESTful Object"
	description: [
		"This module is used to configure VsVip object",
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
		cloud_ref: description: [
			"It is a reference to an object of type cloud.",
			"Field introduced in 17.1.1.",
		]
		dns_info: description: [
			"Service discovery specific data including fully qualified domain name, type and time-to-live of the dns record.",
			"Field introduced in 17.1.1.",
		]
		east_west_placement: {
			description: [
				"Force placement on all service engines in the service engine group (container clouds only).",
				"Field introduced in 17.1.1.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			type: "bool"
		}
		name: {
			description: [
				"Name for the vsvip object.",
				"Field introduced in 17.1.1.",
			]
			required: true
		}
		tenant_ref: description: [
			"It is a reference to an object of type tenant.",
			"Field introduced in 17.1.1.",
		]
		url: description: [
			"Avi controller URL of the object.",
		]
		use_standard_alb: {
			description: [
				"This overrides the cloud level default and needs to match the se group value in which it will be used if the se group use_standard_alb value is",
				"set.",
				"This is only used when fip is used for vs on azure cloud.",
				"Field introduced in 18.2.3.",
			]
			version_added: "2.9"
			type:          "bool"
		}
		uuid: description: [
			"Uuid of the vsvip object.",
			"Field introduced in 17.1.1.",
		]
		vip: description: [
			"List of virtual service ips and other shareable entities.",
			"Field introduced in 17.1.1.",
		]
		vrf_context_ref: description: [
			"Virtual routing context that the virtual service is bound to.",
			"This is used to provide the isolation of the set of networks the application is attached to.",
			"It is a reference to an object of type vrfcontext.",
			"Field introduced in 17.1.1.",
		]
		vsvip_cloud_config_cksum: {
			description: [
				"Checksum of cloud configuration for vsvip.",
				"Internally set by cloud connector.",
				"Field introduced in 17.2.9, 18.1.2.",
			]
			version_added: "2.9"
		}
	}
	extends_documentation_fragment: ["avi"]
}
