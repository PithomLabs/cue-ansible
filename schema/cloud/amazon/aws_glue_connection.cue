package ansible

module: aws_glue_connection: {
	module:            "aws_glue_connection"
	short_description: "Manage an AWS Glue connection"
	description: [
		"Manage an AWS Glue connection. See U(https://aws.amazon.com/glue/) for details.",
	]
	version_added: "2.6"
	requirements: ["boto3"]
	author: "Rob White (@wimnat)"
	options: {
		catalog_id: {
			description: [
				"The ID of the Data Catalog in which to create the connection. If none is supplied, the AWS account ID is used by default.",
			]

			required: false
			type:     "str"
		}
		connection_properties: {
			description: [
				"A dict of key-value pairs used as parameters for this connection.",
			]
			required: true
			type:     "dict"
		}
		connection_type: {
			description: [
				"The type of the connection. Currently, only JDBC is supported; SFTP is not supported.",
			]
			required: false
			default:  "JDBC"
			choices: ["JDBC", "SFTP"]
			type: "str"
		}
		description: {
			description: [
				"The description of the connection.",
			]
			required: false
			type:     "str"
		}
		match_criteria: {
			description: [
				"A list of UTF-8 strings that specify the criteria that you can use in selecting this connection.",
			]
			required: false
			type:     "list"
			elements: "str"
		}
		name: {
			description: [
				"The name of the connection.",
			]
			required: true
			type:     "str"
		}
		security_groups: {
			description: [
				"A list of security groups to be used by the connection. Use either security group name or ID.",
			]
			required: false
			type:     "list"
			elements: "str"
		}
		state: {
			description: [
				"Create or delete the AWS Glue connection.",
			]
			required: true
			choices: ["present", "absent"]
			type: "str"
		}
		subnet_id: {
			description: [
				"The subnet ID used by the connection.",
			]
			required: false
			type:     "str"
		}
	}
	extends_documentation_fragment: [
		"aws",
		"ec2",
	]
}
