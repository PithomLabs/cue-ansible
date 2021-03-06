package ansible

module: ios_bgp: {
	module:            "ios_bgp"
	version_added:     "2.8"
	author:            "Nilashish Chakraborty (@NilashishC)"
	short_description: "Configure global BGP protocol settings on Cisco IOS."
	description: [
		"This module provides configuration management of global BGP parameters on devices running Cisco IOS",
	]

	notes: [
		"Tested against Cisco IOS Version 15.6(3)M2",
	]
	options: {
		config: {
			description: [
				"Specifies the BGP related configuration.",
			]
			suboptions: {
				bgp_as: {
					description: [
						"Specifies the BGP Autonomous System (AS) number to configure on the device.",
					]
					type:     "int"
					required: true
				}
				router_id: {
					description: [
						"Configures the BGP routing process router-id value.",
					]
					default: null
				}
				log_neighbor_changes: {
					description: [
						"Enable/disable logging neighbor up/down and reset reason.",
					]
					type: "bool"
				}
				neighbors: {
					description: [
						"Specifies BGP neighbor related configurations.",
					]
					suboptions: {
						neighbor: {
							description: [
								"Neighbor router address.",
							]
							required: true
						}
						remote_as: {
							description: [
								"Remote AS of the BGP neighbor to configure.",
							]
							type:     "int"
							required: true
						}
						update_source: description: [
							"Source of the routing updates.",
						]
						password: description: [
							"Password to authenticate the BGP peer connection.",
						]
						enabled: {
							description: [
								"Administratively shutdown or enable a neighbor.",
							]
							type: "bool"
						}
						description: description: [
							"Neighbor specific description.",
						]
						ebgp_multihop: {
							description: [
								"Specifies the maximum hop count for EBGP neighbors not on directly connected networks.",
								"The range is from 1 to 255.",
							]
							type: "int"
						}
						peer_group: description: [
							"Name of the peer group that the neighbor is a member of.",
						]
						timers: {
							description: [
								"Specifies BGP neighbor timer related configurations.",
							]
							suboptions: {
								keepalive: {
									description: [
										"Frequency (in seconds) with which the device sends keepalive messages to its peer.",
										"The range is from 0 to 65535.",
									]
									type:     "int"
									required: true
								}
								holdtime: {
									description: [
										"Interval (in seconds) after not receiving a keepalive message that IOS declares a peer dead.",
										"The range is from 0 to 65535.",
									]
									type:     "int"
									required: true
								}
								min_neighbor_holdtime: {
									description: [
										"Interval (in seconds) specifying the minimum acceptable hold-time from a BGP neighbor.",
										"The minimum acceptable hold-time must be less than, or equal to, the interval specified in the holdtime argument.",
										"The range is from 0 to 65535.",
									]
									type: "int"
								}
							}
						}
						local_as: {
							description: [
								"The local AS number for the neighbor.",
							]
							type: "int"
						}
					}
				}
				networks: {
					description: [
						"Specify Networks to announce via BGP.",
						"For operation replace, this option is mutually exclusive with networks option under address_family.",
						"For operation replace, if the device already has an address family activated, this option is not allowed.",
					]
					suboptions: {
						prefix: {
							description: [
								"Network ID to announce via BGP.",
							]
							required: true
						}
						masklen: description: [
							"Subnet mask length for the Network to announce(e.g, 8, 16, 24, etc.).",
						]
						route_map: description: [
							"Route map to modify the attributes.",
						]
					}
				}
				address_family: {
					description: [
						"Specifies BGP address family related configurations.",
					]
					suboptions: {
						afi: {
							description: [
								"Type of address family to configure.",
							]
							choices: [
								"ipv4",
								"ipv6",
							]
							required: true
						}
						safi: {
							description: [
								"Specifies the type of cast for the address family.",
							]
							choices: [
								"flowspec",
								"unicast",
								"multicast",
								"labeled-unicast",
							]
							default: "unicast"
						}
						synchronization: {
							description: [
								"Enable/disable IGP synchronization.",
							]
							type: "bool"
						}
						auto_summary: {
							description: [
								"Enable/disable automatic network number summarization.",
							]
							type: "bool"
						}
						redistribute: {
							description: [
								"Specifies the redistribute information from another routing protocol.",
							]
							suboptions: {
								protocol: {
									description: [
										"Specifies the protocol for configuring redistribute information.",
									]
									choices: ["ospf", "ospfv3", "eigrp", "isis", "static", "connected", "odr", "lisp", "mobile", "rip"]
									required: true
								}
								id: description: [
									"Identifier for the routing protocol for configuring redistribute information.",
									"Valid for protocols 'ospf', 'ospfv3' and 'eigrp'.",
								]
								metric: description: [
									"Specifies the metric for redistributed routes.",
								]
								route_map: description: [
									"Specifies the route map reference.",
								]
							}
						}
						networks: {
							description: [
								"Specify Networks to announce via BGP.",
								"For operation replace, this option is mutually exclusive with root level networks option.",
							]
							suboptions: {
								prefix: {
									description: [
										"Network ID to announce via BGP.",
									]
									required: true
								}
								masklen: description: [
									"Subnet mask length for the Network to announce(e.g, 8, 16, 24, etc.).",
								]
								route_map: description: [
									"Route map to modify the attributes.",
								]
							}
						}
						neighbors: {
							description: [
								"Specifies BGP neighbor related configurations in Address Family configuration mode.",
							]
							suboptions: {
								neighbor: {
									description: [
										"Neighbor router address.",
									]
									required: true
								}
								advertisement_interval: {
									description: [
										"Minimum interval between sending BGP routing updates for this neighbor.",
									]
									type: "int"
								}
								route_reflector_client: {
									description: [
										"Specify a neighbor as a route reflector client.",
									]
									type: "bool"
								}
								route_server_client: {
									description: [
										"Specify a neighbor as a route server client.",
									]
									type: "bool"
								}
								activate: {
									description: [
										"Enable the Address Family for this Neighbor.",
									]
									type: "bool"
								}
								remove_private_as: {
									description: [
										"Remove the private AS number from outbound updates.",
									]
									type: "bool"
								}
								next_hop_self: {
									description: [
										"Enable/disable the next hop calculation for this neighbor.",
									]
									type: "bool"
								}
								next_hop_unchanged: {
									description: [
										"Propagate next hop unchanged for iBGP paths to this neighbor.",
									]
									type: "bool"
								}
								maximum_prefix: {
									description: [
										"Maximum number of prefixes to accept from this peer.",
										"The range is from 1 to 2147483647.",
									]
									type: "int"
								}
							}
						}
					}
				}
			}
		}
		operation: {
			description: [
				"Specifies the operation to be performed on the BGP process configured on the device.",
				"In case of merge, the input configuration will be merged with the existing BGP configuration on the device.",
				"In case of replace, if there is a diff between the existing configuration and the input configuration, the existing configuration will be replaced by the input configuration for every option that has the diff.",
				"In case of override, all the existing BGP configuration will be removed from the device and replaced with the input configuration.",
				"In case of delete the existing BGP configuration will be removed from the device.",
			]
			default: "merge"
			choices: ["merge", "replace", "override", "delete"]
		}
	}
}
