package ansible

module: cnos_interface: {
	module:            "cnos_interface"
	version_added:     "2.3"
	author:            "Anil Kumar Muraleedharan(@amuraleedhar)"
	short_description: "Manage Interface on Lenovo CNOS network devices"
	description: [
		"This module provides declarative management of Interfaces on Lenovo CNOS network devices.",
	]

	notes: [
		"Tested against CNOS 10.8.1",
	]
	options: {
		name: {
			description: [
				"Name of the Interface.",
			]
			required:      true
			version_added: "2.8"
		}
		description: {
			description: [
				"Description of Interface.",
			]
			version_added: "2.8"
		}
		enabled: {
			description: [
				"Interface link status.",
			]
			type:          "bool"
			default:       true
			version_added: "2.8"
		}
		speed: {
			description: [
				"Interface link speed.",
			]
			version_added: "2.8"
		}
		mtu: {
			description: [
				"Maximum size of transmit packet.",
			]
			version_added: "2.8"
		}
		duplex: {
			description: [
				"Interface link status",
			]
			default: "auto"
			choices: ["full", "half", "auto"]
			version_added: "2.8"
		}
		tx_rate: {
			description: [
				"Transmit rate in bits per second (bps).",
				"This is state check parameter only.",
				"Supports conditionals, see L(Conditionals in Networking Modules, ../network/user_guide/network_working_with_command_output.html)",
			]

			version_added: "2.8"
		}
		rx_rate: {
			description: [
				"Receiver rate in bits per second (bps).",
				"This is state check parameter only.",
				"Supports conditionals, see L(Conditionals in Networking Modules, ../network/user_guide/network_working_with_command_output.html)",
			]

			version_added: "2.8"
		}
		neighbors: {
			description: [
				"Check operational state of given interface C(name) for LLDP neighbor.",
				"The following suboptions are available.",
			]
			version_added: "2.8"
			suboptions: {
				host: description: [
					"LLDP neighbor host for given interface C(name).",
				]
				port: description: [
					"LLDP neighbor port to which interface C(name) is connected.",
				]
			}
		}
		aggregate: {
			description:   "List of Interfaces definitions."
			version_added: "2.8"
		}
		delay: {
			description: [
				"Time in seconds to wait before checking for the operational state on remote device. This wait is applicable for operational state argument which are I(state) with values C(up)/C(down), I(tx_rate) and I(rx_rate)",
			]

			default:       20
			version_added: "2.8"
		}
		state: {
			description: [
				"State of the Interface configuration, C(up) means present and operationally up and C(down) means present and operationally C(down)",
			]

			default:       "present"
			version_added: "2.8"
			choices: ["present", "absent", "up", "down"]
		}
		provider: {
			description: [
				"B(Deprecated)",
				"Starting with Ansible 2.5 we recommend using C(connection: network_cli).",
				"For more information please see the L(CNOS Platform Options guide, ../network/user_guide/platform_cnos.html).",
				"HORIZONTALLINE",
				"A dict object containing connection details.",
			]
			version_added: "2.8"
			suboptions: {
				host: {
					description: [
						"Specifies the DNS host name or address for connecting to the remote device over the specified transport.  The value of host is used as the destination address for the transport.",
					]

					required: true
				}
				port: {
					description: [
						"Specifies the port to use when building the connection to the remote device.",
					]
					default: 22
				}
				username: description: [
					"Configures the username to use to authenticate the connection to the remote device.  This value is used to authenticate the SSH session. If the value is not specified in the task, the value of environment variable C(ANSIBLE_NET_USERNAME) will be used instead.",
				]

				password: description: [
					"Specifies the password to use to authenticate the connection to the remote device.   This value is used to authenticate the SSH session. If the value is not specified in the task, the value of environment variable C(ANSIBLE_NET_PASSWORD) will be used instead.",
				]

				timeout: {
					description: [
						"Specifies the timeout in seconds for communicating with the network device for either connecting or sending commands.  If the timeout is exceeded before the operation is completed, the module will error.",
					]

					default: 10
				}
				ssh_keyfile: description: [
					"Specifies the SSH key to use to authenticate the connection to the remote device.   This value is the path to the key used to authenticate the SSH session. If the value is not specified in the task, the value of environment variable C(ANSIBLE_NET_SSH_KEYFILE) will be used instead.",
				]

				authorize: {
					description: [
						"Instructs the module to enter privileged mode on the remote device before sending any commands.  If not specified, the device will attempt to execute all commands in non-privileged mode. If the value is not specified in the task, the value of environment variable C(ANSIBLE_NET_AUTHORIZE) will be used instead.",
					]

					type:    "bool"
					default: "no"
				}
				auth_pass: description: [
					"Specifies the password to use if required to enter privileged mode on the remote device.  If I(authorize) is false, then this argument does nothing. If the value is not specified in the task, the value of environment variable C(ANSIBLE_NET_AUTH_PASS) will be used instead.",
				]
			}
		}
	}
}
