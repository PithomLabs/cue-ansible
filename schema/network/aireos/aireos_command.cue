package ansible

module: aireos_command: {
	module:            "aireos_command"
	version_added:     "2.4"
	author:            "James Mighion (@jmighion)"
	short_description: "Run commands on remote devices running Cisco WLC"
	description: [
		"Sends arbitrary commands to an aireos node and returns the results read from the device. This module includes an argument that will cause the module to wait for a specific condition before returning or timing out if the condition is not met.",
		"Commands run in configuration mode with this module are not idempotent. Please use M(aireos_config) to configure WLC devices.",
	]

	extends_documentation_fragment: "aireos"
	options: {
		commands: {
			description: [
				"List of commands to send to the remote aireos device over the configured provider. The resulting output from the command is returned. If the I(wait_for) argument is provided, the module is not returned until the condition is satisfied or the number of retries has expired.",
			]

			required: true
		}
		wait_for: {
			description: [
				"List of conditions to evaluate against the output of the command. The task will wait for each condition to be true before moving forward. If the conditional is not true within the configured number of retries, the task fails. See examples.",
			]

			aliases: ["waitfor"]
		}
		match: {
			description: [
				"The I(match) argument is used in conjunction with the I(wait_for) argument to specify the match policy.  Valid values are C(all) or C(any).  If the value is set to C(all) then all conditionals in the wait_for must be satisfied.  If the value is set to C(any) then only one of the values must be satisfied.",
			]

			default: "all"
			choices: ["any", "all"]
		}
		retries: {
			description: [
				"Specifies the number of retries a command should by tried before it is considered failed. The command is run on the target device every retry and evaluated against the I(wait_for) conditions.",
			]

			default: 10
		}
		interval: {
			description: [
				"Configures the interval in seconds to wait between retries of the command. If the command does not pass the specified conditions, the interval indicates how long to wait before trying the command again.",
			]

			default: 1
		}
	}
}
