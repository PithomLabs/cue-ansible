package ansible

module: memset_memstore_info: {
	module:            "memset_memstore_info"
	author:            "Simon Weald (@glitchcrab)"
	version_added:     "2.8"
	short_description: "Retrieve Memstore product usage information."
	notes: [
		"An API key generated via the Memset customer control panel is needed with the following minimum scope - I(memstore.usage).",
	]

	description: [
		"Retrieve Memstore product usage information.",
		"This module was called C(memset_memstore_facts) before Ansible 2.9. The usage did not change.",
	]
	options: {
		api_key: {
			required: true
			description: [
				"The API key obtained from the Memset control panel.",
			]
		}
		name: {
			required: true
			description: ["The Memstore product name (i.e. C(mstestyaa1))."]
		}
	}
}
