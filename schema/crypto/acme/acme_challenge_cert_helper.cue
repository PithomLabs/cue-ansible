package ansible

module: acme_challenge_cert_helper: {
	module:            "acme_challenge_cert_helper"
	author:            "Felix Fontein (@felixfontein)"
	version_added:     "2.7"
	short_description: "Prepare certificates required for ACME challenges such as C(tls-alpn-01)"
	description: [
		"Prepares certificates for ACME challenges such as C(tls-alpn-01).",
		"The raw data is provided by the M(acme_certificate) module, and needs to be converted to a certificate to be used for challenge validation. This module provides a simple way to generate the required certificates.",
		"The C(tls-alpn-01) implementation is based on L(the draft-05 version of the specification,https://tools.ietf.org/html/draft-ietf-acme-tls-alpn-05).",
	]

	seealso: [{
		name:        "Automatic Certificate Management Environment (ACME)"
		description: "The specification of the ACME protocol (RFC 8555)."
		link:        "https://tools.ietf.org/html/rfc8555"
	}, {
		name:        "ACME TLS ALPN Challenge Extension"
		description: "The current draft specification of the C(tls-alpn-01) challenge."
		link:        "https://tools.ietf.org/html/draft-ietf-acme-tls-alpn-05"
	}]
	requirements: [
		"cryptography >= 1.3",
	]
	options: {
		challenge: {
			description: [
				"The challenge type.",
			]
			type:     "str"
			required: true
			choices: [
				"tls-alpn-01",
			]
		}
		challenge_data: {
			description: [
				"The C(challenge_data) entry provided by M(acme_certificate) for the challenge.",
			]
			type:     "dict"
			required: true
		}
		private_key_src: {
			description: [
				"Path to a file containing the private key file to use for this challenge certificate.",
				"Mutually exclusive with C(private_key_content).",
			]
			type: "path"
		}
		private_key_content: {
			description: [
				"Content of the private key to use for this challenge certificate.",
				"Mutually exclusive with C(private_key_src).",
			]
			type: "str"
		}
	}
}
