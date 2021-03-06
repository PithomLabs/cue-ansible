package ansible

module: idrac_redfish_command: {
	module:            "idrac_redfish_command"
	version_added:     "2.8"
	short_description: "Manages Out-Of-Band controllers using iDRAC OEM Redfish APIs"
	description: [
		"Builds Redfish URIs locally and sends them to remote OOB controllers to perform an action.",
		"For use with Dell iDRAC operations that require Redfish OEM extensions",
	]
	options: {
		category: {
			required: true
			description: [
				"Category to execute on OOB controller",
			]
			type: "str"
		}
		command: {
			required: true
			description: [
				"List of commands to execute on OOB controller",
			]
			type: "list"
		}
		baseuri: {
			required: true
			description: [
				"Base URI of OOB controller",
			]
			type: "str"
		}
		username: {
			required: true
			description: [
				"User for authentication with OOB controller",
			]
			type: "str"
		}
		password: {
			required: true
			description: [
				"Password for authentication with OOB controller",
			]
			type: "str"
		}
		timeout: {
			description: [
				"Timeout in seconds for URL requests to OOB controller",
			]
			default:       10
			type:          "int"
			version_added: "2.8"
		}
		resource_id: {
			required: false
			description: [
				"The ID of the System, Manager or Chassis to modify",
			]
			type:          "str"
			version_added: "2.10"
		}
	}

	author: "Jose Delarosa (@jose-delarosa)"
}
