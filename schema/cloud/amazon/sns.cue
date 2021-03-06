package ansible

module: sns: {
	module:            "sns"
	short_description: "Send Amazon Simple Notification Service messages"
	description: [
		"Sends a notification to a topic on your Amazon SNS account.",
	]
	version_added: 1.6
	author: [
		"Michael J. Schultz (@mjschultz)",
		"Paul Arthur (@flowerysong)",
	]
	options: {
		msg: {
			description: [
				"Default message for subscriptions without a more specific message.",
			]
			required: true
			aliases: ["default"]
			type: "str"
		}
		subject: {
			description: [
				"Message subject",
			]
			type: "str"
		}
		topic: {
			description: [
				"The name or ARN of the topic to publish to.",
			]
			required: true
			type:     "str"
		}
		email: {
			description: [
				"Message to send to email subscriptions.",
			]
			type: "str"
		}
		email_json: {
			description: [
				"Message to send to email-json subscriptions.",
			]
			version_added: "2.8"
			type:          "str"
		}
		sqs: {
			description: [
				"Message to send to SQS subscriptions.",
			]
			type: "str"
		}
		sms: {
			description: [
				"Message to send to SMS subscriptions.",
			]
			type: "str"
		}
		http: {
			description: [
				"Message to send to HTTP subscriptions.",
			]
			type: "str"
		}
		https: {
			description: [
				"Message to send to HTTPS subscriptions.",
			]
			type: "str"
		}
		application: {
			description: [
				"Message to send to application subscriptions.",
			]
			version_added: "2.8"
			type:          "str"
		}
		lambda: {
			description: [
				"Message to send to Lambda subscriptions.",
			]
			version_added: "2.8"
			type:          "str"
		}
		message_attributes: {
			description: [
				"Dictionary of message attributes. These are optional structured data entries to be sent along to the endpoint.",
				"This is in AWS's distinct Name/Type/Value format; see example below.",
			]
			type: "dict"
		}
		message_structure: {
			description: [
				"The payload format to use for the message.",
				"This must be 'json' to support protocol-specific messages (C(http), C(https), C(email), C(sms), C(sqs)).",
				"It must be 'string' to support I(message_attributes).",
			]
			default: "json"
			choices: ["json", "string"]
			type: "str"
		}
	}
	extends_documentation_fragment: [
		"ec2",
		"aws",
	]
	requirements: [
		"boto3",
		"botocore",
	]
}
