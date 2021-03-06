package ansible

module: bigip_remote_syslog: {
	module:            "bigip_remote_syslog"
	short_description: "Manipulate remote syslog settings on a BIG-IP"
	description: [
		"Manipulate remote syslog settings on a BIG-IP.",
	]
	version_added: 2.5
	options: {
		remote_host: {
			description: [
				"Specifies the IP address, or hostname, for the remote system to which the system sends log messages.",
			]

			type:     "str"
			required: true
		}
		name: {
			description: [
				"Specifies the name of the syslog object.",
				"This option is required when multiple C(remote_host) with the same IP or hostname are present on the device.",
				"If C(name) is not provided C(remote_host) is used by default.",
			]
			type:          "str"
			version_added: 2.8
		}
		remote_port: {
			description: [
				"Specifies the port that the system uses to send messages to the remote logging server.",
				"When creating a remote syslog, if this parameter is not specified, the default value C(514) is used.",
			]

			type: "str"
		}
		local_ip: {
			description: [
				"Specifies the local IP address of the system that is logging. To provide no local IP, specify the value C(none).",
				"When creating a remote syslog, if this parameter is not specified, the default value C(none) is used.",
			]

			type: "str"
		}
		state: {
			description: [
				"When C(present), guarantees that the remote syslog exists with the provided attributes.",
				"When C(absent), removes the remote syslog from the system.",
			]
			type: "str"
			choices: [
				"absent",
				"present",
			]
			default: "present"
		}
	}
	extends_documentation_fragment: "f5"
	author: [
		"Tim Rupp (@caphrim007)",
		"Wojciech Wypior (@wojtek0806)",
	]
}
