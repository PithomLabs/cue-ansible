package ansible

module: avi_cluster: {
	module: "avi_cluster"
	author: "Gaurav Rastogi (@grastogi23) <grastogi@avinetworks.com>"

	short_description: "Module for setup of Cluster Avi RESTful Object"
	description: [
		"This module is used to configure Cluster object",
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
		name: {
			description: [
				"Name of the object.",
			]
			required: true
		}
		nodes: description: [
			"List of clusternode.",
		]
		rejoin_nodes_automatically: {
			description: [
				"Re-join cluster nodes automatically in the event one of the node is reset to factory.",
				"Default value when not specified in API or module is interpreted by Avi Controller as True.",
			]
			type: "bool"
		}
		tenant_ref: description: [
			"It is a reference to an object of type tenant.",
		]
		url: description: [
			"Avi controller URL of the object.",
		]
		uuid: description: [
			"Unique object identifier of the object.",
		]
		virtual_ip: description: [
			"A virtual ip address.",
			"This ip address will be dynamically reconfigured so that it always is the ip of the cluster leader.",
		]
	}
	extends_documentation_fragment: ["avi"]
}
