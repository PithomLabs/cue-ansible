package ansible

module: idrac_redfish_config: {
	module:            "idrac_redfish_config"
	version_added:     "2.8"
	short_description: "Manages servers through iDRAC using Dell Redfish APIs"
	description: [
		"For use with Dell iDRAC operations that require Redfish OEM extensions",
		"Builds Redfish URIs locally and sends them to remote iDRAC controllers to set or update a configuration attribute.",
	]

	options: {
		category: {
			required: true
			type:     "str"
			description: [
				"Category to execute on iDRAC",
			]
		}
		command: {
			required: true
			description: [
				"List of commands to execute on iDRAC",
				"I(SetManagerAttributes), I(SetLifecycleControllerAttributes) and I(SetSystemAttributes) are mutually exclusive commands when C(category) is I(Manager)",
			]

			type: "list"
		}
		baseuri: {
			required: true
			description: [
				"Base URI of iDRAC",
			]
			type: "str"
		}
		username: {
			required: true
			description: [
				"User for authentication with iDRAC",
			]
			type: "str"
		}
		password: {
			required: true
			description: [
				"Password for authentication with iDRAC",
			]
			type: "str"
		}
		manager_attribute_name: {
			required: false
			description: [
				"(deprecated) name of iDRAC attribute to update",
			]
			type: "str"
		}
		manager_attribute_value: {
			required: false
			description: [
				"(deprecated) value of iDRAC attribute to update",
			]
			type: "str"
		}
		manager_attributes: {
			required: false
			description: [
				"dictionary of iDRAC attribute name and value pairs to update",
			]
			default: {}
			type:          "dict"
			version_added: "2.10"
		}
		timeout: {
			description: [
				"Timeout in seconds for URL requests to iDRAC controller",
			]
			default: 10
			type:    "int"
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
