package ansible

module: vmware_host_firewall_info: {
	module:            "vmware_host_firewall_info"
	short_description: "Gathers info about an ESXi host's firewall configuration information"
	description: [
		"This module can be used to gather information about an ESXi host's firewall configuration information when ESXi hostname or Cluster name is given.",
	]
	version_added: "2.9"
	author: [
		"Abhijeet Kasurde (@Akasurde)",
	]
	notes: [
		"Tested on vSphere 6.5",
	]
	requirements: [
		"python >= 2.6",
		"PyVmomi",
	]
	options: {
		cluster_name: {
			description: [
				"Name of the cluster from which the ESXi host belong to.",
				"If C(esxi_hostname) is not given, this parameter is required.",
			]
			type: "str"
		}
		esxi_hostname: {
			description: [
				"ESXi hostname to gather information from.",
				"If C(cluster_name) is not given, this parameter is required.",
			]
			type: "str"
		}
	}
	extends_documentation_fragment: "vmware.documentation"
}
