package ansible

module: haproxy: {
	module:            "haproxy"
	version_added:     "1.9"
	short_description: "Enable, disable, and set weights for HAProxy backend servers using socket commands"
	author: [
		"Ravi Bhure (@ravibhure)",
	]
	description: [
		"Enable, disable, drain and set weights for HAProxy backend servers using socket commands.",
	]
	notes: [
		"Enable, disable and drain commands are restricted and can only be issued on sockets configured for level 'admin'. For example, you can add the line 'stats socket /var/run/haproxy.sock level admin' to the general section of haproxy.cfg. See U(http://haproxy.1wt.eu/download/1.5/doc/configuration.txt).",
		"Depends on netcat (nc) being available; you need to install the appropriate package for your operating system before this module can be used.",
	]

	options: {
		backend: {
			description: [
				"Name of the HAProxy backend pool.",
				"If this parameter is unset, it will be auto-detected.",
			]
			type: "str"
		}
		drain: {
			description: [
				"Wait until the server has no active connections or until the timeout determined by wait_interval and wait_retries is reached.",
				"Continue only after the status changes to 'MAINT'.",
				"This overrides the shutdown_sessions option.",
			]
			type:          "bool"
			version_added: "2.4"
		}
		host: {
			description: [
				"Name of the backend host to change.",
			]
			type:     "str"
			required: true
		}
		shutdown_sessions: {
			description: [
				"When disabling a server, immediately terminate all the sessions attached to the specified server.",
				"This can be used to terminate long-running sessions after a server is put into maintenance mode. Overridden by the drain option.",
			]

			type:    "bool"
			default: false
		}
		socket: {
			description: [
				"Path to the HAProxy socket file.",
			]
			type:    "path"
			default: "/var/run/haproxy.sock"
		}
		state: {
			description: [
				"Desired state of the provided backend host.",
				"Note that C(drain) state was added in version 2.4.",
				"It is supported only by HAProxy version 1.5 or later,",
				"When used on versions < 1.5, it will be ignored.",
			]
			type:     "str"
			required: true
			choices: ["disabled", "drain", "enabled"]
		}
		fail_on_not_found: {
			description: [
				"Fail whenever trying to enable/disable a backend host that does not exist",
			]
			type:          "bool"
			default:       false
			version_added: "2.2"
		}
		wait: {
			description: [
				"Wait until the server reports a status of 'UP' when C(state=enabled), status of 'MAINT' when C(state=disabled) or status of 'DRAIN' when C(state=drain)",
			]

			type:          "bool"
			default:       false
			version_added: "2.0"
		}
		wait_interval: {
			description: [
				"Number of seconds to wait between retries.",
			]
			type:          "int"
			default:       5
			version_added: "2.0"
		}
		wait_retries: {
			description: [
				"Number of times to check for status after changing the state.",
			]
			type:          "int"
			default:       25
			version_added: "2.0"
		}
		weight: {
			description: [
				"The value passed in argument.",
				"If the value ends with the `%` sign, then the new weight will be relative to the initially configured weight.",
				"Relative weights are only permitted between 0 and 100% and absolute weights are permitted between 0 and 256.",
			]

			type: "str"
		}
	}
}
