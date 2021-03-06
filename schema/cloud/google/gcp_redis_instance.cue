package ansible

module: gcp_redis_instance: {
	module: "gcp_redis_instance"
	description: [
		"A Google Cloud Redis instance.",
	]
	short_description: "Creates a GCP Instance"
	version_added:     "2.8"
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
		alternative_location_id: {
			description: [
				"Only applicable to STANDARD_HA tier which protects the instance against zonal failures by provisioning it across two zones.",
				"If provided, it must be a different zone from the one provided in [locationId].",
			]
			required: false
			type:     "str"
		}
		authorized_network: {
			description: [
				"The full name of the Google Compute Engine network to which the instance is connected. If left unspecified, the default network will be used.",
			]

			required: false
			type:     "str"
		}
		display_name: {
			description: [
				"An arbitrary and optional user-provided name for the instance.",
			]
			required: false
			type:     "str"
		}
		labels: {
			description: [
				"Resource labels to represent user provided metadata.",
			]
			required: false
			type:     "dict"
		}
		redis_configs: {
			description: [
				"Redis configuration parameters, according to U(http://redis.io/topics/config).",
				"Please check Memorystore documentation for the list of supported parameters: U(https://cloud.google.com/memorystore/docs/redis/reference/rest/v1/projects.locations.instances#Instance.FIELDS.redis_configs) .",
			]

			required: false
			type:     "dict"
		}
		location_id: {
			description: [
				"The zone where the instance will be provisioned. If not provided, the service will choose a zone for the instance. For STANDARD_HA tier, instances will be created across two zones for protection against zonal failures. If [alternativeLocationId] is also provided, it must be different from [locationId].",
			]

			required: false
			type:     "str"
		}
		name: {
			description: [
				"The ID of the instance or a fully qualified identifier for the instance. .",
			]
			required: true
			type:     "str"
		}
		memory_size_gb: {
			description: [
				"Redis memory size in GiB.",
			]
			required: true
			type:     "int"
		}
		redis_version: {
			description: [
				"The version of Redis software. If not provided, latest supported version will be used. Currently, the supported values are: - REDIS_4_0 for Redis 4.0 compatibility - REDIS_3_2 for Redis 3.2 compatibility .",
			]

			required: false
			type:     "str"
		}
		reserved_ip_range: {
			description: [
				"The CIDR range of internal addresses that are reserved for this instance. If not provided, the service will choose an unused /29 block, for example, 10.0.0.0/29 or 192.168.0.0/29. Ranges must be unique and non-overlapping with existing subnets in an authorized network.",
			]

			required: false
			type:     "str"
		}
		tier: {
			description: [
				"The service tier of the instance. Must be one of these values: - BASIC: standalone instance - STANDARD_HA: highly available primary/replica instances .",
				"Some valid choices include: \"BASIC\", \"STANDARD_HA\"",
			]
			required: false
			default:  "BASIC"
			type:     "str"
		}
		region: {
			description: [
				"The name of the Redis region of the instance.",
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
		"API Reference: U(https://cloud.google.com/memorystore/docs/redis/reference/rest/)",
		"Official Documentation: U(https://cloud.google.com/memorystore/docs/redis/)",
		"for authentication, you can set service_account_file using the C(gcp_service_account_file) env variable.",
		"for authentication, you can set service_account_contents using the C(GCP_SERVICE_ACCOUNT_CONTENTS) env variable.",
		"For authentication, you can set service_account_email using the C(GCP_SERVICE_ACCOUNT_EMAIL) env variable.",
		"For authentication, you can set auth_kind using the C(GCP_AUTH_KIND) env variable.",
		"For authentication, you can set scopes using the C(GCP_SCOPES) env variable.",
		"Environment variables values will only be used if the playbook values are not set.",
		"The I(service_account_email) and I(service_account_file) options are mutually exclusive.",
	]
}
