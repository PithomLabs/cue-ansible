package ansible

module: openssl_csr: {
	module:            "openssl_csr"
	version_added:     "2.4"
	short_description: "Generate OpenSSL Certificate Signing Request (CSR)"
	description: [
		"This module allows one to (re)generate OpenSSL certificate signing requests.",
		"It uses the pyOpenSSL python library to interact with openssl. This module supports the subjectAltName, keyUsage, extendedKeyUsage, basicConstraints and OCSP Must Staple extensions.",
		"Please note that the module regenerates existing CSR if it doesn't match the module's options, or if it seems to be corrupt. If you are concerned that this could overwrite your existing CSR, consider using the I(backup) option.",
		"The module can use the cryptography Python library, or the pyOpenSSL Python library. By default, it tries to detect which one is available. This can be overridden with the I(select_crypto_backend) option. Please note that the PyOpenSSL backend was deprecated in Ansible 2.9 and will be removed in Ansible 2.13.\"",
	]

	requirements: [
		"Either cryptography >= 1.3",
		"Or pyOpenSSL >= 0.15",
	]
	author: [
		"Yanis Guenane (@Spredzy)",
	]
	options: {
		state: {
			description: [
				"Whether the certificate signing request should exist or not, taking action if the state is different from what is stated.",
			]
			type:    "str"
			default: "present"
			choices: ["absent", "present"]
		}
		digest: {
			description: [
				"The digest used when signing the certificate signing request with the private key.",
			]
			type:    "str"
			default: "sha256"
		}
		privatekey_path: {
			description: [
				"The path to the private key to use when signing the certificate signing request.",
			]
			type:     "path"
			required: true
		}
		privatekey_passphrase: {
			description: [
				"The passphrase for the private key.",
				"This is required if the private key is password protected.",
			]
			type: "str"
		}
		version: {
			description: [
				"The version of the certificate signing request.",
				"The only allowed value according to L(RFC 2986,https://tools.ietf.org/html/rfc2986#section-4.1) is 1.",
				"This option will no longer accept unsupported values from Ansible 2.14 on.",
			]
			type:    "int"
			default: 1
		}
		force: {
			description: [
				"Should the certificate signing request be forced regenerated by this ansible module.",
			]
			type:    "bool"
			default: false
		}
		path: {
			description: [
				"The name of the file into which the generated OpenSSL certificate signing request will be written.",
			]
			type:     "path"
			required: true
		}
		subject: {
			description: [
				"Key/value pairs that will be present in the subject name field of the certificate signing request.",
				"If you need to specify more than one value with the same key, use a list as value.",
			]
			type:          "dict"
			version_added: "2.5"
		}
		country_name: {
			description: [
				"The countryName field of the certificate signing request subject.",
			]
			type: "str"
			aliases: ["C", "countryName"]
		}
		state_or_province_name: {
			description: [
				"The stateOrProvinceName field of the certificate signing request subject.",
			]
			type: "str"
			aliases: ["ST", "stateOrProvinceName"]
		}
		locality_name: {
			description: [
				"The localityName field of the certificate signing request subject.",
			]
			type: "str"
			aliases: ["L", "localityName"]
		}
		organization_name: {
			description: [
				"The organizationName field of the certificate signing request subject.",
			]
			type: "str"
			aliases: ["O", "organizationName"]
		}
		organizational_unit_name: {
			description: [
				"The organizationalUnitName field of the certificate signing request subject.",
			]
			type: "str"
			aliases: ["OU", "organizationalUnitName"]
		}
		common_name: {
			description: [
				"The commonName field of the certificate signing request subject.",
			]
			type: "str"
			aliases: ["CN", "commonName"]
		}
		email_address: {
			description: [
				"The emailAddress field of the certificate signing request subject.",
			]
			type: "str"
			aliases: ["E", "emailAddress"]
		}
		subject_alt_name: {
			description: [
				"SAN extension to attach to the certificate signing request.",
				"This can either be a 'comma separated string' or a YAML list.",
				"Values must be prefixed by their options. (i.e., C(email), C(URI), C(DNS), C(RID), C(IP), C(dirName), C(otherName) and the ones specific to your CA)",
				"Note that if no SAN is specified, but a common name, the common name will be added as a SAN except if C(useCommonNameForSAN) is set to I(false).",
				"More at U(https://tools.ietf.org/html/rfc5280#section-4.2.1.6).",
			]
			type:     "list"
			elements: "str"
			aliases: ["subjectAltName"]
		}
		subject_alt_name_critical: {
			description: [
				"Should the subjectAltName extension be considered as critical.",
			]
			type: "bool"
			aliases: ["subjectAltName_critical"]
		}
		use_common_name_for_san: {
			description: [
				"If set to C(yes), the module will fill the common name in for C(subject_alt_name) with C(DNS:) prefix if no SAN is specified.",
			]

			type:          "bool"
			default:       true
			version_added: "2.8"
			aliases: ["useCommonNameForSAN"]
		}
		key_usage: {
			description: [
				"This defines the purpose (e.g. encipherment, signature, certificate signing) of the key contained in the certificate.",
			]

			type:     "list"
			elements: "str"
			aliases: ["keyUsage"]
		}
		key_usage_critical: {
			description: [
				"Should the keyUsage extension be considered as critical.",
			]
			type: "bool"
			aliases: ["keyUsage_critical"]
		}
		extended_key_usage: {
			description: [
				"Additional restrictions (e.g. client authentication, server authentication) on the allowed purposes for which the public key may be used.",
			]

			type:     "list"
			elements: "str"
			aliases: ["extKeyUsage", "extendedKeyUsage"]
		}
		extended_key_usage_critical: {
			description: [
				"Should the extkeyUsage extension be considered as critical.",
			]
			type: "bool"
			aliases: ["extKeyUsage_critical", "extendedKeyUsage_critical"]
		}
		basic_constraints: {
			description: [
				"Indicates basic constraints, such as if the certificate is a CA.",
			]
			type:          "list"
			elements:      "str"
			version_added: "2.5"
			aliases: ["basicConstraints"]
		}
		basic_constraints_critical: {
			description: [
				"Should the basicConstraints extension be considered as critical.",
			]
			type:          "bool"
			version_added: "2.5"
			aliases: ["basicConstraints_critical"]
		}
		ocsp_must_staple: {
			description: [
				"Indicates that the certificate should contain the OCSP Must Staple extension (U(https://tools.ietf.org/html/rfc7633)).",
			]

			type:          "bool"
			version_added: "2.5"
			aliases: ["ocspMustStaple"]
		}
		ocsp_must_staple_critical: {
			description: [
				"Should the OCSP Must Staple extension be considered as critical",
				"Note that according to the RFC, this extension should not be marked as critical, as old clients not knowing about OCSP Must Staple are required to reject such certificates (see U(https://tools.ietf.org/html/rfc7633#section-4)).",
			]

			type:          "bool"
			version_added: "2.5"
			aliases: ["ocspMustStaple_critical"]
		}
		select_crypto_backend: {
			description: [
				"Determines which crypto backend to use.",
				"The default choice is C(auto), which tries to use C(cryptography) if available, and falls back to C(pyopenssl).",
				"If set to C(pyopenssl), will try to use the L(pyOpenSSL,https://pypi.org/project/pyOpenSSL/) library.",
				"If set to C(cryptography), will try to use the L(cryptography,https://cryptography.io/) library.",
				"Please note that the C(pyopenssl) backend has been deprecated in Ansible 2.9, and will be removed in Ansible 2.13. From that point on, only the C(cryptography) backend will be available.",
			]

			type:    "str"
			default: "auto"
			choices: ["auto", "cryptography", "pyopenssl"]
			version_added: "2.8"
		}
		backup: {
			description: [
				"Create a backup file including a timestamp so you can get the original CSR back if you overwrote it with a new one by accident.",
			]

			type:          "bool"
			default:       false
			version_added: "2.8"
		}
		create_subject_key_identifier: {
			description: [
				"Create the Subject Key Identifier from the public key.",
				"Please note that commercial CAs can ignore the value, respectively use a value of their own choice instead. Specifying this option is mostly useful for self-signed certificates or for own CAs.",
				"Note that this is only supported if the C(cryptography) backend is used!",
			]
			type:          "bool"
			default:       false
			version_added: "2.9"
		}
		subject_key_identifier: {
			description: [
				"The subject key identifier as a hex string, where two bytes are separated by colons.",
				"Example: C(00:11:22:33:44:55:66:77:88:99:aa:bb:cc:dd:ee:ff:00:11:22:33)",
				"Please note that commercial CAs ignore this value, respectively use a value of their own choice. Specifying this option is mostly useful for self-signed certificates or for own CAs.",
				"Note that this option can only be used if I(create_subject_key_identifier) is C(no).",
				"Note that this is only supported if the C(cryptography) backend is used!",
			]
			type:          "str"
			version_added: "2.9"
		}
		authority_key_identifier: {
			description: [
				"The authority key identifier as a hex string, where two bytes are separated by colons.",
				"Example: C(00:11:22:33:44:55:66:77:88:99:aa:bb:cc:dd:ee:ff:00:11:22:33)",
				"If specified, I(authority_cert_issuer) must also be specified.",
				"Please note that commercial CAs ignore this value, respectively use a value of their own choice. Specifying this option is mostly useful for self-signed certificates or for own CAs.",
				"Note that this is only supported if the C(cryptography) backend is used!",
				"The C(AuthorityKeyIdentifier) will only be added if at least one of I(authority_key_identifier), I(authority_cert_issuer) and I(authority_cert_serial_number) is specified.",
			]

			type:          "str"
			version_added: "2.9"
		}
		authority_cert_issuer: {
			description: [
				"Names that will be present in the authority cert issuer field of the certificate signing request.",
				"Values must be prefixed by their options. (i.e., C(email), C(URI), C(DNS), C(RID), C(IP), C(dirName), C(otherName) and the ones specific to your CA)",
				"Example: C(DNS:ca.example.org)",
				"If specified, I(authority_key_identifier) must also be specified.",
				"Please note that commercial CAs ignore this value, respectively use a value of their own choice. Specifying this option is mostly useful for self-signed certificates or for own CAs.",
				"Note that this is only supported if the C(cryptography) backend is used!",
				"The C(AuthorityKeyIdentifier) will only be added if at least one of I(authority_key_identifier), I(authority_cert_issuer) and I(authority_cert_serial_number) is specified.",
			]

			type:          "list"
			elements:      "str"
			version_added: "2.9"
		}
		authority_cert_serial_number: {
			description: [
				"The authority cert serial number.",
				"Note that this is only supported if the C(cryptography) backend is used!",
				"Please note that commercial CAs ignore this value, respectively use a value of their own choice. Specifying this option is mostly useful for self-signed certificates or for own CAs.",
				"The C(AuthorityKeyIdentifier) will only be added if at least one of I(authority_key_identifier), I(authority_cert_issuer) and I(authority_cert_serial_number) is specified.",
			]

			type:          "int"
			version_added: "2.9"
		}
	}
	extends_documentation_fragment: [
		"files",
	]
	notes: [
		"If the certificate signing request already exists it will be checked whether subjectAltName, keyUsage, extendedKeyUsage and basicConstraints only contain the requested values, whether OCSP Must Staple is as requested, and if the request was signed by the given private key.",
	]

	seealso: [{
		module: "openssl_certificate"
	}, {
		module: "openssl_dhparam"
	}, {
		module: "openssl_pkcs12"
	}, {
		module: "openssl_privatekey"
	}, {
		module: "openssl_publickey"
	}]
}
