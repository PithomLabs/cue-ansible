package ansible

module: vmware_dvswitch_lacp: {
	module:            "vmware_dvswitch_lacp"
	short_description: "Manage LACP configuration on a Distributed Switch"
	description: [
		"This module can be used to configure Link Aggregation Control Protocol (LACP) support mode and Link Aggregation Groups (LAGs).",
	]
	version_added: 2.8
	author: [
		"Christian Kotte (@ckotte)",
	]
	notes: [
		"Tested on vSphere 6.7",
		"You need to run the task two times if you want to remove all LAGs and change the support mode to 'basic'",
	]
	requirements: [
		"python >= 2.6",
		"PyVmomi",
	]
	options: {
		switch: {
			description: [
				"The name of the Distributed Switch to manage.",
			]
			required: true
			aliases: ["dvswitch"]
			type: "str"
		}
		support_mode: {
			description: [
				"The LACP support mode.",
				"C(basic): One Link Aggregation Control Protocol group in the switch (singleLag).",
				"C(enhanced): Multiple Link Aggregation Control Protocol groups in the switch (multipleLag).",
			]
			type:    "str"
			default: "basic"
			choices: ["basic", "enhanced"]
		}
		link_aggregation_groups: {
			description: [
				"Can only be used if C(lacp_support) is set to C(enhanced).",
				"The following parameters are required:",
				"- C(name) (string): Name of the LAG.",
				"- C(uplink_number) (int): Number of uplinks. Can 1 to 30.",
				"- C(mode) (string): The negotiating state of the uplinks/ports.",
				"   - choices: [ active, passive ]",
				"- C(load_balancing_mode) (string): Load balancing algorithm.",
				"   - Valid attributes are:",
				"   - srcTcpUdpPort: Source TCP/UDP port number.",
				"   - srcDestIpTcpUdpPortVlan: Source and destination IP, source and destination TCP/UDP port number and VLAN.",
				"   - srcIpVlan: Source IP and VLAN.",
				"   - srcDestTcpUdpPort: Source and destination TCP/UDP port number.",
				"   - srcMac: Source MAC address.",
				"   - destIp: Destination IP.",
				"   - destMac: Destination MAC address.",
				"   - vlan: VLAN only.",
				"   - srcDestIp: Source and Destination IP.",
				"   - srcIpTcpUdpPortVlan: Source IP, TCP/UDP port number and VLAN.",
				"   - srcDestIpTcpUdpPort: Source and destination IP and TCP/UDP port number.",
				"   - srcDestMac: Source and destination MAC address.",
				"   - destIpTcpUdpPort: Destination IP and TCP/UDP port number.",
				"   - srcPortId: Source Virtual Port Id.",
				"   - srcIp: Source IP.",
				"   - srcIpTcpUdpPort: Source IP and TCP/UDP port number.",
				"   - destIpTcpUdpPortVlan: Destination IP, TCP/UDP port number and VLAN.",
				"   - destTcpUdpPort: Destination TCP/UDP port number.",
				"   - destIpVlan: Destination IP and VLAN.",
				"   - srcDestIpVlan: Source and destination IP and VLAN.",
				"   - The default load balancing mode in the vSphere Client is srcDestIpTcpUdpPortVlan.",
				"Please see examples for more information.",
			]
			type: "list"
		}
	}
	extends_documentation_fragment: "vmware.documentation"
}
