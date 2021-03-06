package ansible

module: fortios_report_style: {
	module:            "fortios_report_style"
	short_description: "Report style configuration in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify report feature and style category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
	]

	version_added: "2.8"
	author: [
		"Miguel Angel Munoz (@mamunozgonzalez)",
		"Nicolas Thomas (@thomnico)",
	]
	notes: [
		"Requires fortiosapi library developed by Fortinet",
		"Run as a local_action in your playbook",
	]
	requirements: [
		"fortiosapi>=0.9.8",
	]
	options: {
		host: {
			description: [
				"FortiOS or FortiGate IP address.",
			]
			type:     "str"
			required: false
		}
		username: {
			description: [
				"FortiOS or FortiGate username.",
			]
			type:     "str"
			required: false
		}
		password: {
			description: [
				"FortiOS or FortiGate password.",
			]
			type:    "str"
			default: ""
		}
		vdom: {
			description: [
				"Virtual domain, among those defined previously. A vdom is a virtual instance of the FortiGate that can be configured and used as a different unit.",
			]

			type:    "str"
			default: "root"
		}
		https: {
			description: [
				"Indicates if the requests towards FortiGate must use HTTPS protocol.",
			]
			type:    "bool"
			default: true
		}
		ssl_verify: {
			description: [
				"Ensures FortiGate certificate must be verified by a proper CA.",
			]
			type:          "bool"
			default:       true
			version_added: 2.9
		}
		state: {
			description: [
				"Indicates whether to create or remove the object. This attribute was present already in previous version in a deeper level. It has been moved out to this outer level.",
			]

			type:     "str"
			required: false
			choices: [
				"present",
				"absent",
			]
			version_added: 2.9
		}
		report_style: {
			description: [
				"Report style configuration.",
			]
			default: null
			type:    "dict"
			suboptions: {
				state: {
					description: [
						"B(Deprecated)",
						"Starting with Ansible 2.9 we recommend using the top-level 'state' parameter.",
						"HORIZONTALLINE",
						"Indicates whether to create or remove the object.",
					]
					type:     "str"
					required: false
					choices: [
						"present",
						"absent",
					]
				}
				align: {
					description: [
						"Alignment.",
					]
					type: "str"
					choices: [
						"left",
						"center",
						"right",
						"justify",
					]
				}
				bg_color: {
					description: [
						"Background color.",
					]
					type: "str"
				}
				border_bottom: {
					description: [
						"Border bottom.",
					]
					type: "str"
				}
				border_left: {
					description: [
						"Border left.",
					]
					type: "str"
				}
				border_right: {
					description: [
						"Border right.",
					]
					type: "str"
				}
				border_top: {
					description: [
						"Border top.",
					]
					type: "str"
				}
				column_gap: {
					description: [
						"Column gap.",
					]
					type: "str"
				}
				column_span: {
					description: [
						"Column span.",
					]
					type: "str"
					choices: [
						"none",
						"all",
					]
				}
				fg_color: {
					description: [
						"Foreground color.",
					]
					type: "str"
				}
				font_family: {
					description: [
						"Font family.",
					]
					type: "str"
					choices: [
						"Verdana",
						"Arial",
						"Helvetica",
						"Courier",
						"Times",
					]
				}
				font_size: {
					description: [
						"Font size.",
					]
					type: "str"
				}
				font_style: {
					description: [
						"Font style.",
					]
					type: "str"
					choices: [
						"normal",
						"italic",
					]
				}
				font_weight: {
					description: [
						"Font weight.",
					]
					type: "str"
					choices: [
						"normal",
						"bold",
					]
				}
				height: {
					description: [
						"Height.",
					]
					type: "str"
				}
				line_height: {
					description: [
						"Text line height.",
					]
					type: "str"
				}
				margin_bottom: {
					description: [
						"Margin bottom.",
					]
					type: "str"
				}
				margin_left: {
					description: [
						"Margin left.",
					]
					type: "str"
				}
				margin_right: {
					description: [
						"Margin right.",
					]
					type: "str"
				}
				margin_top: {
					description: [
						"Margin top.",
					]
					type: "str"
				}
				name: {
					description: [
						"Report style name.",
					]
					required: true
					type:     "str"
				}
				options: {
					description: [
						"Report style options.",
					]
					type: "str"
					choices: [
						"font",
						"text",
						"color",
						"align",
						"size",
						"margin",
						"border",
						"padding",
						"column",
					]
				}
				padding_bottom: {
					description: [
						"Padding bottom.",
					]
					type: "str"
				}
				padding_left: {
					description: [
						"Padding left.",
					]
					type: "str"
				}
				padding_right: {
					description: [
						"Padding right.",
					]
					type: "str"
				}
				padding_top: {
					description: [
						"Padding top.",
					]
					type: "str"
				}
				width: {
					description: [
						"Width.",
					]
					type: "str"
				}
			}
		}
	}
}
