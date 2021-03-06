package ansible

module: panos_sag: {
	module:            "panos_sag"
	short_description: "Create a static address group."
	description: [
		"Create a static address group object in the firewall used for policy rules.",
	]
	author:        "Vinay Venkataraghavan (@vinayvenkat)"
	version_added: "2.4"
	requirements: [
		"pan-python can be obtained from PyPI U(https://pypi.org/project/pan-python/)",
		"pandevice can be obtained from PyPI U(https://pypi.org/project/pandevice/)",
		"xmltodict can be obtained from PyPI U(https://pypi.org/project/xmltodict/)",
	]
	deprecated: {
		alternative: "Use U(https://galaxy.ansible.com/PaloAltoNetworks/paloaltonetworks) instead."
		removed_in:  "2.12"
		why:         "Consolidating code base."
	}
	options: {
		api_key: description: [
			"API key that can be used instead of I(username)/I(password) credentials.",
		]
		sag_name: {
			description: [
				"name of the dynamic address group",
			]
			required: true
		}
		sag_match_filter: {
			description: [
				"Static filter user by the address group",
			]
			type: "list"
		}
		devicegroup: description: """
		- The name of the Panorama device group. The group must exist on Panorama. If device group is not defined it is assumed that we are contacting a firewall.

		"""

		description: description: [
			"The purpose / objective of the static Address Group",
		]
		tags: description: [
			"Tags to be associated with the address group",
		]
		commit: {
			description: [
				"commit if changed",
			]
			type:    "bool"
			default: "yes"
		}
		operation: {
			description: [
				"The operation to perform Supported values are I(add)/I(list)/I(delete).",
			]
			required: true
			choices: [
				"add",
				"list",
				"delete",
			]
		}
	}
	extends_documentation_fragment: "panos"
}
