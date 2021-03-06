package ansible

module: get_certificate: {
	module:            "get_certificate"
	author:            "John Westcott IV (@john-westcott-iv)"
	version_added:     "2.8"
	short_description: "Get a certificate from a host:port"
	description: [
		"Makes a secure connection and returns information about the presented certificate",
		"The module can use the cryptography Python library, or the pyOpenSSL Python library. By default, it tries to detect which one is available. This can be overridden with the I(select_crypto_backend) option. Please note that the PyOpenSSL backend was deprecated in Ansible 2.9 and will be removed in Ansible 2.13.\"",
	]

	options: {
		host: {
			description: [
				"The host to get the cert for (IP is fine)",
			]
			type:     "str"
			required: true
		}
		ca_cert: {
			description: [
				"A PEM file containing one or more root certificates; if present, the cert will be validated against these root certs.",
				"Note that this only validates the certificate is signed by the chain; not that the cert is valid for the host presenting it.",
			]
			type: "path"
		}
		port: {
			description: [
				"The port to connect to",
			]
			type:     "int"
			required: true
		}
		proxy_host: {
			description: [
				"Proxy host used when get a certificate.",
			]
			type:          "str"
			version_added: 2.9
		}
		proxy_port: {
			description: [
				"Proxy port used when get a certificate.",
			]
			type:          "int"
			default:       8080
			version_added: 2.9
		}
		timeout: {
			description: [
				"The timeout in seconds",
			]
			type:    "int"
			default: 10
		}
		select_crypto_backend: {
			description: [
				"Determines which crypto backend to use.",
				"The default choice is C(auto), which tries to use C(cryptography) if available, and falls back to C(pyopenssl).",
				"If set to C(pyopenssl), will try to use the L(pyOpenSSL,https://pypi.org/project/pyOpenSSL/) library.",
				"If set to C(cryptography), will try to use the L(cryptography,https://cryptography.io/) library.",
			]
			type:    "str"
			default: "auto"
			choices: ["auto", "cryptography", "pyopenssl"]
			version_added: "2.9"
		}
	}

	notes: [
		"When using ca_cert on OS X it has been reported that in some conditions the validate will always succeed.",
	]

	requirements: [
		"python >= 2.7 when using C(proxy_host)",
		"cryptography >= 1.6 or pyOpenSSL >= 0.15",
	]
}
