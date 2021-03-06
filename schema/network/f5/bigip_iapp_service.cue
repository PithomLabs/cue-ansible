package ansible

module: bigip_iapp_service: {
	module:            "bigip_iapp_service"
	short_description: "Manages TCL iApp services on a BIG-IP"
	description: [
		"Manages TCL iApp services on a BIG-IP.",
		"If you are looking for the API that is communicated with on the BIG-IP, the one the is used is C(/mgmt/tm/sys/application/service/).",
	]

	version_added: 2.4
	options: {
		name: {
			description: [
				"The name of the iApp service that you want to deploy.",
			]
			type:     "str"
			required: true
		}
		template: {
			description: [
				"The iApp template from which to instantiate a new service. This template must exist on your BIG-IP before you can successfully create a service.",
				"When creating a new service, this parameter is required.",
			]
			type: "str"
		}
		parameters: {
			description: [
				"A hash of all the required template variables for the iApp template. If your parameters are stored in a file (the more common scenario) it is recommended you use either the C(file) or C(template) lookups to supply the expected parameters.",
				"These parameters typically consist of the C(lists), C(tables), and C(variables) fields.",
			]

			type: "dict"
		}
		force: {
			description: [
				"Forces the updating of an iApp service even if the parameters to the service have not changed. This option is of particular importance if the iApp template that underlies the service has been updated in-place. This option is equivalent to re-configuring the iApp if that template has changed.",
			]

			type:    "bool"
			default: false
		}
		state: {
			description: [
				"When C(present), ensures that the iApp service is created and running. When C(absent), ensures that the iApp service has been removed.",
			]

			type: "str"
			choices: [
				"present",
				"absent",
			]
			default: "present"
		}
		partition: {
			description: [
				"Device partition to manage resources on.",
			]
			type:          "str"
			default:       "Common"
			version_added: 2.5
		}
		strict_updates: {
			description: [
				"Indicates whether the application service is tied to the template, so when the template is updated, the application service changes to reflect the updates.",
				"When C(yes), disallows any updates to the resources that the iApp service has created, if they are not updated directly through the iApp.",
				"When C(no), allows updates outside of the iApp.",
				"If this option is specified in the Ansible task, it will take precedence over any similar setting in the iApp Service payload that you provide in the C(parameters) field.",
			]

			type:          "bool"
			default:       true
			version_added: 2.5
		}
		traffic_group: {
			description: [
				"The traffic group for the iApp service. When creating a new service, if this value is not specified, the default of C(/Common/traffic-group-1) will be used.",
				"If this option is specified in the Ansible task, it will take precedence over any similar setting in the iApp Service payload that you provide in the C(parameters) field.",
			]

			type:          "str"
			version_added: 2.5
		}
		metadata: {
			description: [
				"Metadata associated with the iApp service.",
				"If this option is specified in the Ansible task, it will take precedence over any similar setting in the iApp Service payload that you provide in the C(parameters) field.",
			]

			type:          "list"
			version_added: 2.7
		}
		description: {
			description: [
				"Description of the iApp service.",
				"If this option is specified in the Ansible task, it will take precedence over any similar setting in the iApp Service payload that you provide in the C(parameters) field.",
			]

			type:          "str"
			version_added: 2.7
		}
		device_group: {
			description: [
				"The device group for the iApp service.",
				"If this option is specified in the Ansible task, it will take precedence over any similar setting in the iApp Service payload that you provide in the C(parameters) field.",
			]

			type:          "str"
			version_added: 2.7
		}
	}
	extends_documentation_fragment: "f5"
	author: [
		"Tim Rupp (@caphrim007)",
		"Wojciech Wypior (@wojtek0806)",
	]
}
