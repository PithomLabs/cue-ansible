package ansible

module: bigip_ssl_certificate: {
	module:            "bigip_ssl_certificate"
	short_description: "Import/Delete certificates from BIG-IP"
	description: [
		"This module will import/delete SSL certificates on BIG-IP LTM. Certificates can be imported from certificate and key files on the local disk, in PEM format.",
	]

	version_added: 2.2
	options: {
		content: {
			description: [
				"Sets the contents of a certificate directly to the specified value. This is used with lookup plugins or for anything with formatting or",
				"C(content) must be provided when C(state) is C(present).",
			]
			type: "str"
			aliases: ["cert_content"]
		}
		state: {
			description: [
				"Certificate state. This determines if the provided certificate and key is to be made C(present) on the device or C(absent).",
			]

			type: "str"
			choices: [
				"present",
				"absent",
			]
			default: "present"
		}
		name: {
			description: [
				"SSL Certificate Name. This is the cert name used when importing a certificate into the F5. It also determines the filenames of the objects on the LTM.",
			]

			type:     "str"
			required: true
		}
		issuer_cert: {
			description: [
				"Issuer certificate used for OCSP monitoring.",
				"This parameter is only valid on versions of BIG-IP 13.0.0 or above.",
			]
			type:          "str"
			version_added: 2.5
		}
		partition: {
			description: [
				"Device partition to manage resources on.",
			]
			type:          "str"
			default:       "Common"
			version_added: 2.5
		}
	}
	notes: [
		"This module does not behave like other modules that you might include in roles where referencing files or templates first looks in the role's files or templates directory. To have it behave that way, use the Ansible file or template lookup (see Examples). The lookups behave as expected in a role context.",
	]

	extends_documentation_fragment: "f5"
	requirements: [
		"BIG-IP >= v12",
	]
	author: [
		"Tim Rupp (@caphrim007)",
		"Wojciech Wypior (@wojtek0806)",
	]
}
