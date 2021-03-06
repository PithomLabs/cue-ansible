package ansible

module: azure_rm_trafficmanagerprofile: {
	module:            "azure_rm_trafficmanagerprofile"
	version_added:     "2.7"
	short_description: "Manage Azure Traffic Manager profile"
	description: [
		"Create, update and delete a Traffic Manager profile.",
	]

	options: {
		resource_group: {
			description: [
				"Name of a resource group where the Traffic Manager profile exists or will be created.",
			]
			required: true
		}
		name: {
			description: [
				"Name of the Traffic Manager profile.",
			]
			required: true
		}
		state: {
			description: [
				"Assert the state of the Traffic Manager profile. Use C(present) to create or update a Traffic Manager profile and C(absent) to delete it.",
			]
			default: "present"
			choices: [
				"absent",
				"present",
			]
		}
		location: {
			description: [
				"Valid Azure location. Defaults to C(global) because in default public Azure cloud, Traffic Manager profile can only be deployed globally.",
				"Reference U(https://docs.microsoft.com/en-us/azure/traffic-manager/quickstart-create-traffic-manager-profile#create-a-traffic-manager-profile).",
			]
			default: "global"
		}
		profile_status: {
			description: [
				"The status of the Traffic Manager profile.",
			]
			default: "enabled"
			choices: [
				"enabled",
				"disabled",
			]
		}
		routing_method: {
			description: [
				"The traffic routing method of the Traffic Manager profile.",
			]
			default: "performance"
			choices: [
				"performance",
				"priority",
				"weighted",
				"geographic",
			]
		}
		dns_config: {
			description: [
				"The DNS settings of the Traffic Manager profile.",
			]
			suboptions: {
				relative_name: description: [
					"The relative DNS name provided by this Traffic Manager profile.",
					"If not provided, name of the Traffic Manager will be used.",
				]
				ttl: {
					description: [
						"The DNS Time-To-Live (TTL), in seconds.",
					]
					type:    "int"
					default: 60
				}
			}
		}
		monitor_config: {
			description: [
				"The endpoint monitoring settings of the Traffic Manager profile.",
			]
			suboptions: {
				protocol: {
					description: [
						"The protocol C(HTTP), C(HTTPS) or C(TCP) used to probe for endpoint health.",
					]
					choices: [
						"HTTP",
						"HTTPS",
						"TCP",
					]
				}
				port: description: [
					"The TCP port used to probe for endpoint health.",
				]
				path: description: [
					"The path relative to the endpoint domain name used to probe for endpoint health.",
				]
				interval: {
					description: [
						"The monitor interval for endpoints in this profile in seconds.",
					]
					type: "int"
				}
				timeout: {
					description: [
						"The monitor timeout for endpoints in this profile in seconds.",
					]
					type: "int"
				}
				tolerated_failures: description: [
					"The number of consecutive failed health check before declaring an endpoint in this profile Degraded after the next failed health check.",
				]
			}
			default: {
				protocol: "HTTP"
				port:     80
				path:     "/"
			}
		}
	}

	extends_documentation_fragment: [
		"azure",
		"azure_tags",
	]

	author: [
		"Hai Cao (@caohai)",
		"Yunge Zhu (@yungezz)",
	]
}
