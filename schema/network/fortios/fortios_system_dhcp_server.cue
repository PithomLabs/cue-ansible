package ansible

module: fortios_system_dhcp_server: {
	module:            "fortios_system_dhcp_server"
	short_description: "Configure DHCP servers in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify system_dhcp feature and server category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
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
		system_dhcp_server: {
			description: [
				"Configure DHCP servers.",
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
				auto_configuration: {
					description: [
						"Enable/disable auto configuration.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				conflicted_ip_timeout: {
					description: [
						"Time in seconds to wait after a conflicted IP address is removed from the DHCP range before it can be reused.",
					]
					type: "int"
				}
				ddns_auth: {
					description: [
						"DDNS authentication mode.",
					]
					type: "str"
					choices: [
						"disable",
						"tsig",
					]
				}
				ddns_key: {
					description: [
						"DDNS update key (base 64 encoding).",
					]
					type: "str"
				}
				ddns_keyname: {
					description: [
						"DDNS update key name.",
					]
					type: "str"
				}
				ddns_server_ip: {
					description: [
						"DDNS server IP.",
					]
					type: "str"
				}
				ddns_ttl: {
					description: [
						"TTL.",
					]
					type: "int"
				}
				ddns_update: {
					description: [
						"Enable/disable DDNS update for DHCP.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				ddns_update_override: {
					description: [
						"Enable/disable DDNS update override for DHCP.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				ddns_zone: {
					description: [
						"Zone of your domain name (ex. DDNS.com).",
					]
					type: "str"
				}
				default_gateway: {
					description: [
						"Default gateway IP address assigned by the DHCP server.",
					]
					type: "str"
				}
				dns_server1: {
					description: [
						"DNS server 1.",
					]
					type: "str"
				}
				dns_server2: {
					description: [
						"DNS server 2.",
					]
					type: "str"
				}
				dns_server3: {
					description: [
						"DNS server 3.",
					]
					type: "str"
				}
				dns_service: {
					description: [
						"Options for assigning DNS servers to DHCP clients.",
					]
					type: "str"
					choices: [
						"local",
						"default",
						"specify",
					]
				}
				domain: {
					description: [
						"Domain name suffix for the IP addresses that the DHCP server assigns to clients.",
					]
					type: "str"
				}
				exclude_range: {
					description: [
						"Exclude one or more ranges of IP addresses from being assigned to clients.",
					]
					type: "list"
					suboptions: {
						end_ip: {
							description: [
								"End of IP range.",
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
						start_ip: {
							description: [
								"Start of IP range.",
							]
							type: "str"
						}
					}
				}
				filename: {
					description: [
						"Name of the boot file on the TFTP server.",
					]
					type: "str"
				}
				forticlient_on_net_status: {
					description: [
						"Enable/disable FortiClient-On-Net service for this DHCP server.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				id: {
					description: [
						"ID.",
					]
					required: true
					type:     "int"
				}
				interface: {
					description: [
						"DHCP server can assign IP configurations to clients connected to this interface. Source system.interface.name.",
					]
					type: "str"
				}
				ip_mode: {
					description: [
						"Method used to assign client IP.",
					]
					type: "str"
					choices: [
						"range",
						"usrgrp",
					]
				}
				ip_range: {
					description: [
						"DHCP IP range configuration.",
					]
					type: "list"
					suboptions: {
						end_ip: {
							description: [
								"End of IP range.",
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
						start_ip: {
							description: [
								"Start of IP range.",
							]
							type: "str"
						}
					}
				}
				ipsec_lease_hold: {
					description: [
						"DHCP over IPsec leases expire this many seconds after tunnel down (0 to disable forced-expiry).",
					]
					type: "int"
				}
				lease_time: {
					description: [
						"Lease time in seconds, 0 means unlimited.",
					]
					type: "int"
				}
				mac_acl_default_action: {
					description: [
						"MAC access control default action (allow or block assigning IP settings).",
					]
					type: "str"
					choices: [
						"assign",
						"block",
					]
				}
				netmask: {
					description: [
						"Netmask assigned by the DHCP server.",
					]
					type: "str"
				}
				next_server: {
					description: [
						"IP address of a server (for example, a TFTP sever) that DHCP clients can download a boot file from.",
					]
					type: "str"
				}
				ntp_server1: {
					description: [
						"NTP server 1.",
					]
					type: "str"
				}
				ntp_server2: {
					description: [
						"NTP server 2.",
					]
					type: "str"
				}
				ntp_server3: {
					description: [
						"NTP server 3.",
					]
					type: "str"
				}
				ntp_service: {
					description: [
						"Options for assigning Network Time Protocol (NTP) servers to DHCP clients.",
					]
					type: "str"
					choices: [
						"local",
						"default",
						"specify",
					]
				}
				options: {
					description: [
						"DHCP options.",
					]
					type: "list"
					suboptions: {
						code: {
							description: [
								"DHCP option code.",
							]
							type: "int"
						}
						id: {
							description: [
								"ID.",
							]
							required: true
							type:     "int"
						}
						ip: {
							description: [
								"DHCP option IPs.",
							]
							type: "str"
						}
						type: {
							description: [
								"DHCP option type.",
							]
							type: "str"
							choices: [
								"hex",
								"string",
								"ip",
								"fqdn",
							]
						}
						value: {
							description: [
								"DHCP option value.",
							]
							type: "str"
						}
					}
				}
				reserved_address: {
					description: [
						"Options for the DHCP server to assign IP settings to specific MAC addresses.",
					]
					type: "list"
					suboptions: {
						action: {
							description: [
								"Options for the DHCP server to configure the client with the reserved MAC address.",
							]
							type: "str"
							choices: [
								"assign",
								"block",
								"reserved",
							]
						}
						description: {
							description: [
								"Description.",
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
						ip: {
							description: [
								"IP address to be reserved for the MAC address.",
							]
							type: "str"
						}
						mac: {
							description: [
								"MAC address of the client that will get the reserved IP address.",
							]
							type: "str"
						}
					}
				}
				server_type: {
					description: [
						"DHCP server can be a normal DHCP server or an IPsec DHCP server.",
					]
					type: "str"
					choices: [
						"regular",
						"ipsec",
					]
				}
				status: {
					description: [
						"Enable/disable this DHCP configuration.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				tftp_server: {
					description: [
						"One or more hostnames or IP addresses of the TFTP servers in quotes separated by spaces.",
					]
					type: "list"
					suboptions: tftp_server: {
						description: [
							"TFTP server.",
						]
						type: "str"
					}
				}
				timezone: {
					description: [
						"Select the time zone to be assigned to DHCP clients.",
					]
					type: "str"
					choices: [
						0o1,
						0o2,
						0o3,
						0o4,
						0o5,
						81,
						0o6,
						0o7,
						08,
						09,
						10,
						11,
						12,
						13,
						74,
						14,
						77,
						15,
						87,
						16,
						17,
						18,
						19,
						20,
						75,
						21,
						22,
						23,
						24,
						80,
						79,
						25,
						26,
						27,
						28,
						78,
						29,
						30,
						31,
						32,
						33,
						34,
						35,
						36,
						37,
						38,
						83,
						84,
						40,
						85,
						41,
						42,
						43,
						39,
						44,
						46,
						47,
						51,
						48,
						45,
						49,
						50,
						52,
						53,
						54,
						55,
						56,
						57,
						58,
						59,
						60,
						62,
						63,
						61,
						64,
						65,
						66,
						67,
						68,
						69,
						70,
						71,
						72,
						0o0,
						82,
						73,
						86,
						76,
					]
				}
				timezone_option: {
					description: [
						"Options for the DHCP server to set the client's time zone.",
					]
					type: "str"
					choices: [
						"disable",
						"default",
						"specify",
					]
				}
				vci_match: {
					description: [
						"Enable/disable vendor class identifier (VCI) matching. When enabled only DHCP requests with a matching VCI are served.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				vci_string: {
					description: [
						"One or more VCI strings in quotes separated by spaces.",
					]
					type: "list"
					suboptions: vci_string: {
						description: [
							"VCI strings.",
						]
						type: "str"
					}
				}
				wifi_ac1: {
					description: [
						"WiFi Access Controller 1 IP address (DHCP option 138, RFC 5417).",
					]
					type: "str"
				}
				wifi_ac2: {
					description: [
						"WiFi Access Controller 2 IP address (DHCP option 138, RFC 5417).",
					]
					type: "str"
				}
				wifi_ac3: {
					description: [
						"WiFi Access Controller 3 IP address (DHCP option 138, RFC 5417).",
					]
					type: "str"
				}
				wins_server1: {
					description: [
						"WINS server 1.",
					]
					type: "str"
				}
				wins_server2: {
					description: [
						"WINS server 2.",
					]
					type: "str"
				}
			}
		}
	}
}
