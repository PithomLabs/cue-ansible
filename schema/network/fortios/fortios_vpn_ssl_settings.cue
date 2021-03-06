package ansible

module: fortios_vpn_ssl_settings: {
	module:            "fortios_vpn_ssl_settings"
	short_description: "Configure SSL VPN in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify vpn_ssl feature and settings category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
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
		vpn_ssl_settings: {
			description: [
				"Configure SSL VPN.",
			]
			default: null
			type:    "dict"
			suboptions: {
				auth_timeout: {
					description: [
						"SSL-VPN authentication timeout (1 - 259200 sec (3 days), 0 for no timeout).",
					]
					type: "int"
				}
				authentication_rule: {
					description: [
						"Authentication rule for SSL VPN.",
					]
					type: "list"
					suboptions: {
						auth: {
							description: [
								"SSL VPN authentication method restriction.",
							]
							type: "str"
							choices: [
								"any",
								"local",
								"radius",
								"tacacs+",
								"ldap",
							]
						}
						cipher: {
							description: [
								"SSL VPN cipher strength.",
							]
							type: "str"
							choices: [
								"any",
								"high",
								"medium",
							]
						}
						client_cert: {
							description: [
								"Enable/disable SSL VPN client certificate restrictive.",
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
						id: {
							description: [
								"ID (0 - 4294967295).",
							]
							required: true
							type:     "int"
						}
						portal: {
							description: [
								"SSL VPN portal. Source vpn.ssl.web.portal.name.",
							]
							type: "str"
						}
						realm: {
							description: [
								"SSL VPN realm. Source vpn.ssl.web.realm.url-path.",
							]
							type: "str"
						}
						source_address: {
							description: [
								"Source address of incoming traffic.",
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
						source_address_negate: {
							description: [
								"Enable/disable negated source address match.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						source_address6: {
							description: [
								"IPv6 source address of incoming traffic.",
							]
							type: "list"
							suboptions: name: {
								description: [
									"IPv6 address name. Source firewall.address6.name firewall.addrgrp6.name.",
								]
								required: true
								type:     "str"
							}
						}
						source_address6_negate: {
							description: [
								"Enable/disable negated source IPv6 address match.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						source_interface: {
							description: [
								"SSL VPN source interface of incoming traffic.",
							]
							type: "list"
							suboptions: name: {
								description: [
									"Interface name. Source system.interface.name system.zone.name.",
								]
								required: true
								type:     "str"
							}
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
				auto_tunnel_static_route: {
					description: [
						"Enable to auto-create static routes for the SSL-VPN tunnel IP addresses.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				banned_cipher: {
					description: [
						"Select one or more cipher technologies that cannot be used in SSL-VPN negotiations.",
					]
					type: "str"
					choices: [
						"RSA",
						"DH",
						"DHE",
						"ECDH",
						"ECDHE",
						"DSS",
						"ECDSA",
						"AES",
						"AESGCM",
						"CAMELLIA",
						"3DES",
						"SHA1",
						"SHA256",
						"SHA384",
						"STATIC",
					]
				}
				check_referer: {
					description: [
						"Enable/disable verification of referer field in HTTP request header.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				default_portal: {
					description: [
						"Default SSL VPN portal. Source vpn.ssl.web.portal.name.",
					]
					type: "str"
				}
				deflate_compression_level: {
					description: [
						"Compression level (0~9).",
					]
					type: "int"
				}
				deflate_min_data_size: {
					description: [
						"Minimum amount of data that triggers compression (200 - 65535 bytes).",
					]
					type: "int"
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
				dns_suffix: {
					description: [
						"DNS suffix used for SSL-VPN clients.",
					]
					type: "str"
				}
				dtls_hello_timeout: {
					description: [
						"SSLVPN maximum DTLS hello timeout (10 - 60 sec).",
					]
					type: "int"
				}
				dtls_tunnel: {
					description: [
						"Enable DTLS to prevent eavesdropping, tampering, or message forgery.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				force_two_factor_auth: {
					description: [
						"Enable to force two-factor authentication for all SSL-VPNs.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				header_x_forwarded_for: {
					description: [
						"Forward the same, add, or remove HTTP header.",
					]
					type: "str"
					choices: [
						"pass",
						"add",
						"remove",
					]
				}
				http_compression: {
					description: [
						"Enable to allow HTTP compression over SSL-VPN tunnels.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				http_only_cookie: {
					description: [
						"Enable/disable SSL-VPN support for HttpOnly cookies.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				http_request_body_timeout: {
					description: [
						"SSL-VPN session is disconnected if an HTTP request body is not received within this time (1 - 60 sec).",
					]
					type: "int"
				}
				http_request_header_timeout: {
					description: [
						"SSL-VPN session is disconnected if an HTTP request header is not received within this time (1 - 60 sec).",
					]
					type: "int"
				}
				https_redirect: {
					description: [
						"Enable/disable redirect of port 80 to SSL-VPN port.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				idle_timeout: {
					description: [
						"SSL VPN disconnects if idle for specified time in seconds.",
					]
					type: "int"
				}
				ipv6_dns_server1: {
					description: [
						"IPv6 DNS server 1.",
					]
					type: "str"
				}
				ipv6_dns_server2: {
					description: [
						"IPv6 DNS server 2.",
					]
					type: "str"
				}
				ipv6_wins_server1: {
					description: [
						"IPv6 WINS server 1.",
					]
					type: "str"
				}
				ipv6_wins_server2: {
					description: [
						"IPv6 WINS server 2.",
					]
					type: "str"
				}
				login_attempt_limit: {
					description: [
						"SSL VPN maximum login attempt times before block (0 - 10).",
					]
					type: "int"
				}
				login_block_time: {
					description: [
						"Time for which a user is blocked from logging in after too many failed login attempts (0 - 86400 sec).",
					]
					type: "int"
				}
				login_timeout: {
					description: [
						"SSLVPN maximum login timeout (10 - 180 sec).",
					]
					type: "int"
				}
				port: {
					description: [
						"SSL-VPN access port (1 - 65535).",
					]
					type: "int"
				}
				port_precedence: {
					description: [
						"Enable means that if SSL-VPN connections are allowed on an interface admin GUI connections are blocked on that interface.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				reqclientcert: {
					description: [
						"Enable to require client certificates for all SSL-VPN users.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				route_source_interface: {
					description: [
						"Enable to allow SSL-VPN sessions to bypass routing and bind to the incoming interface.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				servercert: {
					description: [
						"Name of the server certificate to be used for SSL-VPNs. Source vpn.certificate.local.name.",
					]
					type: "str"
				}
				source_address: {
					description: [
						"Source address of incoming traffic.",
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
				source_address_negate: {
					description: [
						"Enable/disable negated source address match.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				source_address6: {
					description: [
						"IPv6 source address of incoming traffic.",
					]
					type: "list"
					suboptions: name: {
						description: [
							"IPv6 address name. Source firewall.address6.name firewall.addrgrp6.name.",
						]
						required: true
						type:     "str"
					}
				}
				source_address6_negate: {
					description: [
						"Enable/disable negated source IPv6 address match.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				source_interface: {
					description: [
						"SSL VPN source interface of incoming traffic.",
					]
					type: "list"
					suboptions: name: {
						description: [
							"Interface name. Source system.interface.name system.zone.name.",
						]
						required: true
						type:     "str"
					}
				}
				ssl_client_renegotiation: {
					description: [
						"Enable to allow client renegotiation by the server if the tunnel goes down.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				ssl_insert_empty_fragment: {
					description: [
						"Enable/disable insertion of empty fragment.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				tlsv1_0: {
					description: [
						"Enable/disable TLSv1.0.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				tlsv1_1: {
					description: [
						"Enable/disable TLSv1.1.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				tlsv1_2: {
					description: [
						"Enable/disable TLSv1.2.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				tunnel_ip_pools: {
					description: [
						"Names of the IPv4 IP Pool firewall objects that define the IP addresses reserved for remote clients.",
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
				tunnel_ipv6_pools: {
					description: [
						"Names of the IPv6 IP Pool firewall objects that define the IP addresses reserved for remote clients.",
					]
					type: "list"
					suboptions: name: {
						description: [
							"Address name. Source firewall.address6.name firewall.addrgrp6.name.",
						]
						required: true
						type:     "str"
					}
				}
				unsafe_legacy_renegotiation: {
					description: [
						"Enable/disable unsafe legacy re-negotiation.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				url_obscuration: {
					description: [
						"Enable to obscure the host name of the URL of the web browser display.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
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
				x_content_type_options: {
					description: [
						"Add HTTP X-Content-Type-Options header.",
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
