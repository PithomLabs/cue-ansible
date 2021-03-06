package ansible

module: cs_iso: {
	module:            "cs_iso"
	short_description: "Manages ISO images on Apache CloudStack based clouds."
	description: [
		"Register and remove ISO images.",
	]
	version_added: "2.0"
	author:        "René Moser (@resmo)"
	options: {
		name: {
			description: ["Name of the ISO."]
			type:     "str"
			required: true
		}
		display_text: {
			description: [
				"Display text of the ISO.",
				"If not specified, I(name) will be used.",
			]
			type:          "str"
			version_added: "2.4"
		}
		url: {
			description: ["URL where the ISO can be downloaded from. Required if I(state) is present."]
			type: "str"
		}
		os_type: {
			description: ["Name of the OS that best represents the OS of this ISO. If the iso is bootable this parameter needs to be passed. Required if I(state) is present."]
			type: "str"
		}
		is_ready: {
			description: [
				"This flag is used for searching existing ISOs. If set to C(yes), it will only list ISO ready for deployment e.g. successfully downloaded and installed. Recommended to set it to C(no).",
			]

			type:    "bool"
			default: false
		}
		is_public: {
			description: ["Register the ISO to be publicly available to all users. Only used if I(state) is present."]
			type: "bool"
		}
		is_featured: {
			description: ["Register the ISO to be featured. Only used if I(state) is present."]
			type: "bool"
		}
		is_dynamically_scalable: {
			description: ["Register the ISO having XS/VMware tools installed inorder to support dynamic scaling of VM cpu/memory. Only used if I(state) is present."]
			type: "bool"
		}
		checksum: {
			description: ["The MD5 checksum value of this ISO. If set, we search by checksum instead of name."]
			type: "str"
		}
		bootable: {
			description: ["Register the ISO to be bootable. Only used if I(state) is present."]
			type: "bool"
		}
		domain: {
			description: ["Domain the ISO is related to."]
			type: "str"
		}
		account: {
			description: ["Account the ISO is related to."]
			type: "str"
		}
		project: {
			description: ["Name of the project the ISO to be registered in."]
			type: "str"
		}
		zone: {
			description: [
				"Name of the zone you wish the ISO to be registered or deleted from.",
				"If not specified, first zone found will be used.",
			]
			type: "str"
		}
		cross_zones: {
			description: [
				"Whether the ISO should be synced or removed across zones.",
				"Mutually exclusive with I(zone).",
			]
			type:          "bool"
			default:       false
			version_added: "2.4"
		}
		iso_filter: {
			description: ["Name of the filter used to search for the ISO."]
			type:    "str"
			default: "self"
			choices: ["featured", "self", "selfexecutable", "sharedexecutable", "executable", "community"]
		}
		state: {
			description: ["State of the ISO."]
			type:    "str"
			default: "present"
			choices: ["present", "absent"]
		}
		poll_async: {
			description: ["Poll async jobs until job has finished."]
			type:          "bool"
			default:       true
			version_added: "2.3"
		}
		tags: {
			description: [
				"List of tags. Tags are a list of dictionaries having keys I(key) and I(value).",
				"To delete all tags, set a empty list e.g. I(tags: []).",
			]
			type: "list"
			aliases: ["tag"]
			version_added: "2.4"
		}
	}
	extends_documentation_fragment: "cloudstack"
}
