package ansible

module: vdirect_commit: {
	module:            "vdirect_commit"
	author:            "Evgeny Fedoruk @ Radware LTD (@evgenyfedoruk)"
	short_description: "Commits pending configuration changes on Radware devices"
	description: [
		"Commits pending configuration changes on one or more Radware devices via vDirect server.",
		"For Alteon ADC device, apply, sync and save actions will be performed by default. Skipping of an action is possible by explicit parameter specifying.",
		"For Alteon VX Container device, no sync operation will be performed since sync action is only relevant for Alteon ADC devices.",
		"For DefensePro and AppWall devices, a bulk commit action will be performed. Explicit apply, sync and save actions specifying is not relevant.",
	]

	notes: [
		"Requires the Radware vdirect-client Python package on the host. This is as easy as C(pip install vdirect-client)",
	]

	version_added: "2.5"
	options: {
		vdirect_ip: {
			description: [
				"Primary vDirect server IP address, may be set as C(VDIRECT_IP) environment variable.",
			]
			required: true
		}
		vdirect_user: {
			description: [
				"vDirect server username, may be set as C(VDIRECT_USER) environment variable.",
			]
			required: true
		}
		vdirect_password: {
			description: [
				"vDirect server password, may be set as C(VDIRECT_PASSWORD) environment variable.",
			]
			required: true
		}
		vdirect_secondary_ip: description: [
			"Secondary vDirect server IP address, may be set as C(VDIRECT_SECONDARY_IP) environment variable.",
		]
		vdirect_wait: {
			description: [
				"Wait for async operation to complete, may be set as C(VDIRECT_WAIT) environment variable.",
			]
			type:    "bool"
			default: "yes"
		}
		vdirect_https_port: {
			description: [
				"vDirect server HTTPS port number, may be set as C(VDIRECT_HTTPS_PORT) environment variable.",
			]
			default: 2189
		}
		vdirect_http_port: {
			description: [
				"vDirect server HTTP port number, may be set as C(VDIRECT_HTTP_PORT) environment variable.",
			]
			default: 2188
		}
		vdirect_timeout: {
			description: [
				"Amount of time to wait for async operation completion [seconds],",
				"may be set as C(VDIRECT_TIMEOUT) environment variable.",
			]
			default: 60
		}
		vdirect_use_ssl: {
			description: [
				"If C(no), an HTTP connection will be used instead of the default HTTPS connection,",
				"may be set as C(VDIRECT_HTTPS) or C(VDIRECT_USE_SSL) environment variable.",
			]
			type:    "bool"
			default: "yes"
		}
		validate_certs: {
			description: [
				"If C(no), SSL certificates will not be validated,",
				"may be set as C(VDIRECT_VALIDATE_CERTS) or C(VDIRECT_VERIFY) environment variable.",
				"This should only set to C(no) used on personally controlled sites using self-signed certificates.",
			]
			type:    "bool"
			default: "yes"
			aliases: ["vdirect_validate_certs"]
		}
		devices: {
			description: [
				"List of Radware Alteon device names for commit operations.",
			]
			required: true
		}
		apply: {
			description: [
				"If C(no), apply action will not be performed. Relevant for ADC devices only.",
			]
			type:    "bool"
			default: "yes"
		}
		save: {
			description: [
				"If C(no), save action will not be performed. Relevant for ADC devices only.",
			]
			type:    "bool"
			default: "yes"
		}
		sync: {
			description: [
				"If C(no), sync action will not be performed. Relevant for ADC devices only.",
			]
			type:    "bool"
			default: "yes"
		}
	}

	requirements: ["vdirect-client >= 4.9.0-post4"]
}
