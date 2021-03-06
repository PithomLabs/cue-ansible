package ansible

module: efs: {
	module:            "efs"
	short_description: "create and maintain EFS file systems"
	description: [
		"Module allows create, search and destroy Amazon EFS file systems.",
	]
	version_added: "2.2"
	requirements: ["boto3"]
	author: [
		"Ryan Sydnor (@ryansydnor)",
		"Artem Kazakov (@akazakov)",
	]
	options: {
		encrypt: {
			description: [
				"If I(encrypt=true) creates an encrypted file system. This can not be modified after the file system is created.",
			]
			type:          "bool"
			default:       false
			version_added: 2.5
		}
		kms_key_id: {
			description: [
				"The id of the AWS KMS CMK that will be used to protect the encrypted file system. This parameter is only required if you want to use a non-default CMK. If this parameter is not specified, the default CMK for Amazon EFS is used. The key id can be Key ID, Key ID ARN, Key Alias or Key Alias ARN.",
			]

			version_added: 2.5
			type:          "str"
		}
		purge_tags: {
			description: [
				"If yes, existing tags will be purged from the resource to match exactly what is defined by I(tags) parameter. If the I(tags) parameter is not set then tags will not be modified.",
			]

			type:          "bool"
			default:       true
			version_added: 2.5
		}
		state: {
			description: [
				"Allows to create, search and destroy Amazon EFS file system.",
			]
			default: "present"
			choices: ["present", "absent"]
			type: "str"
		}
		name: {
			description: [
				"Creation Token of Amazon EFS file system. Required for create and update. Either name or ID required for delete.",
			]
			type: "str"
		}
		id: {
			description: [
				"ID of Amazon EFS. Either name or ID required for delete.",
			]
			type: "str"
		}
		performance_mode: {
			description: [
				"File system's performance mode to use. Only takes effect during creation.",
			]
			default: "general_purpose"
			choices: ["general_purpose", "max_io"]
			type: "str"
		}
		tags: {
			description: [
				"List of tags of Amazon EFS. Should be defined as dictionary In case of 'present' state with list of tags and existing EFS (matched by 'name'), tags of EFS will be replaced with provided data.",
			]

			type: "dict"
		}
		targets: {
			description: [
				"List of mounted targets. It should be a list of dictionaries, every dictionary should include next attributes: This data may be modified for existing EFS using state 'present' and new list of mount targets.",
			]

			type:     "list"
			elements: "dict"
			suboptions: {
				subnet_id: {
					required:    true
					description: "The ID of the subnet to add the mount target in."
				}
				ip_address: {
					type:        "str"
					description: "A valid IPv4 address within the address range of the specified subnet."
				}
				security_groups: {
					type:        "list"
					elements:    "str"
					description: "List of security group IDs, of the form 'sg-xxxxxxxx'. These must be for the same VPC as subnet specified"
				}
			}
		}
		throughput_mode: {
			description: [
				"The throughput_mode for the file system to be created.",
				"Requires botocore >= 1.10.57",
			]
			choices: ["bursting", "provisioned"]
			version_added: 2.8
			type:          "str"
		}
		provisioned_throughput_in_mibps: {
			description: [
				"If the throughput_mode is provisioned, select the amount of throughput to provisioned in Mibps.",
				"Requires botocore >= 1.10.57",
			]
			type:          "float"
			version_added: 2.8
		}
		wait: {
			description: [
				"In case of 'present' state should wait for EFS 'available' life cycle state (of course, if current state not 'deleting' or 'deleted') In case of 'absent' state should wait for EFS 'deleted' life cycle state",
			]

			type:    "bool"
			default: false
		}
		wait_timeout: {
			description: [
				"How long the module should wait (in seconds) for desired state before returning. Zero means wait as long as necessary.",
			]
			default: 0
			type:    "int"
		}
	}

	extends_documentation_fragment: [
		"aws",
		"ec2",
	]
}
