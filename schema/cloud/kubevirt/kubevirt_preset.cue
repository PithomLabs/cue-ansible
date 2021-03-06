package ansible

module: kubevirt_preset: {
	module: "kubevirt_preset"

	short_description: "Manage KubeVirt virtual machine presets"

	description: [
		"Use Openshift Python SDK to manage the state of KubeVirt virtual machine presets.",
	]

	version_added: "2.8"

	author: "KubeVirt Team (@kubevirt)"

	options: {
		state: {
			description: [
				"Create or delete virtual machine presets.",
			]
			default: "present"
			choices: [
				"present",
				"absent",
			]
			type: "str"
		}
		name: {
			description: [
				"Name of the virtual machine preset.",
			]
			required: true
			type:     "str"
		}
		namespace: {
			description: [
				"Namespace where the virtual machine preset exists.",
			]
			required: true
			type:     "str"
		}
		selector: {
			description: [
				"Selector is a label query over a set of virtual machine preset.",
			]
			type: "dict"
		}
	}

	extends_documentation_fragment: [
		"k8s_auth_options",
		"kubevirt_vm_options",
		"kubevirt_common_options",
	]

	requirements: [
		"python >= 2.7",
		"openshift >= 0.8.2",
	]
}
