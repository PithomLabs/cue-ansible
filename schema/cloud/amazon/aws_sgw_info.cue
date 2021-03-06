package ansible

module: aws_sgw_info: {
	module:            "aws_sgw_info"
	short_description: "Fetch AWS Storage Gateway information"
	description: [
		"Fetch AWS Storage Gateway information",
		"This module was called C(aws_sgw_facts) before Ansible 2.9. The usage did not change.",
	]
	version_added: "2.6"
	requirements: ["boto3"]
	author: "Loic Blot (@nerzhul) <loic.blot@unix-experience.fr>"
	options: {
		gather_local_disks: {
			description: [
				"Gather local disks attached to the storage gateway.",
			]
			type:     "bool"
			required: false
			default:  true
		}
		gather_tapes: {
			description: [
				"Gather tape information for storage gateways in tape mode.",
			]
			type:     "bool"
			required: false
			default:  true
		}
		gather_file_shares: {
			description: [
				"Gather file share information for storage gateways in s3 mode.",
			]
			type:     "bool"
			required: false
			default:  true
		}
		gather_volumes: {
			description: [
				"Gather volume information for storage gateways in iSCSI (cached & stored) modes.",
			]
			type:     "bool"
			required: false
			default:  true
		}
	}
	extends_documentation_fragment: [
		"aws",
		"ec2",
	]
}
