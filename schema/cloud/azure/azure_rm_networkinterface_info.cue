package ansible

module: azure_rm_networkinterface_info: {
	module: "azure_rm_networkinterface_info"

	version_added: "2.9"

	short_description: "Get network interface facts"

	description: [
		"Get facts for a specific network interface or all network interfaces within a resource group.",
	]

	options: {
		name: description: [
			"Only show results for a specific network interface.",
		]
		resource_group: description: [
			"Name of the resource group containing the network interface(s). Required when searching by name.",
		]
		tags: description: [
			"Limit results by providing a list of tags. Format tags as 'key' or 'key:value'.",
		]
	}

	extends_documentation_fragment: [
		"azure",
	]

	author: [
		"Chris Houseknecht (@chouseknecht)",
		"Matt Davis (@nitzmahone)",
	]
}
