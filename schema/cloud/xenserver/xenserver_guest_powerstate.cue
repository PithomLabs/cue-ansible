package ansible

module: xenserver_guest_powerstate: {
	module:            "xenserver_guest_powerstate"
	short_description: "Manages power states of virtual machines running on Citrix Hypervisor/XenServer host or pool"
	description: """
		This module can be used to power on, power off, restart or suspend virtual machine and gracefully reboot or shutdown guest OS of virtual machine.

		"""

	version_added: "2.8"
	author: [
		"Bojan Vitnik (@bvitnik) <bvitnik@mainstream.rs>",
	]
	notes: [
		"Minimal supported version of XenServer is 5.6.",
		"Module was tested with XenServer 6.5, 7.1, 7.2, 7.6, Citrix Hypervisor 8.0, XCP-ng 7.6 and 8.0.",
		"To acquire XenAPI Python library, just run C(pip install XenAPI) on your Ansible Control Node. The library can also be found inside Citrix Hypervisor/XenServer SDK (downloadable from Citrix website). Copy the XenAPI.py file from the SDK to your Python site-packages on your Ansible Control Node to use it. Latest version of the library can also be acquired from GitHub: https://raw.githubusercontent.com/xapi-project/xen-api/master/scripts/examples/python/XenAPI.py",
		"If no scheme is specified in C(hostname), module defaults to C(http://) because C(https://) is problematic in most setups. Make sure you are accessing XenServer host in trusted environment or use C(https://) scheme explicitly.",
		"To use C(https://) scheme for C(hostname) you have to either import host certificate to your OS certificate store or use C(validate_certs: no) which requires XenAPI library from XenServer 7.2 SDK or newer and Python 2.7.9 or newer.",
	]

	requirements: [
		"python >= 2.6",
		"XenAPI",
	]
	options: {
		state: {
			description: [
				"Specify the state VM should be in.",
				"If C(state) is set to value other than C(present), then VM is transitioned into required state and facts are returned.",
				"If C(state) is set to C(present), then VM is just checked for existence and facts are returned.",
			]
			type:    "str"
			default: "present"
			choices: ["powered-on", "powered-off", "restarted", "shutdown-guest", "reboot-guest", "suspended", "present"]
		}
		name: {
			description: [
				"Name of the VM to manage.",
				"VMs running on XenServer do not necessarily have unique names. The module will fail if multiple VMs with same name are found.",
				"In case of multiple VMs with same name, use C(uuid) to uniquely specify VM to manage.",
				"This parameter is case sensitive.",
			]
			type:     "str"
			required: true
			aliases: ["name_label"]
		}
		uuid: {
			description: [
				"UUID of the VM to manage if known. This is XenServer's unique identifier.",
				"It is required if name is not unique.",
			]
			type: "str"
		}
		wait_for_ip_address: {
			description: [
				"Wait until XenServer detects an IP address for the VM.",
				"This requires XenServer Tools to be preinstalled on the VM to work properly.",
			]
			type:    "bool"
			default: false
		}
		state_change_timeout: {
			description: [
				"By default, module will wait indefinitely for VM to change state or acquire an IP address if C(wait_for_ip_address: yes).",
				"If this parameter is set to positive value, the module will instead wait specified number of seconds for the state change.",
				"In case of timeout, module will generate an error message.",
			]
			type:    "int"
			default: 0
		}
	}
	extends_documentation_fragment: "xenserver.documentation"
}
