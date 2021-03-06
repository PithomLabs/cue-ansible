package ansible

module: azure_rm_virtualmachinescalesetextension: {
	module: "azure_rm_virtualmachinescalesetextension"

	version_added: "2.8"

	short_description: "Manage Azure Virtual Machine Scale Set (VMSS) extensions"

	description: [
		"Create, update and delete Azure Virtual Machine Scale Set (VMSS) extensions.",
	]

	options: {
		resource_group: {
			description: [
				"Name of a resource group where the VMSS extension exists or will be created.",
			]
			required: true
		}
		vmss_name: {
			description: [
				"The name of the virtual machine where the extension should be create or updated.",
			]
			required: true
		}
		name: description: [
			"Name of the VMSS extension.",
		]
		location: description: [
			"Valid Azure location. Defaults to location of the resource group.",
		]
		publisher: description: [
			"The name of the extension handler publisher.",
		]
		type: description: [
			"The type of the extension handler.",
		]
		type_handler_version: description: [
			"The type version of the extension handler.",
		]
		settings: description: [
			"A dictionary containing extension settings.",
			"Settings depend on extension type.",
			"Refer to U(https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/overview) for more information.",
		]
		protected_settings: description: [
			"A dictionary containing protected extension settings.",
			"Settings depend on extension type.",
			"Refer to U(https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/overview) for more information.",
		]
		auto_upgrade_minor_version: {
			description: [
				"Whether the extension handler should be automatically upgraded across minor versions.",
			]
			type: "bool"
		}
		state: {
			description: [
				"Assert the state of the extension.",
				"Use C(present) to create or update an extension and C(absent) to delete it.",
			]
			default: "present"
			choices: [
				"absent",
				"present",
			]
		}
	}

	extends_documentation_fragment: [
		"azure",
	]

	author: ["Zim Kalinowski (@zikalino)"]
}
