package ansible

module: rabbitmq_publish: {
	module:            "rabbitmq_publish"
	short_description: "Publish a message to a RabbitMQ queue."
	version_added:     "2.8"
	description: [
		"Publish a message on a RabbitMQ queue using a blocking connection.",
	]
	options: {
		url: description: [
			"An URL connection string to connect to the RabbitMQ server.",
			"I(url) and I(host)/I(port)/I(user)/I(pass)/I(vhost) are mutually exclusive, use either or but not both.",
		]
		proto: {
			description: [
				"The protocol to use.",
			]
			choices: ["amqps", "amqp"]
		}
		host: description: [
			"The RabbitMQ server hostname or IP.",
		]
		port: description: [
			"The RabbitMQ server port.",
		]
		username: description: [
			"The RabbitMQ username.",
		]
		password: description: [
			"The RabbitMQ password.",
		]
		vhost: description: [
			"The virtual host to target.",
			"If default vhost is required, use C('%2F').",
		]
		queue: description: [
			"The queue to publish a message to.  If no queue is specified, RabbitMQ will return a random queue name.",
		]
		exchange: description: [
			"The exchange to publish a message to.",
		]
		routing_key: description: [
			"The routing key.",
		]
		body: description: [
			"The body of the message.",
			"A C(body) cannot be provided if a C(src) is specified.",
		]
		src: {
			description: [
				"A file to upload to the queue.  Automatic mime type detection is attempted if content_type is not defined (left as default).",
				"A C(src) cannot be provided if a C(body) is specified.",
				"The filename is added to the headers of the posted message to RabbitMQ. Key being the C(filename), value is the filename.",
			]
			aliases: ["file"]
		}
		content_type: {
			description: [
				"The content type of the body.",
			]
			default: "text/plain"
		}
		durable: {
			description: [
				"Set the queue to be durable.",
			]
			default: false
			type:    "bool"
		}
		exclusive: {
			description: [
				"Set the queue to be exclusive.",
			]
			default: false
			type:    "bool"
		}
		auto_delete: {
			description: [
				"Set the queue to auto delete.",
			]
			default: false
			type:    "bool"
		}
		headers: {
			description: [
				"A dictionary of headers to post with the message.",
			]
			default: {}
			type: "dict"
		}
	}

	requirements: ["pika"]
	notes: [
		"This module requires the pika python library U(https://pika.readthedocs.io/).",
		"Pika is a pure-Python implementation of the AMQP 0-9-1 protocol that tries to stay fairly independent of the underlying network support library.",
		"This plugin is tested against RabbitMQ. Other AMQP 0.9.1 protocol based servers may work but not tested/guaranteed.",
	]
	author: "John Imison (@Im0)"
}
