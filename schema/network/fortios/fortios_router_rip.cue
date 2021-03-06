package ansible

module: fortios_router_rip: {
	module:            "fortios_router_rip"
	short_description: "Configure RIP in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify router feature and rip category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
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
		router_rip: {
			description: [
				"Configure RIP.",
			]
			default: null
			type:    "dict"
			suboptions: {
				default_information_originate: {
					description: [
						"Enable/disable generation of default route.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				default_metric: {
					description: [
						"Default metric.",
					]
					type: "int"
				}
				distance: {
					description: [
						"distance",
					]
					type: "list"
					suboptions: {
						access_list: {
							description: [
								"Access list for route destination. Source router.access-list.name.",
							]
							type: "str"
						}
						distance: {
							description: [
								"Distance (1 - 255).",
							]
							type: "int"
						}
						id: {
							description: [
								"Distance ID.",
							]
							required: true
							type:     "int"
						}
						prefix: {
							description: [
								"Distance prefix.",
							]
							type: "str"
						}
					}
				}
				distribute_list: {
					description: [
						"Distribute list.",
					]
					type: "list"
					suboptions: {
						direction: {
							description: [
								"Distribute list direction.",
							]
							type: "str"
							choices: [
								"in",
								"out",
							]
						}
						id: {
							description: [
								"Distribute list ID.",
							]
							required: true
							type:     "int"
						}
						interface: {
							description: [
								"Distribute list interface name. Source system.interface.name.",
							]
							type: "str"
						}
						listname: {
							description: [
								"Distribute access/prefix list name. Source router.access-list.name router.prefix-list.name.",
							]
							type: "str"
						}
						status: {
							description: [
								"status",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
					}
				}
				garbage_timer: {
					description: [
						"Garbage timer in seconds.",
					]
					type: "int"
				}
				interface: {
					description: [
						"RIP interface configuration.",
					]
					type: "list"
					suboptions: {
						auth_keychain: {
							description: [
								"Authentication key-chain name. Source router.key-chain.name.",
							]
							type: "str"
						}
						auth_mode: {
							description: [
								"Authentication mode.",
							]
							type: "str"
							choices: [
								"none",
								"text",
								"md5",
							]
						}
						auth_string: {
							description: [
								"Authentication string/password.",
							]
							type: "str"
						}
						flags: {
							description: [
								"flags",
							]
							type: "int"
						}
						name: {
							description: [
								"Interface name. Source system.interface.name.",
							]
							required: true
							type:     "str"
						}
						receive_version: {
							description: [
								"Receive version.",
							]
							type: "str"
							choices: [
								1,
								2,
							]
						}
						send_version: {
							description: [
								"Send version.",
							]
							type: "str"
							choices: [
								1,
								2,
							]
						}
						send_version2_broadcast: {
							description: [
								"Enable/disable broadcast version 1 compatible packets.",
							]
							type: "str"
							choices: [
								"disable",
								"enable",
							]
						}
						split_horizon: {
							description: [
								"Enable/disable split horizon.",
							]
							type: "str"
							choices: [
								"poisoned",
								"regular",
							]
						}
						split_horizon_status: {
							description: [
								"Enable/disable split horizon.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
					}
				}
				max_out_metric: {
					description: [
						"Maximum metric allowed to output(0 means 'not set').",
					]
					type: "int"
				}
				neighbor: {
					description: [
						"neighbor",
					]
					type: "list"
					suboptions: {
						id: {
							description: [
								"Neighbor entry ID.",
							]
							required: true
							type:     "int"
						}
						ip: {
							description: [
								"IP address.",
							]
							type: "str"
						}
					}
				}
				network: {
					description: [
						"network",
					]
					type: "list"
					suboptions: {
						id: {
							description: [
								"Network entry ID.",
							]
							required: true
							type:     "int"
						}
						prefix: {
							description: [
								"Network prefix.",
							]
							type: "str"
						}
					}
				}
				offset_list: {
					description: [
						"Offset list.",
					]
					type: "list"
					suboptions: {
						access_list: {
							description: [
								"Access list name. Source router.access-list.name.",
							]
							type: "str"
						}
						direction: {
							description: [
								"Offset list direction.",
							]
							type: "str"
							choices: [
								"in",
								"out",
							]
						}
						id: {
							description: [
								"Offset-list ID.",
							]
							required: true
							type:     "int"
						}
						interface: {
							description: [
								"Interface name. Source system.interface.name.",
							]
							type: "str"
						}
						offset: {
							description: [
								"offset",
							]
							type: "int"
						}
						status: {
							description: [
								"status",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
					}
				}
				passive_interface: {
					description: [
						"Passive interface configuration.",
					]
					type: "list"
					suboptions: name: {
						description: [
							"Passive interface name. Source system.interface.name.",
						]
						required: true
						type:     "str"
					}
				}
				recv_buffer_size: {
					description: [
						"Receiving buffer size.",
					]
					type: "int"
				}
				redistribute: {
					description: [
						"Redistribute configuration.",
					]
					type: "list"
					suboptions: {
						metric: {
							description: [
								"Redistribute metric setting.",
							]
							type: "int"
						}
						name: {
							description: [
								"Redistribute name.",
							]
							required: true
							type:     "str"
						}
						routemap: {
							description: [
								"Route map name. Source router.route-map.name.",
							]
							type: "str"
						}
						status: {
							description: [
								"status",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
					}
				}
				timeout_timer: {
					description: [
						"Timeout timer in seconds.",
					]
					type: "int"
				}
				update_timer: {
					description: [
						"Update timer in seconds.",
					]
					type: "int"
				}
				version: {
					description: [
						"RIP version.",
					]
					type: "str"
					choices: [
						1,
						2,
					]
				}
			}
		}
	}
}
