package ansible

module: ec2_elb_info: {
	module:            "ec2_elb_info"
	short_description: "Gather information about EC2 Elastic Load Balancers in AWS"
	description: [
		"Gather information about EC2 Elastic Load Balancers in AWS",
		"This module was called C(ec2_elb_facts) before Ansible 2.9. The usage did not change.",
	]
	version_added: "2.0"
	author: [
		"Michael Schultz (@mjschultz)",
		"Fernando Jose Pando (@nand0p)",
	]
	options: names: {
		description: [
			"List of ELB names to gather information about. Pass this option to gather information about a set of ELBs, otherwise, all ELBs are returned.",
		]
		type: "list"
	}
	extends_documentation_fragment: [
		"aws",
		"ec2",
	]
}
