package ansible

module: gcp_compute_region_backend_service: {
	module: "gcp_compute_region_backend_service"
	description: [
		"A Region Backend Service defines a regionally-scoped group of virtual machines that will serve traffic for load balancing.",
	]

	short_description: "Creates a GCP RegionBackendService"
	version_added:     "2.10"
	author:            "Google Inc. (@googlecloudplatform)"
	requirements: [
		"python >= 2.6",
		"requests >= 2.18.4",
		"google-auth >= 1.3.0",
	]
	options: {
		state: {
			description: [
				"Whether the given object should exist in GCP",
			]
			choices: [
				"present",
				"absent",
			]
			default: "present"
			type:    "str"
		}
		backends: {
			description: [
				"The set of backends that serve this RegionBackendService.",
			]
			required: false
			type:     "list"
			suboptions: {
				balancing_mode: {
					description: [
						"Specifies the balancing mode for this backend. Defaults to CONNECTION.",
						"Some valid choices include: \"UTILIZATION\", \"RATE\", \"CONNECTION\"",
					]
					required: false
					default:  "CONNECTION"
					type:     "str"
				}
				capacity_scaler: {
					description: [
						"A multiplier applied to the group's maximum servicing capacity (based on UTILIZATION, RATE or CONNECTION).",
						"A setting of 0 means the group is completely drained, offering 0% of its available Capacity. Valid range is [0.0,1.0].",
					]

					required: false
					type:     "str"
				}
				description: {
					description: [
						"An optional description of this resource.",
						"Provide this property when you create the resource.",
					]
					required: false
					type:     "str"
				}
				group: {
					description: [
						"The fully-qualified URL of an Instance Group or Network Endpoint Group resource. In case of instance group this defines the list of instances that serve traffic. Member virtual machine instances from each instance group must live in the same zone as the instance group itself. No two backends in a backend service are allowed to use same Instance Group resource.",
						"For Network Endpoint Groups this defines list of endpoints. All endpoints of Network Endpoint Group must be hosted on instances located in the same zone as the Network Endpoint Group.",
						"Backend services cannot mix Instance Group and Network Endpoint Group backends.",
						"When the `load_balancing_scheme` is INTERNAL, only instance groups are supported.",
						"Note that you must specify an Instance Group or Network Endpoint Group resource using the fully-qualified URL, rather than a partial URL.",
					]

					required: true
					type:     "str"
				}
				max_connections: {
					description: [
						"The max number of simultaneous connections for the group. Can be used with either CONNECTION or UTILIZATION balancing modes.",
						"For CONNECTION mode, either maxConnections or one of maxConnectionsPerInstance or maxConnectionsPerEndpoint, as appropriate for group type, must be set.",
					]

					required: false
					type:     "int"
				}
				max_connections_per_instance: {
					description: [
						"The max number of simultaneous connections that a single backend instance can handle. This is used to calculate the capacity of the group. Can be used in either CONNECTION or UTILIZATION balancing modes.",
						"For CONNECTION mode, either maxConnections or maxConnectionsPerInstance must be set.",
					]

					required: false
					type:     "int"
				}
				max_connections_per_endpoint: {
					description: [
						"The max number of simultaneous connections that a single backend network endpoint can handle. This is used to calculate the capacity of the group. Can be used in either CONNECTION or UTILIZATION balancing modes.",
						"For CONNECTION mode, either maxConnections or maxConnectionsPerEndpoint must be set.",
					]

					required: false
					type:     "int"
				}
				max_rate: {
					description: [
						"The max requests per second (RPS) of the group.",
						"Can be used with either RATE or UTILIZATION balancing modes, but required if RATE mode. Either maxRate or one of maxRatePerInstance or maxRatePerEndpoint, as appropriate for group type, must be set.",
					]

					required: false
					type:     "int"
				}
				max_rate_per_instance: {
					description: [
						"The max requests per second (RPS) that a single backend instance can handle. This is used to calculate the capacity of the group. Can be used in either balancing mode. For RATE mode, either maxRate or maxRatePerInstance must be set.",
					]

					required: false
					type:     "str"
				}
				max_rate_per_endpoint: {
					description: [
						"The max requests per second (RPS) that a single backend network endpoint can handle. This is used to calculate the capacity of the group. Can be used in either balancing mode. For RATE mode, either maxRate or maxRatePerEndpoint must be set.",
					]

					required: false
					type:     "str"
				}
				max_utilization: {
					description: [
						"Used when balancingMode is UTILIZATION. This ratio defines the CPU utilization target for the group. Valid range is [0.0, 1.0].",
					]

					required: false
					type:     "str"
				}
			}
		}
		connection_draining: {
			description: [
				"Settings for connection draining .",
			]
			required: false
			type:     "dict"
			suboptions: draining_timeout_sec: {
				description: [
					"Time for which instance will be drained (not accept new connections, but still work to finish started).",
				]

				required: false
				default:  "300"
				type:     "int"
			}
		}
		description: {
			description: [
				"An optional description of this resource.",
			]
			required: false
			type:     "str"
		}
		health_checks: {
			description: [
				"The set of URLs to HealthCheck resources for health checking this RegionBackendService. Currently at most one health check can be specified, and a health check is required.",
			]

			required: true
			type:     "list"
		}
		load_balancing_scheme: {
			description: [
				"Indicates what kind of load balancing this regional backend service will be used for. A backend service created for one type of load balancing cannot be used with the other(s). Must be `INTERNAL` or `INTERNAL_MANAGED`. Defaults to `INTERNAL`.",
				"Some valid choices include: \"INTERNAL\", \"INTERNAL_MANAGED\"",
			]
			required: false
			default:  "INTERNAL"
			type:     "str"
		}
		name: {
			description: [
				"Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.",
			]

			required: true
			type:     "str"
		}
		protocol: {
			description: [
				"The protocol this RegionBackendService uses to communicate with backends.",
				"Possible values are HTTP, HTTPS, HTTP2, SSL, TCP, and UDP. The default is HTTP. **NOTE**: HTTP2 is only valid for beta HTTP/2 load balancer types and may result in errors if used with the GA API.",
				"Some valid choices include: \"HTTP\", \"HTTPS\", \"HTTP2\", \"SSL\", \"TCP\", \"UDP\"",
			]
			required: false
			type:     "str"
		}
		session_affinity: {
			description: [
				"Type of session affinity to use. The default is NONE. Session affinity is not applicable if the protocol is UDP.",
				"Some valid choices include: \"NONE\", \"CLIENT_IP\", \"CLIENT_IP_PORT_PROTO\", \"CLIENT_IP_PROTO\", \"GENERATED_COOKIE\", \"HEADER_FIELD\", \"HTTP_COOKIE\"",
			]

			required: false
			type:     "str"
		}
		timeout_sec: {
			description: [
				"How many seconds to wait for the backend before considering it a failed request. Default is 30 seconds. Valid range is [1, 86400].",
			]

			required: false
			type:     "int"
		}
		region: {
			description: [
				"A reference to the region where the regional backend service resides.",
			]
			required: true
			type:     "str"
		}
		project: {
			description: [
				"The Google Cloud Platform project to use.",
			]
			type: "str"
		}
		auth_kind: {
			description: [
				"The type of credential used.",
			]
			type:     "str"
			required: true
			choices: [
				"application",
				"machineaccount",
				"serviceaccount",
			]
		}
		service_account_contents: {
			description: [
				"The contents of a Service Account JSON file, either in a dictionary or as a JSON string that represents it.",
			]

			type: "jsonarg"
		}
		service_account_file: {
			description: [
				"The path of a Service Account JSON file if serviceaccount is selected as type.",
			]
			type: "path"
		}
		service_account_email: {
			description: [
				"An optional service account email address if machineaccount is selected and the user does not wish to use the default email.",
			]

			type: "str"
		}
		scopes: {
			description: [
				"Array of scopes to be used",
			]
			type: "list"
		}
		env_type: {
			description: [
				"Specifies which Ansible environment you're running this module within.",
				"This should not be set unless you know what you're doing.",
				"This only alters the User Agent string for any API requests.",
			]
			type: "str"
		}
	}
	notes: [
		"API Reference: U(https://cloud.google.com/compute/docs/reference/latest/regionBackendServices)",
		"Internal TCP/UDP Load Balancing: U(https://cloud.google.com/compute/docs/load-balancing/internal/)",
		"for authentication, you can set service_account_file using the C(gcp_service_account_file) env variable.",
		"for authentication, you can set service_account_contents using the C(GCP_SERVICE_ACCOUNT_CONTENTS) env variable.",
		"For authentication, you can set service_account_email using the C(GCP_SERVICE_ACCOUNT_EMAIL) env variable.",
		"For authentication, you can set auth_kind using the C(GCP_AUTH_KIND) env variable.",
		"For authentication, you can set scopes using the C(GCP_SCOPES) env variable.",
		"Environment variables values will only be used if the playbook values are not set.",
		"The I(service_account_email) and I(service_account_file) options are mutually exclusive.",
	]
}
