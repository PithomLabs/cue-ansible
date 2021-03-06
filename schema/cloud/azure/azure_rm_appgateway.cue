package ansible

module: azure_rm_appgateway: {
	module:            "azure_rm_appgateway"
	version_added:     "2.7"
	short_description: "Manage Application Gateway instance"
	description: [
		"Create, update and delete instance of Application Gateway.",
	]

	options: {
		resource_group: {
			description: [
				"The name of the resource group.",
			]
			required: true
		}
		name: {
			description: [
				"The name of the application gateway.",
			]
			required: true
		}
		location: description: [
			"Resource location. If not set, location from the resource group will be used as default.",
		]
		sku: {
			description: [
				"SKU of the application gateway resource.",
			]
			suboptions: {
				name: {
					description: [
						"Name of an application gateway SKU.",
					]
					choices: [
						"standard_small",
						"standard_medium",
						"standard_large",
						"waf_medium",
						"waf_large",
					]
				}
				tier: {
					description: [
						"Tier of an application gateway.",
					]
					choices: [
						"standard",
						"waf",
					]
				}
				capacity: description: [
					"Capacity (instance count) of an application gateway.",
				]
			}
		}
		ssl_policy: {
			description: [
				"SSL policy of the application gateway resource.",
			]
			suboptions: {
				disabled_ssl_protocols: {
					description: [
						"List of SSL protocols to be disabled on application gateway.",
					]
					choices: [
						"tls_v1_0",
						"tls_v1_1",
						"tls_v1_2",
					]
				}
				policy_type: {
					description: [
						"Type of SSL Policy.",
					]
					choices: [
						"predefined",
						"custom",
					]
				}
				policy_name: {
					description: [
						"Name of Ssl C(predefined) policy.",
					]
					choices: [
						"ssl_policy20150501",
						"ssl_policy20170401",
						"ssl_policy20170401_s",
					]
				}
				cipher_suites: {
					description: [
						"List of SSL cipher suites to be enabled in the specified order to application gateway.",
					]
					choices: [
						"tls_ecdhe_rsa_with_aes_256_gcm_sha384",
						"tls_ecdhe_rsa_with_aes_128_gcm_sha256",
						"tls_ecdhe_rsa_with_aes_256_cbc_sha384",
						"tls_ecdhe_rsa_with_aes_128_cbc_sha256",
						"tls_ecdhe_rsa_with_aes_256_cbc_sha",
						"tls_ecdhe_rsa_with_aes_128_cbc_sha",
						"tls_dhe_rsa_with_aes_256_gcm_sha384",
						"tls_dhe_rsa_with_aes_128_gcm_sha256",
						"tls_dhe_rsa_with_aes_256_cbc_sha",
						"tls_dhe_rsa_with_aes_128_cbc_sha",
						"tls_rsa_with_aes_256_gcm_sha384",
						"tls_rsa_with_aes_128_gcm_sha256",
						"tls_rsa_with_aes_256_cbc_sha256",
						"tls_rsa_with_aes_128_cbc_sha256",
						"tls_rsa_with_aes_256_cbc_sha",
						"tls_rsa_with_aes_128_cbc_sha",
						"tls_ecdhe_ecdsa_with_aes_256_gcm_sha384",
						"tls_ecdhe_ecdsa_with_aes_128_gcm_sha256",
						"tls_ecdhe_ecdsa_with_aes_256_cbc_sha384",
						"tls_ecdhe_ecdsa_with_aes_128_cbc_sha256",
						"tls_ecdhe_ecdsa_with_aes_256_cbc_sha",
						"tls_ecdhe_ecdsa_with_aes_128_cbc_sha",
						"tls_dhe_dss_with_aes_256_cbc_sha256",
						"tls_dhe_dss_with_aes_128_cbc_sha256",
						"tls_dhe_dss_with_aes_256_cbc_sha",
						"tls_dhe_dss_with_aes_128_cbc_sha",
						"tls_rsa_with_3des_ede_cbc_sha",
						"tls_dhe_dss_with_3des_ede_cbc_sha",
					]
				}
				min_protocol_version: {
					description: [
						"Minimum version of Ssl protocol to be supported on application gateway.",
					]
					choices: [
						"tls_v1_0",
						"tls_v1_1",
						"tls_v1_2",
					]
				}
			}
		}
		gateway_ip_configurations: {
			description: [
				"List of subnets used by the application gateway.",
			]
			suboptions: {
				subnet: description: [
					"Reference of the subnet resource. A subnet from where application gateway gets its private address.",
				]
				name: description: [
					"Name of the resource that is unique within a resource group. This name can be used to access the resource.",
				]
			}
		}
		authentication_certificates: {
			description: [
				"Authentication certificates of the application gateway resource.",
			]
			suboptions: {
				data: description: [
					"Certificate public data - base64 encoded pfx.",
				]
				name: description: [
					"Name of the resource that is unique within a resource group. This name can be used to access the resource.",
				]
			}
		}
		redirect_configurations: {
			version_added: "2.8"
			description: [
				"Redirect configurations of the application gateway resource.",
			]
			suboptions: {
				redirect_type: {
					description: [
						"Redirection type.",
					]
					choices: [
						"permanent",
						"found",
						"see_other",
						"temporary",
					]
				}
				target_listener: description: [
					"Reference to a listener to redirect the request to.",
				]
				include_path: description: [
					"Include path in the redirected url.",
				]
				include_query_string: description: [
					"Include query string in the redirected url.",
				]
				name: description: [
					"Name of the resource that is unique within a resource group.",
				]
			}
		}
		ssl_certificates: {
			description: [
				"SSL certificates of the application gateway resource.",
			]
			suboptions: {
				data: description: [
					"Base-64 encoded pfx certificate.",
					"Only applicable in PUT Request.",
				]
				password: description: [
					"Password for the pfx file specified in I(data).",
					"Only applicable in PUT request.",
				]
				name: description: [
					"Name of the resource that is unique within a resource group. This name can be used to access the resource.",
				]
			}
		}
		frontend_ip_configurations: {
			description: [
				"Frontend IP addresses of the application gateway resource.",
			]
			suboptions: {
				private_ip_address: description: [
					"PrivateIPAddress of the network interface IP Configuration.",
				]
				private_ip_allocation_method: {
					description: [
						"PrivateIP allocation method.",
					]
					choices: [
						"static",
						"dynamic",
					]
				}
				subnet: description: [
					"Reference of the subnet resource.",
				]
				public_ip_address: description: [
					"Reference of the PublicIP resource.",
				]
				name: description: [
					"Name of the resource that is unique within a resource group. This name can be used to access the resource.",
				]
			}
		}
		frontend_ports: {
			description: [
				"List of frontend ports of the application gateway resource.",
			]
			suboptions: {
				port: description: [
					"Frontend port.",
				]
				name: description: [
					"Name of the resource that is unique within a resource group. This name can be used to access the resource.",
				]
			}
		}
		backend_address_pools: {
			description: [
				"List of backend address pool of the application gateway resource.",
			]
			suboptions: {
				backend_addresses: {
					description: [
						"List of backend addresses.",
					]
					suboptions: {
						fqdn: description: [
							"Fully qualified domain name (FQDN).",
						]
						ip_address: description: [
							"IP address.",
						]
					}
				}
				name: description: [
					"Resource that is unique within a resource group. This name can be used to access the resource.",
				]
			}
		}
		probes: {
			version_added: "2.8"
			description: [
				"Probes available to the application gateway resource.",
			]
			suboptions: {
				name: description: [
					"Name of the I(probe) that is unique within an Application Gateway.",
				]
				protocol: {
					description: [
						"The protocol used for the I(probe).",
					]
					choices: [
						"http",
						"https",
					]
				}
				host: description: [
					"Host name to send the I(probe) to.",
				]
				path: description: [
					"Relative path of I(probe).",
					"Valid path starts from '/'.",
					"Probe is sent to <Protocol>://<host>:<port><path>.",
				]
				timeout: description: [
					"The probe timeout in seconds.",
					"Probe marked as failed if valid response is not received with this timeout period.",
					"Acceptable values are from 1 second to 86400 seconds.",
				]
				interval: description: [
					"The probing interval in seconds.",
					"This is the time interval between two consecutive probes.",
					"Acceptable values are from 1 second to 86400 seconds.",
				]
				unhealthy_threshold: description: [
					"The I(probe) retry count.",
					"Backend server is marked down after consecutive probe failure count reaches UnhealthyThreshold.",
					"Acceptable values are from 1 second to 20.",
				]
			}
		}
		backend_http_settings_collection: {
			description: [
				"Backend http settings of the application gateway resource.",
			]
			suboptions: {
				probe: description: [
					"Probe resource of an application gateway.",
				]
				port: description: [
					"The destination port on the backend.",
				]
				protocol: {
					description: [
						"The protocol used to communicate with the backend.",
					]
					choices: [
						"http",
						"https",
					]
				}
				cookie_based_affinity: {
					description: [
						"Cookie based affinity.",
					]
					choices: [
						"enabled",
						"disabled",
					]
				}
				request_timeout: description: [
					"Request timeout in seconds.",
					"Application Gateway will fail the request if response is not received within RequestTimeout.",
					"Acceptable values are from 1 second to 86400 seconds.",
				]
				authentication_certificates: {
					description: [
						"List of references to application gateway authentication certificates.",
						"Applicable only when C(cookie_based_affinity) is enabled, otherwise quietly ignored.",
					]
					suboptions: id: description: [
						"Resource ID.",
					]
				}
				host_name: description: [
					"Host header to be sent to the backend servers.",
				]
				pick_host_name_from_backend_address: description: [
					"Whether to pick host header should be picked from the host name of the backend server. Default value is false.",
				]
				affinity_cookie_name: description: [
					"Cookie name to use for the affinity cookie.",
				]
				path: description: [
					"Path which should be used as a prefix for all C(http) requests.",
					"Null means no path will be prefixed. Default value is null.",
				]
				name: description: [
					"Name of the resource that is unique within a resource group. This name can be used to access the resource.",
				]
			}
		}
		http_listeners: {
			description: [
				"List of HTTP listeners of the application gateway resource.",
			]
			suboptions: {
				frontend_ip_configuration: description: [
					"Frontend IP configuration resource of an application gateway.",
				]
				frontend_port: description: [
					"Frontend port resource of an application gateway.",
				]
				protocol: {
					description: [
						"Protocol of the C(http) listener.",
					]
					choices: [
						"http",
						"https",
					]
				}
				host_name: description: [
					"Host name of C(http) listener.",
				]
				ssl_certificate: description: [
					"SSL certificate resource of an application gateway.",
				]
				require_server_name_indication: description: [
					"Applicable only if I(protocol) is C(https). Enables SNI for multi-hosting.",
				]
				name: description: [
					"Name of the resource that is unique within a resource group. This name can be used to access the resource.",
				]
			}
		}
		request_routing_rules: {
			description: [
				"List of request routing rules of the application gateway resource.",
			]
			suboptions: {
				rule_type: {
					description: [
						"Rule type.",
					]
					choices: [
						"basic",
						"path_based_routing",
					]
				}
				backend_address_pool: description: [
					"Backend address pool resource of the application gateway.",
				]
				backend_http_settings: description: [
					"Backend C(http) settings resource of the application gateway.",
				]
				http_listener: description: [
					"Http listener resource of the application gateway.",
				]
				name: description: [
					"Name of the resource that is unique within a resource group. This name can be used to access the resource.",
				]
				redirect_configuration: description: [
					"Redirect configuration resource of the application gateway.",
				]
			}
		}
		state: {
			description: [
				"Assert the state of the Public IP. Use C(present) to create or update a and C(absent) to delete.",
			]

			default: "present"
			choices: [
				"absent",
				"present",
			]
		}
	}

	extends_documentation_fragment: [
		"azure",
		"azure_tags",
	]

	author: [
		"Zim Kalinowski (@zikalino)",
	]
}
