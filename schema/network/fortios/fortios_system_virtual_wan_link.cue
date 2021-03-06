package ansible

module: fortios_system_virtual_wan_link: {
	module:            "fortios_system_virtual_wan_link"
	short_description: "Configure redundant internet connections using SD-WAN (formerly virtual WAN link) in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify system feature and virtual_wan_link category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
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
		system_virtual_wan_link: {
			description: [
				"Configure redundant internet connections using SD-WAN (formerly virtual WAN link).",
			]
			default: null
			type:    "dict"
			suboptions: {
				fail_alert_interfaces: {
					description: [
						"Physical interfaces that will be alerted.",
					]
					type: "list"
					suboptions: name: {
						description: [
							"Physical interface name. Source system.interface.name.",
						]
						required: true
						type:     "str"
					}
				}
				fail_detect: {
					description: [
						"Enable/disable SD-WAN Internet connection status checking (failure detection).",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				health_check: {
					description: [
						"SD-WAN status checking or health checking. Identify a server on the Internet and determine how SD-WAN verifies that the FortiGate can communicate with it.",
					]

					type: "list"
					suboptions: {
						addr_mode: {
							description: [
								"Address mode (IPv4 or IPv6).",
							]
							type: "str"
							choices: [
								"ipv4",
								"ipv6",
							]
						}
						failtime: {
							description: [
								"Number of failures before server is considered lost (1 - 3600).",
							]
							type: "int"
						}
						http_agent: {
							description: [
								"String in the http-agent field in the HTTP header.",
							]
							type: "str"
						}
						http_get: {
							description: [
								"URL used to communicate with the server if the protocol if the protocol is HTTP.",
							]
							type: "str"
						}
						http_match: {
							description: [
								"Response string expected from the server if the protocol is HTTP.",
							]
							type: "str"
						}
						interval: {
							description: [
								"Status check interval, or the time between attempting to connect to the server (1 - 3600 sec).",
							]
							type: "int"
						}
						members: {
							description: [
								"Member sequence number list.",
							]
							type: "list"
							suboptions: seq_num: {
								description: [
									"Member sequence number. Source system.virtual-wan-link.members.seq-num.",
								]
								type: "int"
							}
						}
						name: {
							description: [
								"Status check or health check name.",
							]
							required: true
							type:     "str"
						}
						packet_size: {
							description: [
								"Packet size of a twamp test session,",
							]
							type: "int"
						}
						password: {
							description: [
								"Twamp controller password in authentication mode",
							]
							type: "str"
						}
						port: {
							description: [
								"Port number used to communicate with the server over the selected protocol.",
							]
							type: "int"
						}
						protocol: {
							description: [
								"Protocol used to determine if the FortiGate can communicate with the server.",
							]
							type: "str"
							choices: [
								"ping",
								"tcp-echo",
								"udp-echo",
								"http",
								"twamp",
								"ping6",
							]
						}
						recoverytime: {
							description: [
								"Number of successful responses received before server is considered recovered (1 - 3600).",
							]
							type: "int"
						}
						security_mode: {
							description: [
								"Twamp controller security mode.",
							]
							type: "str"
							choices: [
								"none",
								"authentication",
							]
						}
						server: {
							description: [
								"IP address or FQDN name of the server.",
							]
							type: "str"
						}
						sla: {
							description: [
								"Service level agreement (SLA).",
							]
							type: "list"
							suboptions: {
								id: {
									description: [
										"SLA ID.",
									]
									required: true
									type:     "int"
								}
								jitter_threshold: {
									description: [
										"Jitter for SLA to make decision in milliseconds. (0 - 10000000).",
									]
									type: "int"
								}
								latency_threshold: {
									description: [
										"Latency for SLA to make decision in milliseconds. (0 - 10000000).",
									]
									type: "int"
								}
								link_cost_factor: {
									description: [
										"Criteria on which to base link selection.",
									]
									type: "str"
									choices: [
										"latency",
										"jitter",
										"packet-loss",
									]
								}
								packetloss_threshold: {
									description: [
										"Packet loss for SLA to make decision in percentage. (0 - 100).",
									]
									type: "int"
								}
							}
						}
						threshold_alert_jitter: {
							description: [
								"Alert threshold for jitter (ms).",
							]
							type: "int"
						}
						threshold_alert_latency: {
							description: [
								"Alert threshold for latency (ms).",
							]
							type: "int"
						}
						threshold_alert_packetloss: {
							description: [
								"Alert threshold for packet loss (percentage).",
							]
							type: "int"
						}
						threshold_warning_jitter: {
							description: [
								"Warning threshold for jitter (ms).",
							]
							type: "int"
						}
						threshold_warning_latency: {
							description: [
								"Warning threshold for latency (ms).",
							]
							type: "int"
						}
						threshold_warning_packetloss: {
							description: [
								"Warning threshold for packet loss (percentage).",
							]
							type: "int"
						}
						update_cascade_interface: {
							description: [
								"Enable/disable update cascade interface.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						update_static_route: {
							description: [
								"Enable/disable updating the static route.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
					}
				}
				load_balance_mode: {
					description: [
						"Algorithm or mode to use for load balancing Internet traffic to SD-WAN members.",
					]
					type: "str"
					choices: [
						"source-ip-based",
						"weight-based",
						"usage-based",
						"source-dest-ip-based",
						"measured-volume-based",
					]
				}
				members: {
					description: [
						"Physical FortiGate interfaces added to the virtual-wan-link.",
					]
					type: "list"
					suboptions: {
						comment: {
							description: [
								"Comments.",
							]
							type: "str"
						}
						gateway: {
							description: [
								"The default gateway for this interface. Usually the default gateway of the Internet service provider that this interface is connected to.",
							]

							type: "str"
						}
						gateway6: {
							description: [
								"IPv6 gateway.",
							]
							type: "str"
						}
						ingress_spillover_threshold: {
							description: [
								"Ingress spillover threshold for this interface (0 - 16776000 kbit/s). When this traffic volume threshold is reached, new sessions spill over to other interfaces in the SD-WAN.",
							]

							type: "int"
						}
						interface: {
							description: [
								"Interface name. Source system.interface.name.",
							]
							type: "str"
						}
						priority: {
							description: [
								"Priority of the interface (0 - 4294967295). Used for SD-WAN rules or priority rules.",
							]
							type: "int"
						}
						seq_num: {
							description: [
								"Sequence number(1-255).",
							]
							type: "int"
						}
						source: {
							description: [
								"Source IP address used in the health-check packet to the server.",
							]
							type: "str"
						}
						source6: {
							description: [
								"Source IPv6 address used in the health-check packet to the server.",
							]
							type: "str"
						}
						spillover_threshold: {
							description: [
								"Egress spillover threshold for this interface (0 - 16776000 kbit/s). When this traffic volume threshold is reached, new sessions spill over to other interfaces in the SD-WAN.",
							]

							type: "int"
						}
						status: {
							description: [
								"Enable/disable this interface in the SD-WAN.",
							]
							type: "str"
							choices: [
								"disable",
								"enable",
							]
						}
						volume_ratio: {
							description: [
								"Measured volume ratio (this value / sum of all values = percentage of link volume, 0 - 255).",
							]
							type: "int"
						}
						weight: {
							description: [
								"Weight of this interface for weighted load balancing. (0 - 255) More traffic is directed to interfaces with higher weights.",
							]
							type: "int"
						}
					}
				}
				service: {
					description: [
						"Create SD-WAN rules or priority rules (also called services) to control how sessions are distributed to physical interfaces in the SD-WAN.",
					]

					type: "list"
					suboptions: {
						addr_mode: {
							description: [
								"Address mode (IPv4 or IPv6).",
							]
							type: "str"
							choices: [
								"ipv4",
								"ipv6",
							]
						}
						bandwidth_weight: {
							description: [
								"Coefficient of reciprocal of available bidirectional bandwidth in the formula of custom-profile-1.",
							]
							type: "int"
						}
						default: {
							description: [
								"Enable/disable use of SD-WAN as default service.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						dscp_forward: {
							description: [
								"Enable/disable forward traffic DSCP tag.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						dscp_forward_tag: {
							description: [
								"Forward traffic DSCP tag.",
							]
							type: "str"
						}
						dscp_reverse: {
							description: [
								"Enable/disable reverse traffic DSCP tag.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						dscp_reverse_tag: {
							description: [
								"Reverse traffic DSCP tag.",
							]
							type: "str"
						}
						dst: {
							description: [
								"Destination address name.",
							]
							type: "list"
							suboptions: name: {
								description: [
									"Address or address group name. Source firewall.address.name firewall.addrgrp.name.",
								]
								required: true
								type:     "str"
							}
						}
						dst_negate: {
							description: [
								"Enable/disable negation of destination address match.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						dst6: {
							description: [
								"Destination address6 name.",
							]
							type: "list"
							suboptions: name: {
								description: [
									"Address6 or address6 group name. Source firewall.address6.name firewall.addrgrp6.name.",
								]
								required: true
								type:     "str"
							}
						}
						end_port: {
							description: [
								"End destination port number.",
							]
							type: "int"
						}
						gateway: {
							description: [
								"Enable/disable SD-WAN service gateway.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						groups: {
							description: [
								"User groups.",
							]
							type: "list"
							suboptions: name: {
								description: [
									"Group name. Source user.group.name.",
								]
								required: true
								type:     "str"
							}
						}
						health_check: {
							description: [
								"Health check. Source system.virtual-wan-link.health-check.name.",
							]
							type: "str"
						}
						hold_down_time: {
							description: [
								"Waiting period in seconds when switching from the back-up member to the primary member (0 - 10000000).",
							]
							type: "int"
						}
						id: {
							description: [
								"Priority rule ID (1 - 4000).",
							]
							required: true
							type:     "int"
						}
						input_device: {
							description: [
								"Source interface name.",
							]
							type: "list"
							suboptions: name: {
								description: [
									"Interface name. Source system.interface.name.",
								]
								required: true
								type:     "str"
							}
						}
						internet_service: {
							description: [
								"Enable/disable use of Internet service for application-based load balancing.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						internet_service_ctrl: {
							description: [
								"Control-based Internet Service ID list.",
							]
							type: "list"
							suboptions: id: {
								description: [
									"Control-based Internet Service ID.",
								]
								required: true
								type:     "int"
							}
						}
						internet_service_ctrl_group: {
							description: [
								"Control-based Internet Service group list.",
							]
							type: "list"
							suboptions: name: {
								description: [
									"Control-based Internet Service group name. Source application.group.name.",
								]
								required: true
								type:     "str"
							}
						}
						internet_service_custom: {
							description: [
								"Custom Internet service name list.",
							]
							type: "list"
							suboptions: name: {
								description: [
									"Custom Internet service name. Source firewall.internet-service-custom.name.",
								]
								required: true
								type:     "str"
							}
						}
						internet_service_custom_group: {
							description: [
								"Custom Internet Service group list.",
							]
							type: "list"
							suboptions: name: {
								description: [
									"Custom Internet Service group name. Source firewall.internet-service-custom-group.name.",
								]
								required: true
								type:     "str"
							}
						}
						internet_service_group: {
							description: [
								"Internet Service group list.",
							]
							type: "list"
							suboptions: name: {
								description: [
									"Internet Service group name. Source firewall.internet-service-group.name.",
								]
								required: true
								type:     "str"
							}
						}
						internet_service_id: {
							description: [
								"Internet service ID list.",
							]
							type: "list"
							suboptions: id: {
								description: [
									"Internet service ID. Source firewall.internet-service.id.",
								]
								required: true
								type:     "int"
							}
						}
						jitter_weight: {
							description: [
								"Coefficient of jitter in the formula of custom-profile-1.",
							]
							type: "int"
						}
						latency_weight: {
							description: [
								"Coefficient of latency in the formula of custom-profile-1.",
							]
							type: "int"
						}
						link_cost_factor: {
							description: [
								"Link cost factor.",
							]
							type: "str"
							choices: [
								"latency",
								"jitter",
								"packet-loss",
								"inbandwidth",
								"outbandwidth",
								"bibandwidth",
								"custom-profile-1",
							]
						}
						link_cost_threshold: {
							description: [
								"Percentage threshold change of link cost values that will result in policy route regeneration (0 - 10000000).",
							]
							type: "int"
						}
						member: {
							description: [
								"Member sequence number.",
							]
							type: "int"
						}
						mode: {
							description: [
								"Control how the priority rule sets the priority of interfaces in the SD-WAN.",
							]
							type: "str"
							choices: [
								"auto",
								"manual",
								"priority",
								"sla",
							]
						}
						name: {
							description: [
								"Priority rule name.",
							]
							type: "str"
						}
						packet_loss_weight: {
							description: [
								"Coefficient of packet-loss in the formula of custom-profile-1.",
							]
							type: "int"
						}
						priority_members: {
							description: [
								"Member sequence number list.",
							]
							type: "list"
							suboptions: seq_num: {
								description: [
									"Member sequence number. Source system.virtual-wan-link.members.seq-num.",
								]
								type: "int"
							}
						}
						protocol: {
							description: [
								"Protocol number.",
							]
							type: "int"
						}
						quality_link: {
							description: [
								"Quality grade.",
							]
							type: "int"
						}
						route_tag: {
							description: [
								"IPv4 route map route-tag.",
							]
							type: "int"
						}
						sla: {
							description: [
								"Service level agreement (SLA).",
							]
							type: "list"
							suboptions: {
								health_check: {
									description: [
										"Virtual WAN Link health-check. Source system.virtual-wan-link.health-check.name.",
									]
									type: "str"
								}
								id: {
									description: [
										"SLA ID.",
									]
									type: "int"
								}
							}
						}
						src: {
							description: [
								"Source address name.",
							]
							type: "list"
							suboptions: name: {
								description: [
									"Address or address group name. Source firewall.address.name firewall.addrgrp.name.",
								]
								required: true
								type:     "str"
							}
						}
						src_negate: {
							description: [
								"Enable/disable negation of source address match.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						src6: {
							description: [
								"Source address6 name.",
							]
							type: "list"
							suboptions: name: {
								description: [
									"Address6 or address6 group name. Source firewall.address6.name firewall.addrgrp6.name.",
								]
								required: true
								type:     "str"
							}
						}
						start_port: {
							description: [
								"Start destination port number.",
							]
							type: "int"
						}
						status: {
							description: [
								"Enable/disable SD-WAN service.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						tos: {
							description: [
								"Type of service bit pattern.",
							]
							type: "str"
						}
						tos_mask: {
							description: [
								"Type of service evaluated bits.",
							]
							type: "str"
						}
						users: {
							description: [
								"User name.",
							]
							type: "list"
							suboptions: name: {
								description: [
									"User name. Source user.local.name.",
								]
								required: true
								type:     "str"
							}
						}
					}
				}
				status: {
					description: [
						"Enable/disable SD-WAN.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
			}
		}
	}
}
