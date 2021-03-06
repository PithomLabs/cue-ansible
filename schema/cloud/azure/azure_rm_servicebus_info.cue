package ansible

module: azure_rm_servicebus_info: {
	module: "azure_rm_servicebus_info"

	version_added: "2.9"

	short_description: "Get servicebus facts"

	description: [
		"Get facts for a specific servicebus or all servicebus in a resource group or subscription.",
	]

	options: {
		name: description: [
			"Limit results to a specific servicebus.",
		]
		resource_group: description: [
			"Limit results in a specific resource group.",
		]
		tags: description: [
			"Limit results by providing a list of tags. Format tags as 'key' or 'key:value'.",
		]
		namespace: description: [
			"Servicebus namespace name.",
			"A namespace is a scoping container for all messaging components.",
			"Multiple queues and topics can reside within a single namespace, and namespaces often serve as application containers.",
			"Required when I(type=namespace).",
		]
		type: {
			description: [
				"Type of the resource.",
			]
			choices: [
				"namespace",
				"queue",
				"topic",
				"subscription",
			]
		}
		topic: description: [
			"Topic name.",
			"Required when I(type=subscription).",
		]
		show_sas_policies: {
			description: [
				"Whether to show the SAS policies.",
				"Not support when I(type=subscription).",
				"Note if enable this option, the facts module will raise two more HTTP call for each resources, need more network overhead.",
			]
			type: "bool"
		}
	}
	extends_documentation_fragment: [
		"azure",
	]

	author: [
		"Yuwei Zhou (@yuwzho)",
	]
}
