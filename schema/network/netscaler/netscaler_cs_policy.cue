package ansible

module: netscaler_cs_policy: {
	module:            "netscaler_cs_policy"
	short_description: "Manage content switching policy"
	description: [
		"Manage content switching policy.",
		"This module is intended to run either on the ansible  control node or a bastion (jumpserver) with access to the actual netscaler instance.",
	]

	version_added: "2.4"

	author: "George Nikolopoulos (@giorgos-nikolopoulos)"

	options: {

		policyname: description: [
			"Name for the content switching policy. Must begin with an ASCII alphanumeric or underscore C(_) character, and must contain only ASCII alphanumeric, underscore, hash C(#), period C(.), space C( ), colon C(:), at sign C(@), equal sign C(=), and hyphen C(-) characters. Cannot be changed after a policy is created.",
			"The following requirement applies only to the NetScaler CLI:",
			"If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, my policy or my policy).",
			"Minimum length = 1",
		]

		url: description: [
			"URL string that is matched with the URL of a request. Can contain a wildcard character. Specify the string value in the following format: C([[prefix] [*]] [.suffix]).",
			"Minimum length = 1",
			"Maximum length = 208",
		]

		rule: description: [
			"Expression, or name of a named expression, against which traffic is evaluated. Written in the classic or default syntax.",
			"Note:",
			"Maximum length of a string literal in the expression is 255 characters. A longer string can be split into smaller strings of up to 255 characters each, and the smaller strings concatenated with the + operator. For example, you can create a 500-character string as follows: '\"<string of 255 characters>\" + \"<string of 245 characters>\"'",
		]

		domain: description: [
			"The domain name. The string value can range to 63 characters.",
			"Minimum length = 1",
		]

		action: description: [
			"Content switching action that names the target load balancing virtual server to which the traffic is switched.",
		]
	}

	extends_documentation_fragment: "netscaler"
	requirements: ["nitro python sdk"]
}
