package ansible

module: bigip_asm_dos_application: {
	module:            "bigip_asm_dos_application"
	short_description: "Manage application settings for DOS profile"
	description: [
		"Manages Application settings for ASM/AFM DOS profile.",
	]
	version_added: 2.9
	options: {
		profile: {
			description: [
				"Specifies the name of the profile to manage application settings in.",
			]
			type:     "str"
			required: true
		}
		rtbh_duration: {
			description: [
				"Specifies the duration of the RTBH BGP route advertisement, in seconds.",
				"The accepted range is between 0 and 4294967295 inclusive.",
			]
			type: "int"
		}
		rtbh_enable: {
			description: [
				"Specifies whether to enable Remote Triggered Black Hole C(RTBH) of attacking IPs by advertising BGP routes.",
			]
			type: "bool"
		}
		scrubbing_duration: {
			description: [
				"Specifies the duration of the Traffic Scrubbing BGP route advertisement, in seconds.",
				"The accepted range is between 0 and 4294967295 inclusive.",
			]
			type: "int"
		}
		scrubbing_enable: {
			description: [
				"Specifies whether to enable Traffic Scrubbing during attacks by advertising BGP routes.",
			]
			type: "bool"
		}
		single_page_application: {
			description: [
				"Specifies, when C(yes), that the system supports a Single Page Applications.",
			]
			type: "bool"
		}
		trigger_irule: {
			description: [
				"Specifies, when C(yes), that the system activates an Application DoS iRule event.",
			]
			type: "bool"
		}
		geolocations: {
			description: [
				"Manages the geolocations countries whitelist, blacklist.",
			]
			type: "dict"
			suboptions: {
				whitelist: {
					description: [
						"A list of countries to be put on whitelist, must not have overlapping elements with C(blacklist).",
					]
					type: "list"
				}
				blacklist: {
					description: [
						"A list of countries to be put on blacklist, must not have overlapping elements with C(whitelist).",
					]
					type: "list"
				}
			}
		}
		heavy_urls: {
			description: [
				"Manages Heavy URL protection.",
				"Heavy URLs are a small number of site URLs that might consume considerable server resources per request.",
			]
			type: "dict"
			suboptions: {
				auto_detect: {
					description: [
						"Enables or disables automatic heavy URL detection.",
					]
					type: "bool"
				}
				latency_threshold: {
					description: [
						"Specifies the latency threshold for automatic heavy URL detection.",
						"The accepted range is between 0 and 4294967295 milliseconds inclusive.",
					]
					type: "int"
				}
				exclude: {
					description: [
						"Specifies a list of URLs or wildcards to exclude from the heavy URLs.",
					]
					type: "list"
				}
				include: {
					description: [
						"Configures additional URLs to include in the heavy URLs that were auto detected.",
					]
					type: "list"
					suboptions: {
						url: {
							description: [
								"Specifies the URL to be added to the list of heavy URLs, in addition to the automatically detected ones.",
							]
							type: "str"
						}
						threshold: {
							description: [
								"Specifies the threshold of requests per second, where the URL in question is considered under attack.",
								"The accepted range is between 1 and 4294967295 inclusive, or C(auto).",
							]
							type: "str"
						}
					}
				}
			}
		}
		mobile_detection: {
			description: [
				"Configures detection of mobile applications built with the Anti-Bot Mobile SDK and defines how requests from these mobile application clients are handled.",
			]

			type: "dict"
			suboptions: {
				enabled: {
					description: [
						"When C(yes), requests from mobile applications built with Anti-Bot Mobile SDK will be detected and handled according to the parameters set.",
						"When C(no), these requests will be handled like any other request which may let attacks in, or cause false positives.",
					]

					type: "bool"
				}
				allow_android_rooted_device: {
					description: [
						"When C(yes) device will allow traffic from rooted Android devices.",
					]
					type: "bool"
				}
				allow_any_android_package: {
					description: [
						"When C(yes) allows any application publisher.",
						"A publisher is identified by the certificate used to sign the application.",
					]
					type: "bool"
				}
				allow_any_ios_package: {
					description: [
						"When C(yes) allows any iOS package.",
						"A package name is the unique identifier of the mobile application.",
					]
					type: "bool"
				}
				allow_jailbroken_devices: {
					description: [
						"When C(yes) allows traffic from jailbroken iOS devices.",
					]
					type: "bool"
				}
				allow_emulators: {
					description: [
						"When C(yes) allows traffic from applications run on emulators.",
					]
					type: "bool"
				}
				client_side_challenge_mode: {
					description: [
						"Action to take when a CAPTCHA or Client Side Integrity challenge needs to be presented.",
						"The mobile application user will not see a CAPTCHA challenge and the mobile application will not be presented with the Client Side Integrity challenge. The such options for mobile applications are C(pass) or C(cshui).",
						"When C(pass) the traffic is passed without incident.",
						"When C(cshui) the SDK checks for human interactions with the screen in the last few seconds. If none are detected, the traffic is blocked.",
					]

					type: "str"
					choices: [
						"pass",
						"cshui",
					]
				}
				ios_allowed_package_names: {
					description: [
						"Specifies the names of iOS packages to allow traffic on.",
						"This option has no effect when C(allow_any_ios_package) is set to C(yes).",
					]
					type: "list"
				}
				android_publishers: {
					description: [
						"This option has no effect when C(allow_any_android_package) is set to C(yes).",
						"Specifies the allowed publisher certificates for android applications.",
						"The publisher certificate needs to be installed on the BIG-IP beforehand.",
						"The certificate name located on a different partition than the one specified in C(partition) parameter needs to be provided in C(full_path) format C(/Foo/cert.crt).",
					]

					type: "list"
				}
			}
		}
		partition: {
			description: [
				"Device partition to manage resources on.",
			]
			type:    "str"
			default: "Common"
		}
		state: {
			description: [
				"When C(state) is C(present), ensures that the Application object exists.",
				"When C(state) is C(absent), ensures that the Application object is removed.",
			]
			type: "str"
			choices: [
				"present",
				"absent",
			]
			default: "present"
		}
	}
	notes: [
		"Requires BIG-IP >= 13.1.0",
	]
	extends_documentation_fragment: "f5"
	author: ["Wojciech Wypior (@wojtek0806)"]
}
