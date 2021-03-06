package ansible

module: aws_waf_web_acl: {
	module:            "aws_waf_web_acl"
	short_description: "Create and delete WAF Web ACLs."
	description: [
		"Read the AWS documentation for WAF U(https://aws.amazon.com/documentation/waf/).",
	]

	version_added: "2.5"

	author: [
		"Mike Mochan (@mmochan)",
		"Will Thames (@willthames)",
	]
	extends_documentation_fragment: [
		"aws",
		"ec2",
	]
	options: {
		name: {
			description: "Name of the Web Application Firewall ACL to manage."
			required:    true
			type:        "str"
		}
		default_action: {
			description: "The action that you want AWS WAF to take when a request doesn't match the criteria specified in any of the Rule objects that are associated with the WebACL."

			choices: [
				"block",
				"allow",
				"count",
			]
			type: "str"
		}
		state: {
			description: "Whether the Web ACL should be present or absent."
			choices: [
				"present",
				"absent",
			]
			default: "present"
			type:    "str"
		}
		metric_name: {
			description: [
				"A friendly name or description for the metrics for this WebACL.",
				"The name can contain only alphanumeric characters (A-Z, a-z, 0-9); the name can't contain whitespace.",
				"You can't change I(metric_name) after you create the WebACL.",
				"Metric name will default to I(name) with disallowed characters stripped out.",
			]
			type: "str"
		}
		rules: {
			description: [
				"A list of rules that the Web ACL will enforce.",
			]
			type:     "list"
			elements: "dict"
			suboptions: {
				name: {
					description: "Name of the rule."
					type:        "str"
					required:    true
				}
				action: {
					description: "The action to perform."
					type:        "str"
					required:    true
				}
				priority: {
					description: "The priority of the action.  Priorities must be unique. Lower numbered priorities are evaluated first."
					type:        "int"
					required:    true
				}
				type: {
					description: "The type of rule."
					choices: [
						"rate_based",
						"regular",
					]
					type: "str"
				}
			}
		}
		purge_rules: {
			description: [
				"Whether to remove rules that aren't passed with I(rules).",
			]
			default: false
			type:    "bool"
		}
		waf_regional: {
			description:   "Whether to use waf-regional module."
			default:       false
			required:      false
			type:          "bool"
			version_added: "2.9"
		}
	}
}
