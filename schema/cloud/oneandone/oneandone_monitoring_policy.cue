package ansible

module: oneandone_monitoring_policy: {
	module:            "oneandone_monitoring_policy"
	short_description: "Configure 1&1 monitoring policy."
	description: [
		"Create, remove, update monitoring policies (and add/remove ports, processes, and servers). This module has a dependency on 1and1 >= 1.0",
	]

	version_added: "2.5"
	options: {
		state: {
			description: [
				"Define a monitoring policy's state to create, remove, update.",
			]
			required: false
			default:  "present"
			choices: ["present", "absent", "update"]
		}
		auth_token: {
			description: [
				"Authenticating API token provided by 1&1.",
			]
			required: true
		}
		api_url: {
			description: [
				"Custom API URL. Overrides the ONEANDONE_API_URL environement variable.",
			]

			required: false
		}
		name: {
			description: [
				"Monitoring policy name used with present state. Used as identifier (id or name) when used with absent state. maxLength=128",
			]
			required: true
		}
		monitoring_policy: {
			description: [
				"The identifier (id or name) of the monitoring policy used with update state.",
			]
			required: true
		}
		agent: {
			description: [
				"Set true for using agent.",
			]
			required: true
		}
		email: {
			description: [
				"User's email. maxLength=128",
			]
			required: true
		}
		description: {
			description: [
				"Monitoring policy description. maxLength=256",
			]
			required: false
		}
		thresholds: {
			description: [
				"Monitoring policy thresholds. Each of the suboptions have warning and critical, which both have alert and value suboptions. Warning is used to set limits for warning alerts, critical is used to set critical alerts. alert enables alert, and value is used to advise when the value is exceeded.",
			]

			required: true
			suboptions: {
				cpu: {
					description: [
						"Consumption limits of CPU.",
					]
					required: true
				}
				ram: {
					description: [
						"Consumption limits of RAM.",
					]
					required: true
				}
				disk: {
					description: [
						"Consumption limits of hard disk.",
					]
					required: true
				}
				internal_ping: {
					description: [
						"Response limits of internal ping.",
					]
					required: true
				}
				transfer: {
					description: [
						"Consumption limits for transfer.",
					]
					required: true
				}
			}
		}
		ports: {
			description: [
				"Array of ports that will be monitoring.",
			]
			required: true
			suboptions: {
				protocol: {
					description: [
						"Internet protocol.",
					]
					choices: ["TCP", "UDP"]
					required: true
				}
				port: {
					description: [
						"Port number. minimum=1, maximum=65535",
					]
					required: true
				}
				alert_if: {
					description: [
						"Case of alert.",
					]
					choices: ["RESPONDING", "NOT_RESPONDING"]
					required: true
				}
				email_notification: {
					description: [
						"Set true for sending e-mail notifications.",
					]
					required: true
				}
			}
		}
		processes: {
			description: [
				"Array of processes that will be monitoring.",
			]
			required: true
			suboptions: {
				process: {
					description: [
						"Name of the process. maxLength=50",
					]
					required: true
				}
				alert_if: {
					description: [
						"Case of alert.",
					]
					choices: ["RUNNING", "NOT_RUNNING"]
					required: true
				}
			}
		}
		add_ports: {
			description: [
				"Ports to add to the monitoring policy.",
			]
			required: false
		}
		add_processes: {
			description: [
				"Processes to add to the monitoring policy.",
			]
			required: false
		}
		add_servers: {
			description: [
				"Servers to add to the monitoring policy.",
			]
			required: false
		}
		remove_ports: {
			description: [
				"Ports to remove from the monitoring policy.",
			]
			required: false
		}
		remove_processes: {
			description: [
				"Processes to remove from the monitoring policy.",
			]
			required: false
		}
		remove_servers: {
			description: [
				"Servers to remove from the monitoring policy.",
			]
			required: false
		}
		update_ports: {
			description: [
				"Ports to be updated on the monitoring policy.",
			]
			required: false
		}
		update_processes: {
			description: [
				"Processes to be updated on the monitoring policy.",
			]
			required: false
		}
		wait: {
			description: [
				"wait for the instance to be in state 'running' before returning",
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
		wait_interval: {
			description: [
				"Defines the number of seconds to wait when using the _wait_for methods",
			]
			default: 5
		}
	}

	requirements: [
		"1and1",
		"python >= 2.6",
	]

	author: [
		"Amel Ajdinovic (@aajdinov)",
		"Ethan Devenport (@edevenport)",
	]
}
