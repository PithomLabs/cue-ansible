package ansible

module: vmware_guest_register_operation: {
	module:            "vmware_guest_register_operation"
	short_description: "VM inventory registration operation"
	author: [
		"sky-joker (@sky-joker)",
	]
	version_added: "2.10"
	description: [
		"This module can register or unregister VMs to the inventory.",
	]
	requirements: [
		"python >= 2.7",
		"PyVmomi",
	]
	options: {
		datacenter: {
			description: [
				"Destination datacenter for the register/unregister operation.",
				"This parameter is case sensitive.",
			]
			type: "str"
		}
		cluster: {
			description: [
				"Specify a cluster name to register VM.",
			]
			type: "str"
		}
		folder: {
			description: [
				"Description folder, absolute path of the target folder.",
				"The folder should include the datacenter. ESX's datacenter is ha-datacenter.",
				"This parameter is case sensitive.",
				"Examples:",
				"   folder: /ha-datacenter/vm",
				"   folder: ha-datacenter/vm",
				"   folder: /datacenter1/vm",
				"   folder: datacenter1/vm",
				"   folder: /datacenter1/vm/folder1",
				"   folder: datacenter1/vm/folder1",
			]
			type: "str"
		}
		name: {
			description: [
				"Specify VM name to be registered in the inventory.",
			]
			required: true
			type:     "str"
		}
		uuid: {
			description: [
				"UUID of the virtual machine to manage if known, this is VMware's unique identifier.",
				"If virtual machine does not exists, then this parameter is ignored.",
			]
			type: "str"
		}
		esxi_hostname: {
			description: [
				"The ESXi hostname where the virtual machine will run.",
				"This parameter is case sensitive.",
			]
			type: "str"
		}
		template: {
			description: [
				"Whether to register VM as a template.",
			]
			default: false
			type:    "bool"
		}
		path: {
			description: [
				"Specify the path of vmx file.",
				"Examples:",
				"    [datastore1] vm/vm.vmx",
				"    [datastore1] vm/vm.vmtx",
			]
			type: "str"
		}
		resource_pool: {
			description: [
				"Specify a resource pool name to register VM.",
				"This parameter is case sensitive.",
				"Resource pool should be child of the selected host parent.",
			]
			type: "str"
		}
		state: {
			description: [
				"Specify the state the virtual machine should be in.",
				"if set to C(present), register VM in inventory.",
				"if set to C(absent), unregister VM from inventory.",
			]
			default: "present"
			choices: ["present", "absent"]
			type: "str"
		}
	}
	extends_documentation_fragment: "vmware.documentation"
}
