package ansible

module: utm_proxy_frontend_info: {
	module: "utm_proxy_frontend_info"

	author: [
		"Johannes Brunswicker (@MatrixCrawler)",
	]

	short_description: "create, update or destroy reverse_proxy frontend entry in Sophos UTM"

	description: [
		"Create, update or destroy a reverse_proxy frontend entry in SOPHOS UTM.",
		"This module needs to have the REST Ability of the UTM to be activated.",
	]

	version_added: "2.8"

	options: name: {
		description: [
			"The name of the object. Will be used to identify the entry",
		]
		required: true
	}

	extends_documentation_fragment: ["utm"]
}
