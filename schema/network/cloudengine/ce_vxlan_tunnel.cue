package ansible

module: ce_vxlan_tunnel: {
	module:            "ce_vxlan_tunnel"
	version_added:     "2.4"
	short_description: "Manages VXLAN tunnel configuration on HUAWEI CloudEngine devices."
	description: [
		"This module offers the ability to set the VNI and mapped to the BD, and configure an ingress replication list on HUAWEI CloudEngine devices.",
	]

	author: [
		"Li Yanfeng (@QijunPan)",
	]
	notes: [
		"This module requires the netconf system service be enabled on the remote device being managed.",
		"Recommended connection is C(netconf).",
		"This module also works with C(local) connections for legacy playbooks.",
	]
	options: {
		bridge_domain_id: description: [
			"Specifies a bridge domain ID. The value is an integer ranging from 1 to 16777215.",
		]
		vni_id: description: [
			"Specifies a VXLAN network identifier (VNI) ID. The value is an integer ranging from 1 to 16000000.",
		]
		nve_name: description: [
			"Specifies the number of an NVE interface. The value ranges from 1 to 2.",
		]
		nve_mode: {
			description: [
				"Specifies the working mode of an NVE interface.",
			]
			choices: ["mode-l2", "mode-l3"]
		}
		peer_list_ip: description: [
			"Specifies the IP address of a remote VXLAN tunnel endpoints (VTEP). The value is in dotted decimal notation.",
		]

		protocol_type: {
			description: [
				"The operation type of routing protocol.",
			]
			choices: ["bgp", "null"]
		}
		source_ip: description: [
			"Specifies an IP address for a source VTEP. The value is in dotted decimal notation.",
		]
		state: {
			description: [
				"Manage the state of the resource.",
			]
			default: "present"
			choices: ["present", "absent"]
		}
	}
}
