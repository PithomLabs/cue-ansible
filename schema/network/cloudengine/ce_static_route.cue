package ansible

module: ce_static_route: {
	module:            "ce_static_route"
	version_added:     "2.4"
	short_description: "Manages static route configuration on HUAWEI CloudEngine switches."
	description: [
		"Manages the static routes on HUAWEI CloudEngine switches.",
	]
	author: "Yang yang (@QijunPan)"
	notes: [
		"If no vrf is supplied, vrf is set to default.",
		"If I(state=absent), the route will be removed, regardless of the non-required parameters.",
		"This module requires the netconf system service be enabled on the remote device being managed.",
		"Recommended connection is C(netconf).",
		"This module also works with C(local) connections for legacy playbooks.",
	]
	options: {
		prefix: {
			description: [
				"Destination ip address of static route.",
			]
			required: true
		}
		mask: {
			description: [
				"Destination ip mask of static route.",
			]
			required: true
		}
		aftype: {
			description: [
				"Destination ip address family type of static route.",
			]
			required: true
			choices: ["v4", "v6"]
		}
		next_hop: description: [
			"Next hop address of static route.",
		]
		nhp_interface: description: [
			"Next hop interface full name of static route.",
		]
		vrf: description: [
			"VPN instance of destination ip address.",
		]
		destvrf: description: [
			"VPN instance of next hop ip address.",
		]
		tag: description: [
			"Route tag value (numeric).",
		]
		description: description: [
			"Name of the route. Used with the name parameter on the CLI.",
		]
		pref: description: [
			"Preference or administrative difference of route (range 1-255).",
		]
		state: {
			description: [
				"Specify desired state of the resource.",
			]
			choices: ["present", "absent"]
			default: "present"
		}
	}
}
