package ansible

module: azure_rm_webapp: {
	module:            "azure_rm_webapp"
	version_added:     "2.7"
	short_description: "Manage Web App instances"
	description: [
		"Create, update and delete instance of Web App.",
	]

	options: {
		resource_group: {
			description: [
				"Name of the resource group to which the resource belongs.",
			]
			required: true
		}
		name: {
			description: [
				"Unique name of the app to create or update. To create or update a deployment slot, use the {slot} parameter.",
			]
			required: true
		}

		location: description: [
			"Resource location. If not set, location from the resource group will be used as default.",
		]

		plan: description: [
			"App service plan. Required for creation.",
			"Can be name of existing app service plan in same resource group as web app.",
			"Can be the resource ID of an existing app service plan. For example /subscriptions/<subs_id>/resourceGroups/<resource_group>/providers/Microsoft.Web/serverFarms/<plan_name>.",
			"Can be a dict containing five parameters, defined below.",
			"C(name), name of app service plan.",
			"C(resource_group), resource group of the app service plan.",
			"C(sku), SKU of app service plan, allowed values listed on U(https://azure.microsoft.com/en-us/pricing/details/app-service/linux/).",
			"C(is_linux), whether or not the app service plan is Linux. defaults to C(False).",
			"C(number_of_workers), number of workers for app service plan.",
		]

		frameworks: {
			description: [
				"Set of run time framework settings. Each setting is a dictionary.",
				"See U(https://docs.microsoft.com/en-us/azure/app-service/app-service-web-overview) for more info.",
			]
			suboptions: {
				name: {
					description: [
						"Name of the framework.",
						"Supported framework list for Windows web app and Linux web app is different.",
						"Windows web apps support C(java), C(net_framework), C(php), C(python), and C(node) from June 2018.",
						"Windows web apps support multiple framework at the same time.",
						"Linux web apps support C(java), C(ruby), C(php), C(dotnetcore), and C(node) from June 2018.",
						"Linux web apps support only one framework.",
						"Java framework is mutually exclusive with others.",
					]
					choices: [
						"java",
						"net_framework",
						"php",
						"python",
						"ruby",
						"dotnetcore",
						"node",
					]
				}
				version: description: [
					"Version of the framework. For Linux web app supported value, see U(https://aka.ms/linux-stacks) for more info.",
					"C(net_framework) supported value sample, C(v4.0) for .NET 4.6 and C(v3.0) for .NET 3.5.",
					"C(php) supported value sample, C(5.5), C(5.6), C(7.0).",
					"C(python) supported value sample, C(5.5), C(5.6), C(7.0).",
					"C(node) supported value sample, C(6.6), C(6.9).",
					"C(dotnetcore) supported value sample, C(1.0), C(1.1), C(1.2).",
					"C(ruby) supported value sample, C(2.3).",
					"C(java) supported value sample, C(1.9) for Windows web app. C(1.8) for Linux web app.",
				]
				settings: {
					description: [
						"List of settings of the framework.",
					]
					suboptions: {
						java_container: description: [
							"Name of Java container.",
							"Supported only when I(frameworks=java). Sample values C(Tomcat), C(Jetty).",
						]
						java_container_version: description: [
							"Version of Java container.",
							"Supported only when I(frameworks=java).",
							"Sample values for C(Tomcat), C(8.0), C(8.5), C(9.0). For C(Jetty,), C(9.1), C(9.3).",
						]
					}
				}
			}
		}

		container_settings: {
			description: [
				"Web app container settings.",
			]
			suboptions: {
				name: description: [
					"Name of container, for example C(imagename:tag).",
				]
				registry_server_url: description: [
					"Container registry server URL, for example C(mydockerregistry.io).",
				]
				registry_server_user: description: [
					"The container registry server user name.",
				]
				registry_server_password: description: [
					"The container registry server password.",
				]
			}
		}

		scm_type: description: [
			"Repository type of deployment source, for example C(LocalGit), C(GitHub).",
			"List of supported values maintained at U(https://docs.microsoft.com/en-us/rest/api/appservice/webapps/createorupdate#scmtype).",
		]

		deployment_source: {
			description: [
				"Deployment source for git.",
			]
			suboptions: {
				url: description: [
					"Repository url of deployment source.",
				]

				branch: description: [
					"The branch name of the repository.",
				]
			}
		}
		startup_file: description: [
			"The web's startup file.",
			"Used only for Linux web apps.",
		]

		client_affinity_enabled: {
			description: [
				"Whether or not to send session affinity cookies, which route client requests in the same session to the same instance.",
			]
			type:    "bool"
			default: true
		}

		https_only: {
			description: [
				"Configures web site to accept only https requests.",
			]
			type: "bool"
		}

		dns_registration: {
			description: [
				"Whether or not the web app hostname is registered with DNS on creation. Set to C(false) to register.",
			]
			type: "bool"
		}

		skip_custom_domain_verification: {
			description: [
				"Whether or not to skip verification of custom (non *.azurewebsites.net) domains associated with web app. Set to C(true) to skip.",
			]
			type: "bool"
		}

		ttl_in_seconds: description: [
			"Time to live in seconds for web app default domain name.",
		]

		app_settings: description: [
			"Configure web app application settings. Suboptions are in key value pair format.",
		]

		purge_app_settings: {
			description: [
				"Purge any existing application settings. Replace web app application settings with app_settings.",
			]
			type: "bool"
		}

		app_state: {
			description: [
				"Start/Stop/Restart the web app.",
			]
			type: "str"
			choices: [
				"started",
				"stopped",
				"restarted",
			]
			default: "started"
		}

		state: {
			description: [
				"State of the Web App.",
				"Use C(present) to create or update a Web App and C(absent) to delete it.",
			]
			default: "present"
			choices: [
				"absent",
				"present",
			]
		}
	}

	extends_documentation_fragment: [
		"azure",
		"azure_tags",
	]

	author: [
		"Yunge Zhu (@yungezz)",
	]
}
