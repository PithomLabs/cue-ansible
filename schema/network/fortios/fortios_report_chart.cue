package ansible

module: fortios_report_chart: {
	module:            "fortios_report_chart"
	short_description: "Report chart widget configuration in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify report feature and chart category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
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
		report_chart: {
			description: [
				"Report chart widget configuration.",
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
				background: {
					description: [
						"Chart background.",
					]
					type: "str"
				}
				category: {
					description: [
						"Category.",
					]
					type: "str"
					choices: [
						"misc",
						"traffic",
						"event",
						"virus",
						"webfilter",
						"attack",
						"spam",
						"dlp",
						"app-ctrl",
						"vulnerability",
					]
				}
				category_series: {
					description: [
						"Category series of pie chart.",
					]
					type: "dict"
					suboptions: {
						databind: {
							description: [
								"Category series value expression.",
							]
							type: "str"
						}
						font_size: {
							description: [
								"Font size of category-series title.",
							]
							type: "int"
						}
					}
				}
				color_palette: {
					description: [
						"Color palette (system will pick color automatically by default).",
					]
					type: "str"
				}
				column: {
					description: [
						"Table column definition.",
					]
					type: "list"
					suboptions: {
						detail_unit: {
							description: [
								"Detail unit of column.",
							]
							type: "str"
						}
						detail_value: {
							description: [
								"Detail value of column.",
							]
							type: "str"
						}
						footer_unit: {
							description: [
								"Footer unit of column.",
							]
							type: "str"
						}
						footer_value: {
							description: [
								"Footer value of column.",
							]
							type: "str"
						}
						header_value: {
							description: [
								"Display name of table header.",
							]
							type: "str"
						}
						id: {
							description: [
								"ID.",
							]
							required: true
							type:     "int"
						}
						mapping: {
							description: [
								"Show detail in certain display value for certain condition.",
							]
							type: "list"
							suboptions: {
								displayname: {
									description: [
										"Display name.",
									]
									type: "str"
								}
								id: {
									description: [
										"id",
									]
									required: true
									type:     "int"
								}
								op: {
									description: [
										"Comparison operator.",
									]
									type: "str"
									choices: [
										"none",
										"greater",
										"greater-equal",
										"less",
										"less-equal",
										"equal",
										"between",
									]
								}
								value_type: {
									description: [
										"Value type.",
									]
									type: "str"
									choices: [
										"integer",
										"string",
									]
								}
								value1: {
									description: [
										"Value 1.",
									]
									type: "str"
								}
								value2: {
									description: [
										"Value 2.",
									]
									type: "str"
								}
							}
						}
					}
				}
				comments: {
					description: [
						"Comment.",
					]
					type: "str"
				}
				dataset: {
					description: [
						"Bind dataset to chart.",
					]
					type: "str"
				}
				dimension: {
					description: [
						"Dimension.",
					]
					type: "str"
					choices: [
						"2D",
						"3D",
					]
				}
				drill_down_charts: {
					description: [
						"Drill down charts.",
					]
					type: "list"
					suboptions: {
						chart_name: {
							description: [
								"Drill down chart name.",
							]
							type: "str"
						}
						id: {
							description: [
								"Drill down chart ID.",
							]
							required: true
							type:     "int"
						}
						status: {
							description: [
								"Enable/disable this drill down chart.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
					}
				}
				favorite: {
					description: [
						"Favorite.",
					]
					type: "str"
					choices: [
						false,
						true,
					]
				}
				graph_type: {
					description: [
						"Graph type.",
					]
					type: "str"
					choices: [
						"none",
						"bar",
						"pie",
						"line",
						"flow",
					]
				}
				legend: {
					description: [
						"Enable/Disable Legend area.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				legend_font_size: {
					description: [
						"Font size of legend area.",
					]
					type: "int"
				}
				name: {
					description: [
						"Chart Widget Name",
					]
					required: true
					type:     "str"
				}
				period: {
					description: [
						"Time period.",
					]
					type: "str"
					choices: [
						"last24h",
						"last7d",
					]
				}
				policy: {
					description: [
						"Used by monitor policy.",
					]
					type: "int"
				}
				style: {
					description: [
						"Style.",
					]
					type: "str"
					choices: [
						"auto",
						"manual",
					]
				}
				title: {
					description: [
						"Chart title.",
					]
					type: "str"
				}
				title_font_size: {
					description: [
						"Font size of chart title.",
					]
					type: "int"
				}
				type: {
					description: [
						"Chart type.",
					]
					type: "str"
					choices: [
						"graph",
						"table",
					]
				}
				value_series: {
					description: [
						"Value series of pie chart.",
					]
					type: "dict"
					suboptions: databind: {
						description: [
							"Value series value expression.",
						]
						type: "str"
					}
				}
				x_series: {
					description: [
						"X-series of chart.",
					]
					type: "dict"
					suboptions: {
						caption: {
							description: [
								"X-series caption.",
							]
							type: "str"
						}
						caption_font_size: {
							description: [
								"X-series caption font size.",
							]
							type: "int"
						}
						databind: {
							description: [
								"X-series value expression.",
							]
							type: "str"
						}
						font_size: {
							description: [
								"X-series label font size.",
							]
							type: "int"
						}
						is_category: {
							description: [
								"X-series represent category or not.",
							]
							type: "str"
							choices: [
								true,
								false,
							]
						}
						label_angle: {
							description: [
								"X-series label angle.",
							]
							type: "str"
							choices: [
								"45-degree",
								"vertical",
								"horizontal",
							]
						}
						scale_direction: {
							description: [
								"Scale increase or decrease.",
							]
							type: "str"
							choices: [
								"decrease",
								"increase",
							]
						}
						scale_format: {
							description: [
								"Date/time format.",
							]
							type: "str"
							choices: [
								"YYYY-MM-DD-HH-MM",
								"YYYY-MM-DD HH",
								"YYYY-MM-DD",
								"YYYY-MM",
								"YYYY",
								"HH-MM",
								"MM-DD",
							]
						}
						scale_step: {
							description: [
								"Scale step.",
							]
							type: "int"
						}
						scale_unit: {
							description: [
								"Scale unit.",
							]
							type: "str"
							choices: [
								"minute",
								"hour",
								"day",
								"month",
								"year",
							]
						}
						unit: {
							description: [
								"X-series unit.",
							]
							type: "str"
						}
					}
				}
				y_series: {
					description: [
						"Y-series of chart.",
					]
					type: "dict"
					suboptions: {
						caption: {
							description: [
								"Y-series caption.",
							]
							type: "str"
						}
						caption_font_size: {
							description: [
								"Y-series caption font size.",
							]
							type: "int"
						}
						databind: {
							description: [
								"Y-series value expression.",
							]
							type: "str"
						}
						extra_databind: {
							description: [
								"Extra Y-series value.",
							]
							type: "str"
						}
						extra_y: {
							description: [
								"Allow another Y-series value",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						extra_y_legend: {
							description: [
								"Extra Y-series legend type/name.",
							]
							type: "str"
						}
						font_size: {
							description: [
								"Y-series label font size.",
							]
							type: "int"
						}
						group: {
							description: [
								"Y-series group option.",
							]
							type: "str"
						}
						label_angle: {
							description: [
								"Y-series label angle.",
							]
							type: "str"
							choices: [
								"45-degree",
								"vertical",
								"horizontal",
							]
						}
						unit: {
							description: [
								"Y-series unit.",
							]
							type: "str"
						}
						y_legend: {
							description: [
								"First Y-series legend type/name.",
							]
							type: "str"
						}
					}
				}
			}
		}
	}
}
