package ansible

module: nxos_aaa_server_host: {
	module:                         "nxos_aaa_server_host"
	extends_documentation_fragment: "nxos"
	version_added:                  "2.2"
	short_description:              "Manages AAA server host-specific configuration."
	description: [
		"Manages AAA server host-specific configuration.",
	]
	author: "Jason Edelman (@jedelman8)"
	notes: [
		"Tested against NXOSv 7.3.(0)D1(1) on VIRL",
		"Changes to the host key (shared secret) are not idempotent for type 0.",
		"If C(state=absent) removes the whole host configuration.",
	]
	options: {
		server_type: {
			description: [
				"The server type is either radius or tacacs.",
			]
			required: true
			choices: ["radius", "tacacs"]
		}
		address: {
			description: [
				"Address or name of the radius or tacacs host.",
			]
			required: true
		}
		key: description: [
			"Shared secret for the specified host or keyword 'default'.",
		]
		encrypt_type: {
			description: [
				"The state of encryption applied to the entered key. O for clear text, 7 for encrypted. Type-6 encryption is not supported.",
			]

			choices: ["0", "7"]
		}
		host_timeout: description: [
			"Timeout period for specified host, in seconds or keyword 'default. Range is 1-60.",
		]

		auth_port: description: [
			"Alternate UDP port for RADIUS authentication or keyword 'default'.",
		]
		acct_port: description: [
			"Alternate UDP port for RADIUS accounting or keyword 'default'.",
		]
		tacacs_port: description: [
			"Alternate TCP port TACACS Server or keyword 'default'.",
		]
		state: {
			description: [
				"Manage the state of the resource.",
			]
			default: "present"
			choices: ["present", "absent"]
		}
	}
}
