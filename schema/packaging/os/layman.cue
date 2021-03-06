package ansible

module: layman: {
	module:            "layman"
	author:            "Jakub Jirutka (@jirutka)"
	version_added:     "1.6"
	short_description: "Manage Gentoo overlays"
	description: [
		"Uses Layman to manage an additional repositories for the Portage package manager on Gentoo Linux. Please note that Layman must be installed on a managed node prior using this module.",
	]

	requirements: [
		"python >= 2.6",
		"layman python module",
	]
	options: {
		name: {
			description: [
				"The overlay id to install, synchronize, or uninstall. Use 'ALL' to sync all of the installed overlays (can be used only when C(state=updated)).",
			]

			required: true
		}
		list_url: description: [
			"An URL of the alternative overlays list that defines the overlay to install. This list will be fetched and saved under C(${overlay_defs})/${name}.xml), where C(overlay_defs) is readed from the Layman's configuration.",
		]

		state: {
			description: [
				"Whether to install (C(present)), sync (C(updated)), or uninstall (C(absent)) the overlay.",
			]
			default: "present"
			choices: ["present", "absent", "updated"]
		}
		validate_certs: {
			description: [
				"If C(no), SSL certificates will not be validated. This should only be set to C(no) when no other option exists.  Prior to 1.9.3 the code defaulted to C(no).",
			]

			type:          "bool"
			default:       "yes"
			version_added: "1.9.3"
		}
	}
}
