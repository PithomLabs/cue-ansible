package ansible

module: mattermost: {
	module:            "mattermost"
	short_description: "Send Mattermost notifications"
	description: [
		"Sends notifications to U(http://your.mattermost.url) via the Incoming WebHook integration.",
	]
	version_added: "2.3"
	author:        "Benjamin Jolivot (@bjolivot)"
	options: {
		url: {
			description: [
				"Mattermost url (i.e. http://mattermost.yourcompany.com).",
			]
			required: true
		}
		api_key: {
			description: [
				"Mattermost webhook api key. Log into your mattermost site, go to Menu -> Integration -> Incoming Webhook -> Add Incoming Webhook. This will give you full URL. api_key is the last part. http://mattermost.example.com/hooks/C(API_KEY)",
			]

			required: true
		}
		text: {
			description: [
				"Text to send. Note that the module does not handle escaping characters.",
			]
			required: true
		}
		channel: description: [
			"Channel to send the message to. If absent, the message goes to the channel selected for the I(api_key).",
		]
		username: {
			description: [
				"This is the sender of the message (Username Override need to be enabled by mattermost admin, see mattermost doc.",
			]
			default: "Ansible"
		}
		icon_url: {
			description: [
				"Url for the message sender's icon.",
			]
			default: "https://www.ansible.com/favicon.ico"
		}
		validate_certs: {
			description: [
				"If C(no), SSL certificates will not be validated. This should only be used on personally controlled sites using self-signed certificates.",
			]

			default: true
			type:    "bool"
		}
	}
}
