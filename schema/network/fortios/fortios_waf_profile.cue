package ansible

module: fortios_waf_profile: {
	module:            "fortios_waf_profile"
	short_description: "Web application firewall configuration in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify waf feature and profile category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
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
		waf_profile: {
			description: [
				"Web application firewall configuration.",
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
				address_list: {
					description: [
						"Black address list and white address list.",
					]
					type: "dict"
					suboptions: {
						blocked_address: {
							description: [
								"Blocked address.",
							]
							type: "list"
							suboptions: name: {
								description: [
									"Address name. Source firewall.address.name firewall.addrgrp.name.",
								]
								required: true
								type:     "str"
							}
						}
						blocked_log: {
							description: [
								"Enable/disable logging on blocked addresses.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						severity: {
							description: [
								"Severity.",
							]
							type: "str"
							choices: [
								"high",
								"medium",
								"low",
							]
						}
						status: {
							description: [
								"Status.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						trusted_address: {
							description: [
								"Trusted address.",
							]
							type: "list"
							suboptions: name: {
								description: [
									"Address name. Source firewall.address.name firewall.addrgrp.name.",
								]
								required: true
								type:     "str"
							}
						}
					}
				}
				comment: {
					description: [
						"Comment.",
					]
					type: "str"
				}
				constraint: {
					description: [
						"WAF HTTP protocol restrictions.",
					]
					type: "dict"
					suboptions: {
						content_length: {
							description: [
								"HTTP content length in request.",
							]
							type: "dict"
							suboptions: {
								action: {
									description: [
										"Action.",
									]
									type: "str"
									choices: [
										"allow",
										"block",
									]
								}
								length: {
									description: [
										"Length of HTTP content in bytes (0 to 2147483647).",
									]
									type: "int"
								}
								log: {
									description: [
										"Enable/disable logging.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								severity: {
									description: [
										"Severity.",
									]
									type: "str"
									choices: [
										"high",
										"medium",
										"low",
									]
								}
								status: {
									description: [
										"Enable/disable the constraint.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
							}
						}
						exception: {
							description: [
								"HTTP constraint exception.",
							]
							type: "list"
							suboptions: {
								address: {
									description: [
										"Host address. Source firewall.address.name firewall.addrgrp.name.",
									]
									type: "str"
								}
								content_length: {
									description: [
										"HTTP content length in request.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								header_length: {
									description: [
										"HTTP header length in request.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								hostname: {
									description: [
										"Enable/disable hostname check.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								id: {
									description: [
										"Exception ID.",
									]
									required: true
									type:     "int"
								}
								line_length: {
									description: [
										"HTTP line length in request.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								malformed: {
									description: [
										"Enable/disable malformed HTTP request check.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								max_cookie: {
									description: [
										"Maximum number of cookies in HTTP request.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								max_header_line: {
									description: [
										"Maximum number of HTTP header line.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								max_range_segment: {
									description: [
										"Maximum number of range segments in HTTP range line.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								max_url_param: {
									description: [
										"Maximum number of parameters in URL.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								method: {
									description: [
										"Enable/disable HTTP method check.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								param_length: {
									description: [
										"Maximum length of parameter in URL, HTTP POST request or HTTP body.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								pattern: {
									description: [
										"URL pattern.",
									]
									type: "str"
								}
								regex: {
									description: [
										"Enable/disable regular expression based pattern match.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								url_param_length: {
									description: [
										"Maximum length of parameter in URL.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								version: {
									description: [
										"Enable/disable HTTP version check.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
							}
						}
						header_length: {
							description: [
								"HTTP header length in request.",
							]
							type: "dict"
							suboptions: {
								action: {
									description: [
										"Action.",
									]
									type: "str"
									choices: [
										"allow",
										"block",
									]
								}
								length: {
									description: [
										"Length of HTTP header in bytes (0 to 2147483647).",
									]
									type: "int"
								}
								log: {
									description: [
										"Enable/disable logging.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								severity: {
									description: [
										"Severity.",
									]
									type: "str"
									choices: [
										"high",
										"medium",
										"low",
									]
								}
								status: {
									description: [
										"Enable/disable the constraint.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
							}
						}
						hostname: {
							description: [
								"Enable/disable hostname check.",
							]
							type: "dict"
							suboptions: {
								action: {
									description: [
										"Action.",
									]
									type: "str"
									choices: [
										"allow",
										"block",
									]
								}
								log: {
									description: [
										"Enable/disable logging.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								severity: {
									description: [
										"Severity.",
									]
									type: "str"
									choices: [
										"high",
										"medium",
										"low",
									]
								}
								status: {
									description: [
										"Enable/disable the constraint.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
							}
						}
						line_length: {
							description: [
								"HTTP line length in request.",
							]
							type: "dict"
							suboptions: {
								action: {
									description: [
										"Action.",
									]
									type: "str"
									choices: [
										"allow",
										"block",
									]
								}
								length: {
									description: [
										"Length of HTTP line in bytes (0 to 2147483647).",
									]
									type: "int"
								}
								log: {
									description: [
										"Enable/disable logging.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								severity: {
									description: [
										"Severity.",
									]
									type: "str"
									choices: [
										"high",
										"medium",
										"low",
									]
								}
								status: {
									description: [
										"Enable/disable the constraint.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
							}
						}
						malformed: {
							description: [
								"Enable/disable malformed HTTP request check.",
							]
							type: "dict"
							suboptions: {
								action: {
									description: [
										"Action.",
									]
									type: "str"
									choices: [
										"allow",
										"block",
									]
								}
								log: {
									description: [
										"Enable/disable logging.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								severity: {
									description: [
										"Severity.",
									]
									type: "str"
									choices: [
										"high",
										"medium",
										"low",
									]
								}
								status: {
									description: [
										"Enable/disable the constraint.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
							}
						}
						max_cookie: {
							description: [
								"Maximum number of cookies in HTTP request.",
							]
							type: "dict"
							suboptions: {
								action: {
									description: [
										"Action.",
									]
									type: "str"
									choices: [
										"allow",
										"block",
									]
								}
								log: {
									description: [
										"Enable/disable logging.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								max_cookie: {
									description: [
										"Maximum number of cookies in HTTP request (0 to 2147483647).",
									]
									type: "int"
								}
								severity: {
									description: [
										"Severity.",
									]
									type: "str"
									choices: [
										"high",
										"medium",
										"low",
									]
								}
								status: {
									description: [
										"Enable/disable the constraint.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
							}
						}
						max_header_line: {
							description: [
								"Maximum number of HTTP header line.",
							]
							type: "dict"
							suboptions: {
								action: {
									description: [
										"Action.",
									]
									type: "str"
									choices: [
										"allow",
										"block",
									]
								}
								log: {
									description: [
										"Enable/disable logging.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								max_header_line: {
									description: [
										"Maximum number HTTP header lines (0 to 2147483647).",
									]
									type: "int"
								}
								severity: {
									description: [
										"Severity.",
									]
									type: "str"
									choices: [
										"high",
										"medium",
										"low",
									]
								}
								status: {
									description: [
										"Enable/disable the constraint.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
							}
						}
						max_range_segment: {
							description: [
								"Maximum number of range segments in HTTP range line.",
							]
							type: "dict"
							suboptions: {
								action: {
									description: [
										"Action.",
									]
									type: "str"
									choices: [
										"allow",
										"block",
									]
								}
								log: {
									description: [
										"Enable/disable logging.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								max_range_segment: {
									description: [
										"Maximum number of range segments in HTTP range line (0 to 2147483647).",
									]
									type: "int"
								}
								severity: {
									description: [
										"Severity.",
									]
									type: "str"
									choices: [
										"high",
										"medium",
										"low",
									]
								}
								status: {
									description: [
										"Enable/disable the constraint.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
							}
						}
						max_url_param: {
							description: [
								"Maximum number of parameters in URL.",
							]
							type: "dict"
							suboptions: {
								action: {
									description: [
										"Action.",
									]
									type: "str"
									choices: [
										"allow",
										"block",
									]
								}
								log: {
									description: [
										"Enable/disable logging.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								max_url_param: {
									description: [
										"Maximum number of parameters in URL (0 to 2147483647).",
									]
									type: "int"
								}
								severity: {
									description: [
										"Severity.",
									]
									type: "str"
									choices: [
										"high",
										"medium",
										"low",
									]
								}
								status: {
									description: [
										"Enable/disable the constraint.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
							}
						}
						method: {
							description: [
								"Enable/disable HTTP method check.",
							]
							type: "dict"
							suboptions: {
								action: {
									description: [
										"Action.",
									]
									type: "str"
									choices: [
										"allow",
										"block",
									]
								}
								log: {
									description: [
										"Enable/disable logging.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								severity: {
									description: [
										"Severity.",
									]
									type: "str"
									choices: [
										"high",
										"medium",
										"low",
									]
								}
								status: {
									description: [
										"Enable/disable the constraint.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
							}
						}
						param_length: {
							description: [
								"Maximum length of parameter in URL, HTTP POST request or HTTP body.",
							]
							type: "dict"
							suboptions: {
								action: {
									description: [
										"Action.",
									]
									type: "str"
									choices: [
										"allow",
										"block",
									]
								}
								length: {
									description: [
										"Maximum length of parameter in URL, HTTP POST request or HTTP body in bytes (0 to 2147483647).",
									]
									type: "int"
								}
								log: {
									description: [
										"Enable/disable logging.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								severity: {
									description: [
										"Severity.",
									]
									type: "str"
									choices: [
										"high",
										"medium",
										"low",
									]
								}
								status: {
									description: [
										"Enable/disable the constraint.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
							}
						}
						url_param_length: {
							description: [
								"Maximum length of parameter in URL.",
							]
							type: "dict"
							suboptions: {
								action: {
									description: [
										"Action.",
									]
									type: "str"
									choices: [
										"allow",
										"block",
									]
								}
								length: {
									description: [
										"Maximum length of URL parameter in bytes (0 to 2147483647).",
									]
									type: "int"
								}
								log: {
									description: [
										"Enable/disable logging.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								severity: {
									description: [
										"Severity.",
									]
									type: "str"
									choices: [
										"high",
										"medium",
										"low",
									]
								}
								status: {
									description: [
										"Enable/disable the constraint.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
							}
						}
						version: {
							description: [
								"Enable/disable HTTP version check.",
							]
							type: "dict"
							suboptions: {
								action: {
									description: [
										"Action.",
									]
									type: "str"
									choices: [
										"allow",
										"block",
									]
								}
								log: {
									description: [
										"Enable/disable logging.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								severity: {
									description: [
										"Severity.",
									]
									type: "str"
									choices: [
										"high",
										"medium",
										"low",
									]
								}
								status: {
									description: [
										"Enable/disable the constraint.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
							}
						}
					}
				}
				extended_log: {
					description: [
						"Enable/disable extended logging.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				external: {
					description: [
						"Disable/Enable external HTTP Inspection.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				method: {
					description: [
						"Method restriction.",
					]
					type: "dict"
					suboptions: {
						default_allowed_methods: {
							description: [
								"Methods.",
							]
							type: "str"
							choices: [
								"get",
								"post",
								"put",
								"head",
								"connect",
								"trace",
								"options",
								"delete",
								"others",
							]
						}
						log: {
							description: [
								"Enable/disable logging.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						method_policy: {
							description: [
								"HTTP method policy.",
							]
							type: "list"
							suboptions: {
								address: {
									description: [
										"Host address. Source firewall.address.name firewall.addrgrp.name.",
									]
									type: "str"
								}
								allowed_methods: {
									description: [
										"Allowed Methods.",
									]
									type: "str"
									choices: [
										"get",
										"post",
										"put",
										"head",
										"connect",
										"trace",
										"options",
										"delete",
										"others",
									]
								}
								id: {
									description: [
										"HTTP method policy ID.",
									]
									required: true
									type:     "int"
								}
								pattern: {
									description: [
										"URL pattern.",
									]
									type: "str"
								}
								regex: {
									description: [
										"Enable/disable regular expression based pattern match.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
							}
						}
						severity: {
							description: [
								"Severity.",
							]
							type: "str"
							choices: [
								"high",
								"medium",
								"low",
							]
						}
						status: {
							description: [
								"Status.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
					}
				}
				name: {
					description: [
						"WAF Profile name.",
					]
					required: true
					type:     "str"
				}
				signature: {
					description: [
						"WAF signatures.",
					]
					type: "dict"
					suboptions: {
						credit_card_detection_threshold: {
							description: [
								"The minimum number of Credit cards to detect violation.",
							]
							type: "int"
						}
						custom_signature: {
							description: [
								"Custom signature.",
							]
							type: "list"
							suboptions: {
								action: {
									description: [
										"Action.",
									]
									type: "str"
									choices: [
										"allow",
										"block",
										"erase",
									]
								}
								case_sensitivity: {
									description: [
										"Case sensitivity in pattern.",
									]
									type: "str"
									choices: [
										"disable",
										"enable",
									]
								}
								direction: {
									description: [
										"Traffic direction.",
									]
									type: "str"
									choices: [
										"request",
										"response",
									]
								}
								log: {
									description: [
										"Enable/disable logging.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								name: {
									description: [
										"Signature name.",
									]
									required: true
									type:     "str"
								}
								pattern: {
									description: [
										"Match pattern.",
									]
									type: "str"
								}
								severity: {
									description: [
										"Severity.",
									]
									type: "str"
									choices: [
										"high",
										"medium",
										"low",
									]
								}
								status: {
									description: [
										"Status.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								target: {
									description: [
										"Match HTTP target.",
									]
									type: "str"
									choices: [
										"arg",
										"arg-name",
										"req-body",
										"req-cookie",
										"req-cookie-name",
										"req-filename",
										"req-header",
										"req-header-name",
										"req-raw-uri",
										"req-uri",
										"resp-body",
										"resp-hdr",
										"resp-status",
									]
								}
							}
						}
						disabled_signature: {
							description: [
								"Disabled signatures",
							]
							type: "list"
							suboptions: id: {
								description: [
									"Signature ID. Source waf.signature.id.",
								]
								required: true
								type:     "int"
							}
						}
						disabled_sub_class: {
							description: [
								"Disabled signature subclasses.",
							]
							type: "list"
							suboptions: id: {
								description: [
									"Signature subclass ID. Source waf.sub-class.id.",
								]
								required: true
								type:     "int"
							}
						}
						main_class: {
							description: [
								"Main signature class.",
							]
							type: "list"
							suboptions: {
								action: {
									description: [
										"Action.",
									]
									type: "str"
									choices: [
										"allow",
										"block",
										"erase",
									]
								}
								id: {
									description: [
										"Main signature class ID. Source waf.main-class.id.",
									]
									required: true
									type:     "int"
								}
								log: {
									description: [
										"Enable/disable logging.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								severity: {
									description: [
										"Severity.",
									]
									type: "str"
									choices: [
										"high",
										"medium",
										"low",
									]
								}
								status: {
									description: [
										"Status.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
							}
						}
					}
				}
				url_access: {
					description: [
						"URL access list",
					]
					type: "list"
					suboptions: {
						access_pattern: {
							description: [
								"URL access pattern.",
							]
							type: "list"
							suboptions: {
								id: {
									description: [
										"URL access pattern ID.",
									]
									required: true
									type:     "int"
								}
								negate: {
									description: [
										"Enable/disable match negation.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								pattern: {
									description: [
										"URL pattern.",
									]
									type: "str"
								}
								regex: {
									description: [
										"Enable/disable regular expression based pattern match.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								srcaddr: {
									description: [
										"Source address. Source firewall.address.name firewall.addrgrp.name.",
									]
									type: "str"
								}
							}
						}
						action: {
							description: [
								"Action.",
							]
							type: "str"
							choices: [
								"bypass",
								"permit",
								"block",
							]
						}
						address: {
							description: [
								"Host address. Source firewall.address.name firewall.addrgrp.name.",
							]
							type: "str"
						}
						id: {
							description: [
								"URL access ID.",
							]
							required: true
							type:     "int"
						}
						log: {
							description: [
								"Enable/disable logging.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						severity: {
							description: [
								"Severity.",
							]
							type: "str"
							choices: [
								"high",
								"medium",
								"low",
							]
						}
					}
				}
			}
		}
	}
}
