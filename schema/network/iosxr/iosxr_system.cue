package ansible

module: iosxr_system: {
	module:        "iosxr_system"
	version_added: "2.3"
	author: [
		"Peter Sprygada (@privateip)",
		"Kedar Kekan (@kedarX)",
	]
	short_description: "Manage the system attributes on Cisco IOS XR devices"
	description: [
		"This module provides declarative management of node system attributes on Cisco IOS XR devices. It provides an option to configure host system parameters or remove those parameters from the device active configuration.",
	]

	requirements: [
		"ncclient >= 0.5.3 when using netconf",
		"lxml >= 4.1.1 when using netconf",
	]
	extends_documentation_fragment: "iosxr"
	notes: [
		"This module works with connection C(network_cli) and C(netconf). See L(the IOS-XR Platform Options,../network/user_guide/platform_iosxr.html).",
		"Tested against IOS XRv 6.1.3",
		"name-servers I(state=absent) operation with C(netconf) transport is a success, but with rpc-error. This is due to XR platform issue. Recommended to use I(ignore_errors) option with the task as a workaround.",
	]

	options: {
		hostname: description: [
			"Configure the device hostname parameter. This option takes an ASCII string value.",
		]
		vrf: {
			description: [
				"VRF name for domain services",
			]
			version_added: 2.5
		}
		domain_name: description: [
			"Configure the IP domain name on the remote device to the provided value. Value should be in the dotted name form and will be appended to the C(hostname) to create a fully-qualified domain name.",
		]

		domain_search: description: [
			"Provides the list of domain suffixes to append to the hostname for the purpose of doing name resolution. This argument accepts a list of names and will be reconciled with the current active configuration on the running node.",
		]

		lookup_source: description: [
			"The C(lookup_source) argument provides one or more source interfaces to use for performing DNS lookups.  The interface provided in C(lookup_source) must be a valid interface configured on the device.",
		]

		lookup_enabled: {
			description: [
				"Provides administrative control for enabling or disabling DNS lookups.  When this argument is set to True, lookups are performed and when it is set to False, lookups are not performed.",
			]

			type: "bool"
		}
		name_servers: description: [
			"The C(name_serves) argument accepts a list of DNS name servers by way of either FQDN or IP address to use to perform name resolution lookups.  This argument accepts wither a list of DNS servers See examples.",
		]

		state: {
			description: [
				"State of the configuration values in the device's current active configuration.  When set to I(present), the values should be configured in the device active configuration and when set to I(absent) the values should not be in the device active configuration",
			]

			default: "present"
			choices: ["present", "absent"]
		}
	}
}
