package ansible

module: vmware_guest_info: {
	module:            "vmware_guest_info"
	short_description: "Gather info about a single VM"
	description: [
		"Gather information about a single VM on a VMware ESX cluster.",
		"This module was called C(vmware_guest_facts) before Ansible 2.9. The usage did not change.",
	]
	version_added: 2.3
	author: [
		"Loic Blot (@nerzhul) <loic.blot@unix-experience.fr>",
	]
	notes: [
		"Tested on vSphere 5.5, 6.7",
	]
	requirements: [
		"python >= 2.6",
		"PyVmomi",
	]
	options: {
		name: {
			description: [
				"Name of the VM to work with",
				"This is required if C(uuid) or C(moid) is not supplied.",
			]
			type: "str"
		}
		name_match: {
			description: [
				"If multiple VMs matching the name, use the first or last found",
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
		use_instance_uuid: {
			description: [
				"Whether to use the VMware instance UUID rather than the BIOS UUID.",
			]
			default:       false
			type:          "bool"
			version_added: "2.8"
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
				"This is required if name is supplied.",
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
				"Destination datacenter for the deploy operation",
			]
			required: true
			type:     "str"
		}
		tags: {
			description: [
				"Whether to show tags or not.",
				"If set C(True), shows tag information.",
				"If set C(False), hides tags information.",
				"vSphere Automation SDK and vCloud Suite SDK is required.",
			]
			default:       "no"
			type:          "bool"
			version_added: "2.8"
		}
		schema: {
			description: [
				"Specify the output schema desired.",
				"The 'summary' output schema is the legacy output from the module",
				"The 'vsphere' output schema is the vSphere API class definition which requires pyvmomi>6.7.1",
			]

			choices: ["summary", "vsphere"]
			default:       "summary"
			type:          "str"
			version_added: "2.8"
		}
		properties: {
			description: [
				"Specify the properties to retrieve.",
				"If not specified, all properties are retrieved (deeply).",
				"Results are returned in a structure identical to the vsphere API.",
				"Example:",
				"   properties: [",
				"      \"config.hardware.memoryMB\",",
				"      \"config.hardware.numCPU\",",
				"      \"guest.disk\",",
				"      \"overallStatus\"",
				"   ]",
				"Only valid when C(schema) is C(vsphere).",
			]
			type:          "list"
			required:      false
			version_added: "2.8"
		}
	}
	extends_documentation_fragment: "vmware.documentation"
}
