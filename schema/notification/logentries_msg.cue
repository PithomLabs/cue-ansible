package ansible

module: logentries_msg: {
	module:            "logentries_msg"
	version_added:     "2.5"
	short_description: "Send a message to logentries."
	description: [
		"Send a message to logentries",
	]
	requirements: [
		"python >= 2.6",
	]
	options: {
		token: {
			description: [
				"Log token.",
			]
			required: true
		}
		msg: {
			description: [
				"The message body.",
			]
			required: true
		}
		api: {
			description: [
				"API endpoint",
			]
			default: "data.logentries.com"
		}
		port: {
			description: [
				"API endpoint port",
			]
			default: 80
		}
	}
	author: "Jimmy Tang (@jcftang) <jimmy_tang@rapid7.com>"
}
