package ansible

module: elb_application_lb_info: {
	module:            "elb_application_lb_info"
	short_description: "Gather information about application ELBs in AWS"
	description: [
		"Gather information about application ELBs in AWS",
		"This module was called C(elb_application_lb_facts) before Ansible 2.9. The usage did not change.",
	]
	version_added: "2.4"
	requirements: ["boto3"]
	author: "Rob White (@wimnat)"
	options: {
		load_balancer_arns: {
			description: [
				"The Amazon Resource Names (ARN) of the load balancers. You can specify up to 20 load balancers in a single call.",
			]
			required: false
			type:     "list"
		}
		names: {
			description: [
				"The names of the load balancers.",
			]
			required: false
			type:     "list"
		}
	}

	extends_documentation_fragment: [
		"aws",
		"ec2",
	]
}
