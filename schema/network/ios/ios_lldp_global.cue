package ansible

module: ios_lldp_global: {
	module:            "ios_lldp_global"
	version_added:     2.9
	short_description: "Configure and manage Link Layer Discovery Protocol(LLDP) attributes on IOS platforms."
	description:       "This module configures and manages the Link Layer Discovery Protocol(LLDP) attributes on IOS platforms."
	author:            "Sumit Jaiswal (@justjais)"
	notes: [
		"Tested against Cisco IOSv Version 15.2 on VIRL",
		"This module works with connection C(network_cli), See L(IOS Platform Options,../network/user_guide/platform_ios.html).",
	]

	options: {
		config: {
			description: "A dictionary of LLDP options"
			type:        "dict"
			suboptions: {
				holdtime: {
					description: [
						"LLDP holdtime (in sec) to be sent in packets.",
						"Refer to vendor documentation for valid values.",
					]
					type: "int"
				}
				reinit: {
					description: [
						"Specify the delay (in secs) for LLDP to initialize.",
						"Refer to vendor documentation for valid values.",
						"NOTE, if LLDP reinit is configured with a starting value, idempotency won't be maintained as the Cisco device doesn't record the starting reinit configured value. As such, Ansible cannot verify if the respective starting reinit value is already configured or not from the device side. If you try to apply starting reinit value in every play run, Ansible will show changed as True. For any other reinit value, idempotency will be maintained since any other reinit value is recorded in the Cisco device.",
					]

					type: "int"
				}
				enabled: {
					description: [
						"Enable LLDP",
					]
					type: "bool"
				}
				timer: {
					description: [
						"Specify the rate at which LLDP packets are sent (in sec).",
						"Refer to vendor documentation for valid values.",
					]
					type: "int"
				}
				tlv_select: {
					description: [
						"Selection of LLDP TLVs i.e. type-length-value to send",
						"NOTE, if tlv-select is configured idempotency won't be maintained as Cisco device doesn't record configured tlv-select options. As such, Ansible cannot verify if the respective tlv-select options is already configured or not from the device side. If you try to apply tlv-select option in every play run, Ansible will show changed as True.",
					]

					type: "dict"
					suboptions: {
						four_wire_power_management: {
							description: [
								"Cisco 4-wire Power via MDI TLV",
							]
							type: "bool"
						}
						mac_phy_cfg: {
							description: [
								"IEEE 802.3 MAC/Phy Configuration/status TLV",
							]
							type: "bool"
						}
						management_address: {
							description: [
								"Management Address TLV",
							]
							type: "bool"
						}
						port_description: {
							description: [
								"Port Description TLV",
							]
							type: "bool"
						}
						port_vlan: {
							description: [
								"Port VLAN ID TLV",
							]
							type: "bool"
						}
						power_management: {
							description: [
								"IEEE 802.3 DTE Power via MDI TLV",
							]
							type: "bool"
						}
						system_capabilities: {
							description: [
								"System Capabilities TLV",
							]
							type: "bool"
						}
						system_description: {
							description: [
								"System Description TLV",
							]
							type: "bool"
						}
						system_name: {
							description: [
								"System Name TLV",
							]
							type: "bool"
						}
					}
				}
			}
		}
		state: {
			description: [
				"The state of the configuration after module completion",
			]
			type: "str"
			choices: [
				"merged",
				"replaced",
				"deleted",
			]
			default: "merged"
		}
	}
}
