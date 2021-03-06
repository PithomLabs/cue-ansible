package ansible

module: aws_waf_info: {
	module:            "aws_waf_info"
	short_description: "Retrieve information for WAF ACLs, Rule , Conditions and Filters."
	description: [
		"Retrieve information for WAF ACLs, Rule , Conditions and Filters.",
		"This module was called C(aws_waf_facts) before Ansible 2.9. The usage did not change.",
	]
	version_added: "2.4"
	requirements: ["boto3"]
	options: {
		name: {
			description: [
				"The name of a Web Application Firewall.",
			]
			type: "str"
		}
		waf_regional: {
			description:   "Whether to use the waf-regional module."
			default:       false
			required:      false
			type:          "bool"
			version_added: "2.9"
		}
	}

	author: [
		"Mike Mochan (@mmochan)",
		"Will Thames (@willthames)",
	]
	extends_documentation_fragment: [
		"aws",
		"ec2",
	]
}
