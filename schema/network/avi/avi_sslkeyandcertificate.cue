package ansible

module: avi_sslkeyandcertificate: {
	module: "avi_sslkeyandcertificate"
	author: "Gaurav Rastogi (@grastogi23) <grastogi@avinetworks.com>"

	short_description: "Module for setup of SSLKeyAndCertificate Avi RESTful Object"
	description: [
		"This module is used to configure SSLKeyAndCertificate object",
		"more examples at U(https://github.com/avinetworks/devops)",
	]
	requirements: ["avisdk"]
	version_added: "2.3"
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
		ca_certs: description: [
			"Ca certificates in certificate chain.",
		]
		certificate: {
			description: [
				"Sslcertificate settings for sslkeyandcertificate.",
			]
			required: true
		}
		certificate_base64: {
			description: [
				"States if the certificate is base64 encoded.",
				"Field introduced in 18.1.2, 18.2.1.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			version_added: "2.9"
			type:          "bool"
		}
		certificate_management_profile_ref: description: [
			"It is a reference to an object of type certificatemanagementprofile.",
		]
		created_by: description: [
			"Creator name.",
		]
		dynamic_params: description: [
			"Dynamic parameters needed for certificate management profile.",
		]
		enckey_base64: description: [
			"Encrypted private key corresponding to the private key (e.g.",
			"Those generated by an hsm such as thales nshield).",
		]
		enckey_name: description: [
			"Name of the encrypted private key (e.g.",
			"Those generated by an hsm such as thales nshield).",
		]
		format: {
			description: [
				"Format of the key/certificate file.",
				"Enum options - SSL_PEM, SSL_PKCS12.",
				"Field introduced in 18.1.2, 18.2.1.",
				"Default value when not specified in API or module is interpreted by Avi Controller as SSL_PEM.",
			]
			version_added: "2.9"
		}
		hardwaresecuritymodulegroup_ref: description: [
			"It is a reference to an object of type hardwaresecuritymodulegroup.",
		]
		key: description: [
			"Private key.",
		]
		key_base64: {
			description: [
				"States if the private key is base64 encoded.",
				"Field introduced in 18.1.2, 18.2.1.",
				"Default value when not specified in API or module is interpreted by Avi Controller as False.",
			]
			version_added: "2.9"
			type:          "bool"
		}
		key_params: description: [
			"Sslkeyparams settings for sslkeyandcertificate.",
		]
		key_passphrase: {
			description: [
				"Passphrase used to encrypt the private key.",
				"Field introduced in 18.1.2, 18.2.1.",
			]
			version_added: "2.9"
		}
		name: {
			description: [
				"Name of the object.",
			]
			required: true
		}
		status: description: [
			"Enum options - ssl_certificate_finished, ssl_certificate_pending.",
			"Default value when not specified in API or module is interpreted by Avi Controller as SSL_CERTIFICATE_FINISHED.",
		]
		tenant_ref: description: [
			"It is a reference to an object of type tenant.",
		]
		type: description: [
			"Enum options - ssl_certificate_type_virtualservice, ssl_certificate_type_system, ssl_certificate_type_ca.",
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