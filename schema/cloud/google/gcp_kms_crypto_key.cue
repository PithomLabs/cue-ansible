package ansible

module: gcp_kms_crypto_key: {
	module: "gcp_kms_crypto_key"
	description: [
		"A `CryptoKey` represents a logical key that can be used for cryptographic operations.",
	]
	short_description: "Creates a GCP CryptoKey"
	version_added:     "2.9"
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
				"The resource name for the CryptoKey.",
			]
			required: true
			type:     "str"
		}
		labels: {
			description: [
				"Labels with user-defined metadata to apply to this resource.",
			]
			required: false
			type:     "dict"
		}
		purpose: {
			description: [
				"Immutable purpose of CryptoKey. See U(https://cloud.google.com/kms/docs/reference/rest/v1/projects.locations.keyRings.cryptoKeys#CryptoKeyPurpose) for inputs.",
				"Some valid choices include: \"ENCRYPT_DECRYPT\", \"ASYMMETRIC_SIGN\", \"ASYMMETRIC_DECRYPT\"",
			]
			required: false
			default:  "ENCRYPT_DECRYPT"
			type:     "str"
		}
		rotation_period: {
			description: [
				"Every time this period passes, generate a new CryptoKeyVersion and set it as the primary.",
				"The first rotation will take place after the specified period. The rotation period has the format of a decimal number with up to 9 fractional digits, followed by the letter `s` (seconds). It must be greater than a day (ie, 86400).",
			]

			required: false
			type:     "str"
		}
		version_template: {
			description: [
				"A template describing settings for new crypto key versions.",
			]
			required: false
			type:     "dict"
			suboptions: {
				algorithm: {
					description: [
						"The algorithm to use when creating a version based on this template.",
						"See the [algorithm reference](U(https://cloud.google.com/kms/docs/reference/rest/v1/CryptoKeyVersionAlgorithm)) for possible inputs.",
					]

					required: true
					type:     "str"
				}
				protection_level: {
					description: [
						"The protection level to use when creating a version based on this template.",
						"Some valid choices include: \"SOFTWARE\", \"HSM\"",
					]
					required: false
					type:     "str"
				}
			}
		}
		key_ring: {
			description: [
				"The KeyRing that this key belongs to.",
				"Format: `'projects/{{project}}/locations/{{location}}/keyRings/{{keyRing}}'`.",
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
		"API Reference: U(https://cloud.google.com/kms/docs/reference/rest/v1/projects.locations.keyRings.cryptoKeys)",
		"Creating a key: U(https://cloud.google.com/kms/docs/creating-keys#create_a_key)",
		"for authentication, you can set service_account_file using the C(gcp_service_account_file) env variable.",
		"for authentication, you can set service_account_contents using the C(GCP_SERVICE_ACCOUNT_CONTENTS) env variable.",
		"For authentication, you can set service_account_email using the C(GCP_SERVICE_ACCOUNT_EMAIL) env variable.",
		"For authentication, you can set auth_kind using the C(GCP_AUTH_KIND) env variable.",
		"For authentication, you can set scopes using the C(GCP_SCOPES) env variable.",
		"Environment variables values will only be used if the playbook values are not set.",
		"The I(service_account_email) and I(service_account_file) options are mutually exclusive.",
	]
}
