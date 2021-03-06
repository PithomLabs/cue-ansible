package ansible

module: vmware_host_powerstate: {
	module:            "vmware_host_powerstate"
	short_description: "Manages power states of host systems in vCenter"
	description: [
		"This module can be used to manage power states of host systems in given vCenter infrastructure.",
		"User can set power state to 'power-down-to-standby', 'power-up-from-standby', 'shutdown-host' and 'reboot-host'.",
		"State 'reboot-host', 'shutdown-host' and 'power-down-to-standby' are not supported by all the host systems.",
	]
	version_added: 2.6
	author: [
		"Abhijeet Kasurde (@Akasurde)",
	]
	requirements: [
		"python >= 2.6",
		"PyVmomi",
	]
	options: {
		state: {
			description: [
				"Set the state of the host system.",
			]
			choices: ["power-down-to-standby", "power-up-from-standby", "shutdown-host", "reboot-host"]
			default: "shutdown-host"
			type:    "str"
		}
		esxi_hostname: {
			description: [
				"Name of the host system to work with.",
				"This is required parameter if C(cluster_name) is not specified.",
			]
			type: "str"
		}
		cluster_name: {
			description: [
				"Name of the cluster from which all host systems will be used.",
				"This is required parameter if C(esxi_hostname) is not specified.",
			]
			type: "str"
		}
		force: {
			description: [
				"This parameter specify if the host should be proceeding with user defined powerstate regardless of whether it is in maintenance mode.",
				"If C(state) set to C(reboot-host) and C(force) as C(true), then host system is rebooted regardless of whether it is in maintenance mode.",
				"If C(state) set to C(shutdown-host) and C(force) as C(true), then host system is shutdown regardless of whether it is in maintenance mode.",
				"If C(state) set to C(power-down-to-standby) and C(force) to C(true), then all powered off VMs will evacuated.",
				"Not applicable if C(state) set to C(power-up-from-standby).",
			]
			type:    "bool"
			default: false
		}
		timeout: {
			description: [
				"This parameter defines timeout for C(state) set to C(power-down-to-standby) or C(power-up-from-standby).",
				"Ignored if C(state) set to C(reboot-host) or C(shutdown-host).",
				"This parameter is defined in seconds.",
			]
			default: 600
			type:    "int"
		}
	}
	extends_documentation_fragment: "vmware.documentation"
}
