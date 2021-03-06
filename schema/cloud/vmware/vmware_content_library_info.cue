package ansible

module: vmware_content_library_info: {
	module:            "vmware_content_library_info"
	short_description: "Gather information about VMWare Content Library"
	description: [
		"Module to list the content libraries.",
		"Module to get information about specific content library.",
		"Content Library feature is introduced in vSphere 6.0 version, so this module is not supported in the earlier versions of vSphere.",
		"All variables and VMware object names are case sensitive.",
	]
	version_added: "2.9"
	author: [
		"Pavan Bidkar (@pgbidkar)",
	]
	notes: [
		"Tested on vSphere 6.5, 6.7",
	]
	requirements: [
		"python >= 2.6",
		"PyVmomi",
		"vSphere Automation SDK",
	]
	options: library_id: {
		description: [
			"content library id for which details needs to be fetched.",
		]
		type:     "str"
		required: false
	}
	extends_documentation_fragment: "vmware_rest_client.documentation"
}
