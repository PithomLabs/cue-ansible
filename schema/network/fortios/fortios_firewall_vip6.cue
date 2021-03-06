package ansible

module: fortios_firewall_vip6: {
	module:            "fortios_firewall_vip6"
	short_description: "Configure virtual IP for IPv6 in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify firewall feature and vip6 category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
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
		firewall_vip6: {
			description: [
				"Configure virtual IP for IPv6.",
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
				arp_reply: {
					description: [
						"Enable to respond to ARP requests for this virtual IP address. Enabled by default.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				color: {
					description: [
						"Color of icon on the GUI.",
					]
					type: "int"
				}
				comment: {
					description: [
						"Comment.",
					]
					type: "str"
				}
				extip: {
					description: [
						"IP address or address range on the external interface that you want to map to an address or address range on the destination network.",
					]
					type: "str"
				}
				extport: {
					description: [
						"Incoming port number range that you want to map to a port number range on the destination network.",
					]
					type: "str"
				}
				http_cookie_age: {
					description: [
						"Time in minutes that client web browsers should keep a cookie. Default is 60 seconds. 0 = no time limit.",
					]
					type: "int"
				}
				http_cookie_domain: {
					description: [
						"Domain that HTTP cookie persistence should apply to.",
					]
					type: "str"
				}
				http_cookie_domain_from_host: {
					description: [
						"Enable/disable use of HTTP cookie domain from host field in HTTP.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				http_cookie_generation: {
					description: [
						"Generation of HTTP cookie to be accepted. Changing invalidates all existing cookies.",
					]
					type: "int"
				}
				http_cookie_path: {
					description: [
						"Limit HTTP cookie persistence to the specified path.",
					]
					type: "str"
				}
				http_cookie_share: {
					description: [
						"Control sharing of cookies across virtual servers. same-ip means a cookie from one virtual server can be used by another. Disable stops cookie sharing.",
					]

					type: "str"
					choices: [
						"disable",
						"same-ip",
					]
				}
				http_ip_header: {
					description: [
						"For HTTP multiplexing, enable to add the original client IP address in the XForwarded-For HTTP header.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				http_ip_header_name: {
					description: [
						"For HTTP multiplexing, enter a custom HTTPS header name. The original client IP address is added to this header. If empty, X-Forwarded-For is used.",
					]

					type: "str"
				}
				http_multiplex: {
					description: [
						"Enable/disable HTTP multiplexing.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				https_cookie_secure: {
					description: [
						"Enable/disable verification that inserted HTTPS cookies are secure.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				id: {
					description: [
						"Custom defined ID.",
					]
					type: "int"
				}
				ldb_method: {
					description: [
						"Method used to distribute sessions to real servers.",
					]
					type: "str"
					choices: [
						"static",
						"round-robin",
						"weighted",
						"least-session",
						"least-rtt",
						"first-alive",
						"http-host",
					]
				}
				mappedip: {
					description: [
						"Mapped IP address range in the format startIP-endIP.",
					]
					type: "str"
				}
				mappedport: {
					description: [
						"Port number range on the destination network to which the external port number range is mapped.",
					]
					type: "str"
				}
				max_embryonic_connections: {
					description: [
						"Maximum number of incomplete connections.",
					]
					type: "int"
				}
				monitor: {
					description: [
						"Name of the health check monitor to use when polling to determine a virtual server's connectivity status.",
					]
					type: "list"
					suboptions: name: {
						description: [
							"Health monitor name. Source firewall.ldb-monitor.name.",
						]
						required: true
						type:     "str"
					}
				}
				name: {
					description: [
						"Virtual ip6 name.",
					]
					required: true
					type:     "str"
				}
				outlook_web_access: {
					description: [
						"Enable to add the Front-End-Https header for Microsoft Outlook Web Access.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				persistence: {
					description: [
						"Configure how to make sure that clients connect to the same server every time they make a request that is part of the same session.",
					]
					type: "str"
					choices: [
						"none",
						"http-cookie",
						"ssl-session-id",
					]
				}
				portforward: {
					description: [
						"Enable port forwarding.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				protocol: {
					description: [
						"Protocol to use when forwarding packets.",
					]
					type: "str"
					choices: [
						"tcp",
						"udp",
						"sctp",
					]
				}
				realservers: {
					description: [
						"Select the real servers that this server load balancing VIP will distribute traffic to.",
					]
					type: "list"
					suboptions: {
						client_ip: {
							description: [
								"Only clients in this IP range can connect to this real server.",
							]
							type: "str"
						}
						healthcheck: {
							description: [
								"Enable to check the responsiveness of the real server before forwarding traffic.",
							]
							type: "str"
							choices: [
								"disable",
								"enable",
								"vip",
							]
						}
						holddown_interval: {
							description: [
								"Time in seconds that the health check monitor continues to monitor an unresponsive server that should be active.",
							]
							type: "int"
						}
						http_host: {
							description: [
								"HTTP server domain name in HTTP header.",
							]
							type: "str"
						}
						id: {
							description: [
								"Real server ID.",
							]
							required: true
							type:     "int"
						}
						ip: {
							description: [
								"IPv6 address of the real server.",
							]
							type: "str"
						}
						max_connections: {
							description: [
								"Max number of active connections that can directed to the real server. When reached, sessions are sent to other real servers.",
							]
							type: "int"
						}
						monitor: {
							description: [
								"Name of the health check monitor to use when polling to determine a virtual server's connectivity status. Source firewall .ldb-monitor.name.",
							]

							type: "str"
						}
						port: {
							description: [
								"Port for communicating with the real server. Required if port forwarding is enabled.",
							]
							type: "int"
						}
						status: {
							description: [
								"Set the status of the real server to active so that it can accept traffic, or on standby or disabled so no traffic is sent.",
							]
							type: "str"
							choices: [
								"active",
								"standby",
								"disable",
							]
						}
						weight: {
							description: [
								"Weight of the real server. If weighted load balancing is enabled, the server with the highest weight gets more connections.",
							]
							type: "int"
						}
					}
				}
				server_type: {
					description: [
						"Protocol to be load balanced by the virtual server (also called the server load balance virtual IP).",
					]
					type: "str"
					choices: [
						"http",
						"https",
						"imaps",
						"pop3s",
						"smtps",
						"ssl",
						"tcp",
						"udp",
						"ip",
					]
				}
				src_filter: {
					description: [
						"Source IP6 filter (x:x:x:x:x:x:x:x/x). Separate addresses with spaces.",
					]
					type: "list"
					suboptions: range: {
						description: [
							"Source-filter range.",
						]
						required: true
						type:     "str"
					}
				}
				ssl_algorithm: {
					description: [
						"Permitted encryption algorithms for SSL sessions according to encryption strength.",
					]
					type: "str"
					choices: [
						"high",
						"medium",
						"low",
						"custom",
					]
				}
				ssl_certificate: {
					description: [
						"The name of the SSL certificate to use for SSL acceleration. Source vpn.certificate.local.name.",
					]
					type: "str"
				}
				ssl_cipher_suites: {
					description: [
						"SSL/TLS cipher suites acceptable from a client, ordered by priority.",
					]
					type: "list"
					suboptions: {
						cipher: {
							description: [
								"Cipher suite name.",
							]
							type: "str"
							choices: [
								"TLS-RSA-WITH-3DES-EDE-CBC-SHA",
								"TLS-DHE-RSA-WITH-DES-CBC-SHA",
								"TLS-DHE-DSS-WITH-DES-CBC-SHA",
							]
						}
						priority: {
							description: [
								"SSL/TLS cipher suites priority.",
							]
							required: true
							type:     "int"
						}
						versions: {
							description: [
								"SSL/TLS versions that the cipher suite can be used with.",
							]
							type: "str"
							choices: [
								"ssl-3.0",
								"tls-1.0",
								"tls-1.1",
								"tls-1.2",
							]
						}
					}
				}
				ssl_client_fallback: {
					description: [
						"Enable/disable support for preventing Downgrade Attacks on client connections (RFC 7507).",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				ssl_client_renegotiation: {
					description: [
						"Allow, deny, or require secure renegotiation of client sessions to comply with RFC 5746.",
					]
					type: "str"
					choices: [
						"allow",
						"deny",
						"secure",
					]
				}
				ssl_client_session_state_max: {
					description: [
						"Maximum number of client to FortiGate SSL session states to keep.",
					]
					type: "int"
				}
				ssl_client_session_state_timeout: {
					description: [
						"Number of minutes to keep client to FortiGate SSL session state.",
					]
					type: "int"
				}
				ssl_client_session_state_type: {
					description: [
						"How to expire SSL sessions for the segment of the SSL connection between the client and the FortiGate.",
					]
					type: "str"
					choices: [
						"disable",
						"time",
						"count",
						"both",
					]
				}
				ssl_dh_bits: {
					description: [
						"Number of bits to use in the Diffie-Hellman exchange for RSA encryption of SSL sessions.",
					]
					type: "str"
					choices: [
						768,
						1024,
						1536,
						2048,
						3072,
						4096,
					]
				}
				ssl_hpkp: {
					description: [
						"Enable/disable including HPKP header in response.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
						"report-only",
					]
				}
				ssl_hpkp_age: {
					description: [
						"Number of minutes the web browser should keep HPKP.",
					]
					type: "int"
				}
				ssl_hpkp_backup: {
					description: [
						"Certificate to generate backup HPKP pin from. Source vpn.certificate.local.name vpn.certificate.ca.name.",
					]
					type: "str"
				}
				ssl_hpkp_include_subdomains: {
					description: [
						"Indicate that HPKP header applies to all subdomains.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				ssl_hpkp_primary: {
					description: [
						"Certificate to generate primary HPKP pin from. Source vpn.certificate.local.name vpn.certificate.ca.name.",
					]
					type: "str"
				}
				ssl_hpkp_report_uri: {
					description: [
						"URL to report HPKP violations to.",
					]
					type: "str"
				}
				ssl_hsts: {
					description: [
						"Enable/disable including HSTS header in response.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				ssl_hsts_age: {
					description: [
						"Number of seconds the client should honour the HSTS setting.",
					]
					type: "int"
				}
				ssl_hsts_include_subdomains: {
					description: [
						"Indicate that HSTS header applies to all subdomains.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				ssl_http_location_conversion: {
					description: [
						"Enable to replace HTTP with HTTPS in the reply's Location HTTP header field.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				ssl_http_match_host: {
					description: [
						"Enable/disable HTTP host matching for location conversion.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				ssl_max_version: {
					description: [
						"Highest SSL/TLS version acceptable from a client.",
					]
					type: "str"
					choices: [
						"ssl-3.0",
						"tls-1.0",
						"tls-1.1",
						"tls-1.2",
					]
				}
				ssl_min_version: {
					description: [
						"Lowest SSL/TLS version acceptable from a client.",
					]
					type: "str"
					choices: [
						"ssl-3.0",
						"tls-1.0",
						"tls-1.1",
						"tls-1.2",
					]
				}
				ssl_mode: {
					description: [
						"Apply SSL offloading between the client and the FortiGate (half) or from the client to the FortiGate and from the FortiGate to the server (full).",
					]

					type: "str"
					choices: [
						"half",
						"full",
					]
				}
				ssl_pfs: {
					description: [
						"Select the cipher suites that can be used for SSL perfect forward secrecy (PFS). Applies to both client and server sessions.",
					]
					type: "str"
					choices: [
						"require",
						"deny",
						"allow",
					]
				}
				ssl_send_empty_frags: {
					description: [
						"Enable/disable sending empty fragments to avoid CBC IV attacks (SSL 3.0 & TLS 1.0 only). May need to be disabled for compatibility with older systems.",
					]

					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				ssl_server_algorithm: {
					description: [
						"Permitted encryption algorithms for the server side of SSL full mode sessions according to encryption strength.",
					]
					type: "str"
					choices: [
						"high",
						"medium",
						"low",
						"custom",
						"client",
					]
				}
				ssl_server_cipher_suites: {
					description: [
						"SSL/TLS cipher suites to offer to a server, ordered by priority.",
					]
					type: "list"
					suboptions: {
						cipher: {
							description: [
								"Cipher suite name.",
							]
							type: "str"
							choices: [
								"TLS-RSA-WITH-3DES-EDE-CBC-SHA",
								"TLS-DHE-RSA-WITH-DES-CBC-SHA",
								"TLS-DHE-DSS-WITH-DES-CBC-SHA",
							]
						}
						priority: {
							description: [
								"SSL/TLS cipher suites priority.",
							]
							required: true
							type:     "int"
						}
						versions: {
							description: [
								"SSL/TLS versions that the cipher suite can be used with.",
							]
							type: "str"
							choices: [
								"ssl-3.0",
								"tls-1.0",
								"tls-1.1",
								"tls-1.2",
							]
						}
					}
				}
				ssl_server_max_version: {
					description: [
						"Highest SSL/TLS version acceptable from a server. Use the client setting by default.",
					]
					type: "str"
					choices: [
						"ssl-3.0",
						"tls-1.0",
						"tls-1.1",
						"tls-1.2",
						"client",
					]
				}
				ssl_server_min_version: {
					description: [
						"Lowest SSL/TLS version acceptable from a server. Use the client setting by default.",
					]
					type: "str"
					choices: [
						"ssl-3.0",
						"tls-1.0",
						"tls-1.1",
						"tls-1.2",
						"client",
					]
				}
				ssl_server_session_state_max: {
					description: [
						"Maximum number of FortiGate to Server SSL session states to keep.",
					]
					type: "int"
				}
				ssl_server_session_state_timeout: {
					description: [
						"Number of minutes to keep FortiGate to Server SSL session state.",
					]
					type: "int"
				}
				ssl_server_session_state_type: {
					description: [
						"How to expire SSL sessions for the segment of the SSL connection between the server and the FortiGate.",
					]
					type: "str"
					choices: [
						"disable",
						"time",
						"count",
						"both",
					]
				}
				type: {
					description: [
						"Configure a static NAT or server load balance VIP.",
					]
					type: "str"
					choices: [
						"static-nat",
						"server-load-balance",
					]
				}
				uuid: {
					description: [
						"Universally Unique Identifier (UUID; automatically assigned but can be manually reset).",
					]
					type: "str"
				}
				weblogic_server: {
					description: [
						"Enable to add an HTTP header to indicate SSL offloading for a WebLogic server.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				websphere_server: {
					description: [
						"Enable to add an HTTP header to indicate SSL offloading for a WebSphere server.",
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
