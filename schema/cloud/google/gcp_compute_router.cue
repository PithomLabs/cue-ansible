package ansible

module: gcp_compute_router: {
	module: "gcp_compute_router"
	description: [
		"Represents a Router resource.",
	]
	short_description: "Creates a GCP Router"
	version_added:     "2.7"
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
		name: {
			description: [
				"Name of the resource. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.",
			]

			required: true
			type:     "str"
		}
		description: {
			description: [
				"An optional description of this resource.",
			]
			required: false
			type:     "str"
		}
		network: {
			description: [
				"A reference to the network to which this router belongs.",
				"This field represents a link to a Network resource in GCP. It can be specified in two ways. First, you can place a dictionary with key 'selfLink' and value of your resource's selfLink Alternatively, you can add `register: name-of-resource` to a gcp_compute_network task and then set this network field to \"{{ name-of-resource }}\"",
			]

			required: true
			type:     "dict"
		}
		bgp: {
			description: [
				"BGP information specific to this router.",
			]
			required: false
			type:     "dict"
			suboptions: {
				asn: {
					description: [
						"Local BGP Autonomous System Number (ASN). Must be an RFC6996 private ASN, either 16-bit or 32-bit. The value will be fixed for this router resource. All VPN tunnels that link to this router will have the same local ASN.",
					]

					required: true
					type:     "int"
				}
				advertise_mode: {
					description: [
						"User-specified flag to indicate which mode to use for advertisement.",
						"Valid values of this enum field are: DEFAULT, CUSTOM .",
						"Some valid choices include: \"DEFAULT\", \"CUSTOM\"",
					]
					required: false
					default:  "DEFAULT"
					type:     "str"
				}
				advertised_groups: {
					description: [
						"User-specified list of prefix groups to advertise in custom mode.",
						"This field can only be populated if advertiseMode is CUSTOM and is advertised to all peers of the router. These groups will be advertised in addition to any specified prefixes. Leave this field blank to advertise no custom groups.",
						"This enum field has the one valid value: ALL_SUBNETS .",
					]
					required: false
					type:     "list"
				}
				advertised_ip_ranges: {
					description: [
						"User-specified list of individual IP ranges to advertise in custom mode. This field can only be populated if advertiseMode is CUSTOM and is advertised to all peers of the router. These IP ranges will be advertised in addition to any specified groups.",
						"Leave this field blank to advertise no custom IP ranges.",
					]
					required: false
					type:     "list"
					suboptions: {
						range: {
							description: [
								"The IP range to advertise. The value must be a CIDR-formatted string.",
							]
							required: false
							type:     "str"
						}
						description: {
							description: [
								"User-specified description for the IP range.",
							]
							required: false
							type:     "str"
						}
					}
				}
			}
		}
		region: {
			description: [
				"Region where the router resides.",
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
		"API Reference: U(https://cloud.google.com/compute/docs/reference/rest/v1/routers)",
		"Google Cloud Router: U(https://cloud.google.com/router/docs/)",
		"for authentication, you can set service_account_file using the C(gcp_service_account_file) env variable.",
		"for authentication, you can set service_account_contents using the C(GCP_SERVICE_ACCOUNT_CONTENTS) env variable.",
		"For authentication, you can set service_account_email using the C(GCP_SERVICE_ACCOUNT_EMAIL) env variable.",
		"For authentication, you can set auth_kind using the C(GCP_AUTH_KIND) env variable.",
		"For authentication, you can set scopes using the C(GCP_SCOPES) env variable.",
		"Environment variables values will only be used if the playbook values are not set.",
		"The I(service_account_email) and I(service_account_file) options are mutually exclusive.",
	]
}
