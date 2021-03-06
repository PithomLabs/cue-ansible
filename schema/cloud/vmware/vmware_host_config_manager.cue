package ansible

module: vmware_host_config_manager: {
	module:            "vmware_host_config_manager"
	short_description: "Manage advanced system settings of an ESXi host"
	description: [
		"This module can be used to manage advanced system settings of an ESXi host when ESXi hostname or Cluster name is given.",
	]
	version_added: "2.5"
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
				"Name of the cluster.",
				"Settings are applied to every ESXi host in given cluster.",
				"If C(esxi_hostname) is not given, this parameter is required.",
			]
			type: "str"
		}
		esxi_hostname: {
			description: [
				"ESXi hostname.",
				"Settings are applied to this ESXi host.",
				"If C(cluster_name) is not given, this parameter is required.",
			]
			type: "str"
		}
		options: {
			description: [
				"A dictionary of advanced system settings.",
				"Invalid options will cause module to error.",
				"Note that the list of advanced options (with description and values) can be found by running `vim-cmd hostsvc/advopt/options`.",
			]
			default: {}
			type: "dict"
		}
	}
	extends_documentation_fragment: "vmware.documentation"
}
