package ansible

module: elb_target: {
	module:            "elb_target"
	short_description: "Manage a target in a target group"
	description: [
		"Used to register or deregister a target in a target group",
	]
	version_added: "2.5"
	author:        "Rob White (@wimnat)"
	options: {
		deregister_unused: {
			description: [
				"The default behaviour for targets that are unused is to leave them registered. If instead you would like to remove them set I(deregister_unused) to yes.",
			]

			type: "bool"
		}
		target_az: {
			description: [
				"An Availability Zone or all. This determines whether the target receives traffic from the load balancer nodes in the specified Availability Zone or from all enabled Availability Zones for the load balancer. This parameter is not supported if the target type of the target group is instance.",
			]

			type: "str"
		}
		target_group_arn: {
			description: [
				"The Amazon Resource Name (ARN) of the target group. Mutually exclusive of I(target_group_name).",
			]
			type: "str"
		}
		target_group_name: {
			description: [
				"The name of the target group. Mutually exclusive of I(target_group_arn).",
			]
			type: "str"
		}
		target_id: {
			description: [
				"The ID of the target.",
			]
			required: true
			type:     "str"
		}
		target_port: {
			description: [
				"The port on which the target is listening. You can specify a port override. If a target is already registered, you can register it again using a different port.",
				"The default port for a target is the port for the target group.",
			]
			required: false
			type:     "int"
		}
		target_status: {
			description: [
				"Blocks and waits for the target status to equal given value. For more detail on target status see U(https://docs.aws.amazon.com/elasticloadbalancing/latest/application/target-group-health-checks.html#target-health-states)",
			]

			required: false
			choices: ["initial", "healthy", "unhealthy", "unused", "draining", "unavailable"]
			type: "str"
		}
		target_status_timeout: {
			description: [
				"Maximum time in seconds to wait for target_status change",
			]
			required: false
			default:  60
			type:     "int"
		}
		state: {
			description: [
				"Register or deregister the target.",
			]
			required: true
			choices: ["present", "absent"]
			type: "str"
		}
	}
	extends_documentation_fragment: [
		"aws",
		"ec2",
	]
	notes: ["If you specified a port override when you registered a target, you must specify both the target ID and the port when you deregister it."]
}
