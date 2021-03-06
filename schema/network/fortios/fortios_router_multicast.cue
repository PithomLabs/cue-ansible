package ansible

module: fortios_router_multicast: {
	module:            "fortios_router_multicast"
	short_description: "Configure router multicast in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify router feature and multicast category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
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
		router_multicast: {
			description: [
				"Configure router multicast.",
			]
			default: null
			type:    "dict"
			suboptions: {
				interface: {
					description: [
						"PIM interfaces.",
					]
					type: "list"
					suboptions: {
						bfd: {
							description: [
								"Enable/disable Protocol Independent Multicast (PIM) Bidirectional Forwarding Detection (BFD).",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						cisco_exclude_genid: {
							description: [
								"Exclude GenID from hello packets (compatibility with old Cisco IOS).",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						dr_priority: {
							description: [
								"DR election priority.",
							]
							type: "int"
						}
						hello_holdtime: {
							description: [
								"Time before old neighbor information expires (0 - 65535 sec).",
							]
							type: "int"
						}
						hello_interval: {
							description: [
								"Interval between sending PIM hello messages (0 - 65535 sec).",
							]
							type: "int"
						}
						igmp: {
							description: [
								"IGMP configuration options.",
							]
							type: "dict"
							suboptions: {
								access_group: {
									description: [
										"Groups IGMP hosts are allowed to join. Source router.access-list.name.",
									]
									type: "str"
								}
								immediate_leave_group: {
									description: [
										"Groups to drop membership for immediately after receiving IGMPv2 leave. Source router.access-list.name.",
									]
									type: "str"
								}
								last_member_query_count: {
									description: [
										"Number of group specific queries before removing group (2 - 7).",
									]
									type: "int"
								}
								last_member_query_interval: {
									description: [
										"Timeout between IGMPv2 leave and removing group (1 - 65535 msec).",
									]
									type: "int"
								}
								query_interval: {
									description: [
										"Interval between queries to IGMP hosts (1 - 65535 sec).",
									]
									type: "int"
								}
								query_max_response_time: {
									description: [
										"Maximum time to wait for a IGMP query response (1 - 25 sec).",
									]
									type: "int"
								}
								query_timeout: {
									description: [
										"Timeout between queries before becoming querier for network (60 - 900).",
									]
									type: "int"
								}
								router_alert_check: {
									description: [
										"Enable/disable require IGMP packets contain router alert option.",
									]
									type: "str"
									choices: [
										"enable",
										"disable",
									]
								}
								version: {
									description: [
										"Maximum version of IGMP to support.",
									]
									type: "str"
									choices: [
										3,
										2,
										1,
									]
								}
							}
						}
						join_group: {
							description: [
								"Join multicast groups.",
							]
							type: "list"
							suboptions: address: {
								description: [
									"Multicast group IP address.",
								]
								required: true
								type:     "str"
							}
						}
						multicast_flow: {
							description: [
								"Acceptable source for multicast group. Source router.multicast-flow.name.",
							]
							type: "str"
						}
						name: {
							description: [
								"Interface name. Source system.interface.name.",
							]
							required: true
							type:     "str"
						}
						neighbour_filter: {
							description: [
								"Routers acknowledged as neighbor routers. Source router.access-list.name.",
							]
							type: "str"
						}
						passive: {
							description: [
								"Enable/disable listening to IGMP but not participating in PIM.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						pim_mode: {
							description: [
								"PIM operation mode.",
							]
							type: "str"
							choices: [
								"sparse-mode",
								"dense-mode",
							]
						}
						propagation_delay: {
							description: [
								"Delay flooding packets on this interface (100 - 5000 msec).",
							]
							type: "int"
						}
						rp_candidate: {
							description: [
								"Enable/disable compete to become RP in elections.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						rp_candidate_group: {
							description: [
								"Multicast groups managed by this RP. Source router.access-list.name.",
							]
							type: "str"
						}
						rp_candidate_interval: {
							description: [
								"RP candidate advertisement interval (1 - 16383 sec).",
							]
							type: "int"
						}
						rp_candidate_priority: {
							description: [
								"Router's priority as RP.",
							]
							type: "int"
						}
						state_refresh_interval: {
							description: [
								"Interval between sending state-refresh packets (1 - 100 sec).",
							]
							type: "int"
						}
						static_group: {
							description: [
								"Statically set multicast groups to forward out. Source router.multicast-flow.name.",
							]
							type: "str"
						}
						ttl_threshold: {
							description: [
								"Minimum TTL of multicast packets that will be forwarded (applied only to new multicast routes) (1 - 255).",
							]
							type: "int"
						}
					}
				}
				multicast_routing: {
					description: [
						"Enable/disable IP multicast routing.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				pim_sm_global: {
					description: [
						"PIM sparse-mode global settings.",
					]
					type: "dict"
					suboptions: {
						accept_register_list: {
							description: [
								"Sources allowed to register packets with this Rendezvous Point (RP). Source router.access-list.name.",
							]
							type: "str"
						}
						accept_source_list: {
							description: [
								"Sources allowed to send multicast traffic. Source router.access-list.name.",
							]
							type: "str"
						}
						bsr_allow_quick_refresh: {
							description: [
								"Enable/disable accept BSR quick refresh packets from neighbors.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						bsr_candidate: {
							description: [
								"Enable/disable allowing this router to become a bootstrap router (BSR).",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						bsr_hash: {
							description: [
								"BSR hash length (0 - 32).",
							]
							type: "int"
						}
						bsr_interface: {
							description: [
								"Interface to advertise as candidate BSR. Source system.interface.name.",
							]
							type: "str"
						}
						bsr_priority: {
							description: [
								"BSR priority (0 - 255).",
							]
							type: "int"
						}
						cisco_crp_prefix: {
							description: [
								"Enable/disable making candidate RP compatible with old Cisco IOS.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						cisco_ignore_rp_set_priority: {
							description: [
								"Use only hash for RP selection (compatibility with old Cisco IOS).",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						cisco_register_checksum: {
							description: [
								"Checksum entire register packet(for old Cisco IOS compatibility).",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						cisco_register_checksum_group: {
							description: [
								"Cisco register checksum only these groups. Source router.access-list.name.",
							]
							type: "str"
						}
						join_prune_holdtime: {
							description: [
								"Join/prune holdtime (1 - 65535).",
							]
							type: "int"
						}
						message_interval: {
							description: [
								"Period of time between sending periodic PIM join/prune messages in seconds (1 - 65535).",
							]
							type: "int"
						}
						null_register_retries: {
							description: [
								"Maximum retries of null register (1 - 20).",
							]
							type: "int"
						}
						register_rate_limit: {
							description: [
								"Limit of packets/sec per source registered through this RP (0 - 65535).",
							]
							type: "int"
						}
						register_rp_reachability: {
							description: [
								"Enable/disable check RP is reachable before registering packets.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						register_source: {
							description: [
								"Override source address in register packets.",
							]
							type: "str"
							choices: [
								"disable",
								"interface",
								"ip-address",
							]
						}
						register_source_interface: {
							description: [
								"Override with primary interface address. Source system.interface.name.",
							]
							type: "str"
						}
						register_source_ip: {
							description: [
								"Override with local IP address.",
							]
							type: "str"
						}
						register_supression: {
							description: [
								"Period of time to honor register-stop message (1 - 65535 sec).",
							]
							type: "int"
						}
						rp_address: {
							description: [
								"Statically configure RP addresses.",
							]
							type: "list"
							suboptions: {
								group: {
									description: [
										"Groups to use this RP. Source router.access-list.name.",
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
								ip_address: {
									description: [
										"RP router address.",
									]
									type: "str"
								}
							}
						}
						rp_register_keepalive: {
							description: [
								"Timeout for RP receiving data on (S,G) tree (1 - 65535 sec).",
							]
							type: "int"
						}
						spt_threshold: {
							description: [
								"Enable/disable switching to source specific trees.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						spt_threshold_group: {
							description: [
								"Groups allowed to switch to source tree. Source router.access-list.name.",
							]
							type: "str"
						}
						ssm: {
							description: [
								"Enable/disable source specific multicast.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						ssm_range: {
							description: [
								"Groups allowed to source specific multicast. Source router.access-list.name.",
							]
							type: "str"
						}
					}
				}
				route_limit: {
					description: [
						"Maximum number of multicast routes.",
					]
					type: "int"
				}
				route_threshold: {
					description: [
						"Generate warnings when the number of multicast routes exceeds this number, must not be greater than route-limit.",
					]
					type: "int"
				}
			}
		}
	}
}
