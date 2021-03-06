package ansible

module: fortios_wireless_controller_hotspot20_hs_profile: {
	module:            "fortios_wireless_controller_hotspot20_hs_profile"
	short_description: "Configure hotspot profile in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify wireless_controller_hotspot20 feature and hs_profile category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.4",
	]

	version_added: "2.9"
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
			type:    "bool"
			default: true
		}
		state: {
			description: [
				"Indicates whether to create or remove the object.",
			]
			type:     "str"
			required: true
			choices: [
				"present",
				"absent",
			]
		}
		wireless_controller_hotspot20_hs_profile: {
			description: [
				"Configure hotspot profile.",
			]
			default: null
			type:    "dict"
			suboptions: {
				access_network_asra: {
					description: [
						"Enable/disable additional step required for access (ASRA).",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				access_network_esr: {
					description: [
						"Enable/disable emergency services reachable (ESR).",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				access_network_internet: {
					description: [
						"Enable/disable connectivity to the Internet.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				access_network_type: {
					description: [
						"Access network type.",
					]
					type: "str"
					choices: [
						"private-network",
						"private-network-with-guest-access",
						"chargeable-public-network",
						"free-public-network",
						"personal-device-network",
						"emergency-services-only-network",
						"test-or-experimental",
						"wildcard",
					]
				}
				access_network_uesa: {
					description: [
						"Enable/disable unauthenticated emergency service accessible (UESA).",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				anqp_domain_id: {
					description: [
						"ANQP Domain ID (0-65535).",
					]
					type: "int"
				}
				bss_transition: {
					description: [
						"Enable/disable basic service set (BSS) transition Support.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				conn_cap: {
					description: [
						"Connection capability name. Source wireless-controller.hotspot20.h2qp-conn-capability.name.",
					]
					type: "str"
				}
				deauth_request_timeout: {
					description: [
						"Deauthentication request timeout (in seconds).",
					]
					type: "int"
				}
				dgaf: {
					description: [
						"Enable/disable downstream group-addressed forwarding (DGAF).",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				domain_name: {
					description: [
						"Domain name.",
					]
					type: "str"
				}
				gas_comeback_delay: {
					description: [
						"GAS comeback delay (0 or 100 - 4000 milliseconds).",
					]
					type: "int"
				}
				gas_fragmentation_limit: {
					description: [
						"GAS fragmentation limit (512 - 4096).",
					]
					type: "int"
				}
				hessid: {
					description: [
						"Homogeneous extended service set identifier (HESSID).",
					]
					type: "str"
				}
				ip_addr_type: {
					description: [
						"IP address type name. Source wireless-controller.hotspot20.anqp-ip-address-type.name.",
					]
					type: "str"
				}
				l2tif: {
					description: [
						"Enable/disable Layer 2 traffic inspection and filtering.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				nai_realm: {
					description: [
						"NAI realm list name. Source wireless-controller.hotspot20.anqp-nai-realm.name.",
					]
					type: "str"
				}
				name: {
					description: [
						"Hotspot profile name.",
					]
					required: true
					type:     "str"
				}
				network_auth: {
					description: [
						"Network authentication name. Source wireless-controller.hotspot20.anqp-network-auth-type.name.",
					]
					type: "str"
				}
				oper_friendly_name: {
					description: [
						"Operator friendly name. Source wireless-controller.hotspot20.h2qp-operator-name.name.",
					]
					type: "str"
				}
				osu_provider: {
					description: [
						"Manually selected list of OSU provider(s).",
					]
					type: "list"
					suboptions: name: {
						description: [
							"OSU provider name. Source wireless-controller.hotspot20.h2qp-osu-provider.name.",
						]
						required: true
						type:     "str"
					}
				}
				osu_ssid: {
					description: [
						"Online sign up (OSU) SSID.",
					]
					type: "str"
				}
				pame_bi: {
					description: [
						"Enable/disable Pre-Association Message Exchange BSSID Independent (PAME-BI).",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				proxy_arp: {
					description: [
						"Enable/disable Proxy ARP.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				qos_map: {
					description: [
						"QoS MAP set ID. Source wireless-controller.hotspot20.qos-map.name.",
					]
					type: "str"
				}
				roaming_consortium: {
					description: [
						"Roaming consortium list name. Source wireless-controller.hotspot20.anqp-roaming-consortium.name.",
					]
					type: "str"
				}
				venue_group: {
					description: [
						"Venue group.",
					]
					type: "str"
					choices: [
						"unspecified",
						"assembly",
						"business",
						"educational",
						"factory",
						"institutional",
						"mercantile",
						"residential",
						"storage",
						"utility",
						"vehicular",
						"outdoor",
					]
				}
				venue_name: {
					description: [
						"Venue name. Source wireless-controller.hotspot20.anqp-venue-name.name.",
					]
					type: "str"
				}
				venue_type: {
					description: [
						"Venue type.",
					]
					type: "str"
					choices: [
						"unspecified",
						"arena",
						"stadium",
						"passenger-terminal",
						"amphitheater",
						"amusement-park",
						"place-of-worship",
						"convention-center",
						"library",
						"museum",
						"restaurant",
						"theater",
						"bar",
						"coffee-shop",
						"zoo-or-aquarium",
						"emergency-center",
						"doctor-office",
						"bank",
						"fire-station",
						"police-station",
						"post-office",
						"professional-office",
						"research-facility",
						"attorney-office",
						"primary-school",
						"secondary-school",
						"university-or-college",
						"factory",
						"hospital",
						"long-term-care-facility",
						"rehab-center",
						"group-home",
						"prison-or-jail",
						"retail-store",
						"grocery-market",
						"auto-service-station",
						"shopping-mall",
						"gas-station",
						"private",
						"hotel-or-motel",
						"dormitory",
						"boarding-house",
						"automobile",
						"airplane",
						"bus",
						"ferry",
						"ship-or-boat",
						"train",
						"motor-bike",
						"muni-mesh-network",
						"city-park",
						"rest-area",
						"traffic-control",
						"bus-stop",
						"kiosk",
					]
				}
				wan_metrics: {
					description: [
						"WAN metric name. Source wireless-controller.hotspot20.h2qp-wan-metric.name.",
					]
					type: "str"
				}
				wnm_sleep_mode: {
					description: [
						"Enable/disable wireless network management (WNM) sleep mode.",
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
