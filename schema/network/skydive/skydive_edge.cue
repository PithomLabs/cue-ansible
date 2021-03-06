package ansible

module: skydive_edge: {
	module:        "skydive_edge"
	version_added: "2.8"
	author: [
		"Sumit Jaiswal (@sjaiswal)",
	]
	short_description: "Module to add edges to Skydive topology"
	description: [
		"This module handles setting up edges between two nodes based on the relationship type to the Skydive topology.",
	]

	requirements: [
		"skydive-client",
	]
	extends_documentation_fragment: "skydive"
	options: {
		parent_node: {
			description: [
				"To defined the first node of the link, it can be either an ID or a gremlin expression",
			]

			required: true
		}
		child_node: {
			description: [
				"To defined the second node of the link, it can be either an ID or a gremlin expression",
			]

			required: true
		}
		relation_type: {
			description: [
				"To define relation type of the node I(ownership, layer2, layer3).",
			]
			required: true
		}
		host: {
			description: [
				"To define the host of the node.",
			]
			default:  ""
			required: false
		}
		metadata: {
			description: [
				"To define metadata for the edge.",
			]
			required: false
		}
		state: {
			description: [
				"State of the Skydive Edge. If value is I(present) new edge will be created else if it is I(absent) it will be deleted.",
			]

			default: "present"
			choices: [
				"present",
				"absent",
			]
		}
	}
}
