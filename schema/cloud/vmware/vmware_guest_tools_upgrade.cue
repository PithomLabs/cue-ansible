package ansible

module: vmware_guest_tools_upgrade: {
	module:            "vmware_guest_tools_upgrade"
	short_description: "Module to upgrade VMTools"
	version_added:     2.8
	description: [
		"This module upgrades the VMware Tools on Windows and Linux guests.",
	]
	requirements: [
		"python >= 2.6",
		"PyVmomi",
	]
	notes: [
		"In order to upgrade VMTools, please power on virtual machine before hand - either 'manually' or using module M(vmware_guest_powerstate).",
	]
	options: {
		name: {
			description: [
				"Name of the virtual machine to work with.",
				"This is required if C(uuid) or C(moid) is not supplied.",
			]
			type: "str"
		}
		name_match: {
			description: [
				"If multiple virtual machines matching the name, use the first or last found.",
			]
			default: "first"
			choices: ["first", "last"]
			type: "str"
		}
		uuid: {
			description: [
				"UUID of the instance to manage if known, this is VMware's unique identifier.",
				"This is required if C(name) or C(moid) is not supplied.",
			]
			type: "str"
		}
		moid: {
			description: [
				"Managed Object ID of the instance to manage if known, this is a unique identifier only within a single vCenter instance.",
				"This is required if C(name) or C(uuid) is not supplied.",
			]
			version_added: "2.9"
			type:          "str"
		}
		folder: {
			description: [
				"Destination folder, absolute or relative path to find an existing guest.",
				"This is required, if C(name) is supplied.",
				"The folder should include the datacenter. ESX's datacenter is ha-datacenter",
				"Examples:",
				"   folder: /ha-datacenter/vm",
				"   folder: ha-datacenter/vm",
				"   folder: /datacenter1/vm",
				"   folder: datacenter1/vm",
				"   folder: /datacenter1/vm/folder1",
				"   folder: datacenter1/vm/folder1",
				"   folder: /folder1/datacenter1/vm",
				"   folder: folder1/datacenter1/vm",
				"   folder: /folder1/datacenter1/vm/folder2",
			]
			type: "str"
		}
		datacenter: {
			description: [
				"Destination datacenter where the virtual machine exists.",
			]
			required: true
			type:     "str"
		}
	}
	extends_documentation_fragment: "vmware.documentation"
	author: ["Mike Klebolt (@MikeKlebolt) <michael.klebolt@centurylink.com>"]
}
