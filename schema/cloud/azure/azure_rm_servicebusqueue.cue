package ansible

module: azure_rm_servicebusqueue: {
	module:            "azure_rm_servicebusqueue"
	version_added:     "2.8"
	short_description: "Manage Azure Service Bus queue"
	description: [
		"Create, update or delete an Azure Service Bus queue.",
	]
	options: {
		resource_group: {
			description: [
				"Name of resource group.",
			]
			required: true
		}
		name: {
			description: [
				"Name of the queue.",
			]
			required: true
		}
		namespace: {
			description: [
				"Servicebus namespace name.",
				"A namespace is a scoping container for all messaging components.",
				"Multiple queues and topics can reside within a single namespace, and namespaces often serve as application containers.",
			]
			required: true
		}
		state: {
			description: [
				"Assert the state of the queue. Use C(present) to create or update and use C(absent) to delete.",
			]
			default: "present"
			choices: [
				"absent",
				"present",
			]
		}
		auto_delete_on_idle_in_seconds: {
			description: [
				"Time idle interval after which a queue is automatically deleted.",
				"The minimum duration is 5 minutes.",
			]
			type: "int"
		}
		dead_lettering_on_message_expiration: {
			description: [
				"A value that indicates whether a queue has dead letter support when a message expires.",
			]
			type: "bool"
		}
		default_message_time_to_live_seconds: {
			description: [
				"Default message timespan to live value.",
				"This is the duration after which the message expires, starting from when the message is sent to Service Bus.",
				"This is the default value used when TimeToLive is not set on a message itself.",
			]
			type: "int"
		}
		enable_batched_operations: {
			description: [
				"Value that indicates whether server-side batched operations are enabled.",
			]
			type: "bool"
		}
		enable_express: {
			description: [
				"Value that indicates whether Express Entities are enabled.",
				"An express topic or queue holds a message in memory temporarily before writing it to persistent storage.",
			]
			type: "bool"
		}
		enable_partitioning: {
			description: [
				"A value that indicates whether the topic or queue is to be partitioned across multiple message brokers.",
			]
			type: "bool"
		}
		forward_dead_lettered_messages_to: description: [
			"Queue or topic name to forward the Dead Letter message for a queue.",
		]
		forward_to: description: [
			"Queue or topic name to forward the messages for a queue.",
		]
		lock_duration_in_seconds: {
			description: [
				"Timespan duration of a peek-lock.",
				"The amount of time that the message is locked for other receivers.",
				"The maximum value for LockDuration is 5 minutes.",
			]
			type: "int"
		}
		max_delivery_count: {
			description: [
				"The maximum delivery count.",
				"A message is automatically deadlettered after this number of deliveries.",
			]
			type: "int"
		}
		max_size_in_mb: {
			description: [
				"The maximum size of the queue in megabytes, which is the size of memory allocated for the queue.",
			]
			type: "int"
		}
		requires_duplicate_detection: {
			description: [
				"A value indicating if this queue or topic requires duplicate detection.",
			]
			type: "bool"
		}
		duplicate_detection_time_in_seconds: {
			description: [
				"TimeSpan structure that defines the duration of the duplicate detection history.",
			]
			type: "int"
		}
		requires_session: {
			description: [
				"A value that indicates whether the queue supports the concept of sessions.",
			]
			type: "bool"
		}
		status: {
			description: [
				"Status of the entity.",
			]
			choices: [
				"active",
				"disabled",
				"send_disabled",
				"receive_disabled",
			]
		}
	}
	extends_documentation_fragment: [
		"azure",
		"azure_tags",
	]

	author: [
		"Yuwei Zhou (@yuwzho)",
	]
}
