package ansible

module: cs_disk_offering: {
	module: "cs_disk_offering"
	description: [
		"Create and delete disk offerings for guest VMs.",
		"Update display_text or display_offering of existing disk offering.",
	]
	short_description: "Manages disk offerings on Apache CloudStack based clouds."
	version_added:     "2.7"
	author: [
		"David Passante (@dpassante)",
		"René Moser (@resmo)",
	]
	options: {
		disk_size: {
			description: ["Size of the disk offering in GB (1GB = 1,073,741,824 bytes)."]
			type: "int"
		}
		bytes_read_rate: {
			description: ["Bytes read rate of the disk offering."]
			type: "int"
		}
		bytes_write_rate: {
			description: ["Bytes write rate of the disk offering."]
			type: "int"
		}
		display_text: {
			description: [
				"Display text of the disk offering.",
				"If not set, C(name) will be used as C(display_text) while creating.",
			]
			type: "str"
		}
		domain: {
			description: [
				"Domain the disk offering is related to.",
				"Public for all domains and subdomains if not set.",
			]
			type: "str"
		}
		hypervisor_snapshot_reserve: {
			description: [
				"Hypervisor snapshot reserve space as a percent of a volume.",
				"Only for managed storage using Xen or VMware.",
			]
			type: "int"
		}
		customized: {
			description: ["Whether disk offering iops is custom or not."]
			type:    "bool"
			default: false
		}
		iops_read_rate: {
			description: ["IO requests read rate of the disk offering."]
			type: "int"
		}
		iops_write_rate: {
			description: ["IO requests write rate of the disk offering."]
			type: "int"
		}
		iops_max: {
			description: ["Max. iops of the disk offering."]
			type: "int"
		}
		iops_min: {
			description: ["Min. iops of the disk offering."]
			type: "int"
		}
		name: {
			description: ["Name of the disk offering."]
			type:     "str"
			required: true
		}
		provisioning_type: {
			description: ["Provisioning type used to create volumes."]
			type: "str"
			choices: ["thin", "sparse", "fat"]
		}
		state: {
			description: ["State of the disk offering."]
			type: "str"
			choices: ["present", "absent"]
			default: "present"
		}
		storage_type: {
			description: ["The storage type of the disk offering."]
			type: "str"
			choices: ["local", "shared"]
		}
		storage_tags: {
			description: ["The storage tags for this disk offering."]
			type: "list"
			aliases: ["storage_tag"]
		}
		display_offering: {
			description: ["An optional field, whether to display the offering to the end user or not."]
			type: "bool"
		}
	}
	extends_documentation_fragment: "cloudstack"
}
