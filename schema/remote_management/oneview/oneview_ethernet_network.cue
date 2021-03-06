package ansible

module: oneview_ethernet_network: {
	module:            "oneview_ethernet_network"
	short_description: "Manage OneView Ethernet Network resources"
	description: [
		"Provides an interface to manage Ethernet Network resources. Can create, update, or delete.",
	]
	version_added: "2.4"
	requirements: [
		"hpOneView >= 3.1.0",
	]
	author: [
		"Felipe Bulsoni (@fgbulsoni)",
		"Thiago Miotto (@tmiotto)",
		"Adriane Cardozo (@adriane-cardozo)",
	]
	options: {
		state: {
			description: [
				"Indicates the desired state for the Ethernet Network resource. - C(present) will ensure data properties are compliant with OneView. - C(absent) will remove the resource from OneView, if it exists. - C(default_bandwidth_reset) will reset the network connection template to the default.",
			]

			default: "present"
			choices: ["present", "absent", "default_bandwidth_reset"]
		}
		data: {
			description: [
				"List with Ethernet Network properties.",
			]
			required: true
		}
	}
	extends_documentation_fragment: [
		"oneview",
		"oneview.validateetag",
	]
}
