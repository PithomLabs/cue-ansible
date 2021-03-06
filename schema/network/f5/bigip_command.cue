package ansible

module: bigip_command: {
	module:            "bigip_command"
	short_description: "Run TMSH and BASH commands on F5 devices"
	description: [
		"Sends a TMSH or BASH command to an BIG-IP node and returns the results read from the device. This module includes an argument that will cause the module to wait for a specific condition before returning or timing out if the condition is not met.",
		"This module is B(not) idempotent, nor will it ever be. It is intended as a stop-gap measure to satisfy automation requirements until such a time as a real module has been developed to configure in the way you need.",
		"If you are using this module, you should probably also be filing an issue to have a B(real) module created for your needs.",
	]

	version_added: 2.4
	options: {
		commands: {
			description: [
				"The commands to send to the remote BIG-IP device over the configured provider. The resulting output from the command is returned. If the I(wait_for) argument is provided, the module is not returned until the condition is satisfied or the number of retries as expired.",
				"Only C(tmsh) commands are supported. If you are piping or adding additional logic that is outside of C(tmsh) (such as grep'ing, awk'ing or other shell related things that are not C(tmsh), this behavior is not supported.",
			]

			required: true
			type:     "raw"
		}
		wait_for: {
			description: [
				"Specifies what to evaluate from the output of the command and what conditionals to apply.  This argument will cause the task to wait for a particular conditional to be true before moving forward. If the conditional is not true by the configured retries, the task fails. See examples.",
			]

			type: "list"
			aliases: ["waitfor"]
		}
		match: {
			description: [
				"The I(match) argument is used in conjunction with the I(wait_for) argument to specify the match policy. Valid values are C(all) or C(any). If the value is set to C(all) then all conditionals in the I(wait_for) must be satisfied. If the value is set to C(any) then only one of the values must be satisfied.",
			]

			type: "str"
			choices: [
				"any",
				"all",
			]
			default: "all"
		}
		retries: {
			description: [
				"Specifies the number of retries a command should by tried before it is considered failed. The command is run on the target device every retry and evaluated against the I(wait_for) conditionals.",
			]

			type:    "int"
			default: 10
		}
		interval: {
			description: [
				"Configures the interval in seconds to wait between retries of the command. If the command does not pass the specified conditional, the interval indicates how to long to wait before trying the command again.",
			]

			type:    "int"
			default: 1
		}
		transport: {
			description: [
				"Configures the transport connection to use when connecting to the remote device. The transport argument supports connectivity to the device over cli (ssh) or rest.",
			]

			required: true
			choices: [
				"rest",
				"cli",
			]
			default:       "rest"
			version_added: 2.5
		}
		warn: {
			description: [
				"Whether the module should raise warnings related to command idempotency or not.",
				"Note that the F5 Ansible developers specifically leave this on to make you aware that your usage of this module may be better served by official F5 Ansible modules. This module should always be used as a last resort.",
			]

			default:       true
			type:          "bool"
			version_added: 2.6
		}
		chdir: {
			description: [
				"Change into this directory before running the command.",
			]
			type:          "str"
			version_added: 2.6
		}
	}
	extends_documentation_fragment: "f5"
	author: [
		"Tim Rupp (@caphrim007)",
		"Wojciech Wypior (@wojtek0806)",
	]
}
