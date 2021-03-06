package ansible

module: cp_mgmt_vpn_community_star: {
	module:            "cp_mgmt_vpn_community_star"
	short_description: "Manages vpn-community-star objects on Check Point over Web Services API"
	description: [
		"Manages vpn-community-star objects on Check Point devices including creating, updating and removing objects.",
		"All operations are performed over Web Services API.",
	]
	version_added: "2.9"
	author:        "Or Soffer (@chkp-orso)"
	options: {
		name: {
			description: [
				"Object name.",
			]
			type:     "str"
			required: true
		}
		center_gateways: {
			description: [
				"Collection of Gateway objects representing center gateways identified by the name or UID.",
			]
			type: "list"
		}
		encryption_method: {
			description: [
				"The encryption method to be used.",
			]
			type: "str"
			choices: ["prefer ikev2 but support ikev1", "ikev2 only", "ikev1 for ipv4 and ikev2 for ipv6 only"]
		}
		encryption_suite: {
			description: [
				"The encryption suite to be used.",
			]
			type: "str"
			choices: ["suite-b-gcm-256", "custom", "vpn b", "vpn a", "suite-b-gcm-128"]
		}
		ike_phase_1: {
			description: [
				"Ike Phase 1 settings. Only applicable when the encryption-suite is set to [custom].",
			]
			type: "dict"
			suboptions: {
				data_integrity: {
					description: [
						"The hash algorithm to be used.",
					]
					type: "str"
					choices: ["aes-xcbc", "sha1", "sha256", "sha384", "md5"]
				}
				diffie_hellman_group: {
					description: [
						"The Diffie-Hellman group to be used.",
					]
					type: "str"
					choices: ["group-1", "group-2", "group-5", "group-14", "group-19", "group-20"]
				}
				encryption_algorithm: {
					description: [
						"The encryption algorithm to be used.",
					]
					type: "str"
					choices: ["cast", "aes-256", "des", "aes-128", "3des"]
				}
			}
		}
		ike_phase_2: {
			description: [
				"Ike Phase 2 settings. Only applicable when the encryption-suite is set to [custom].",
			]
			type: "dict"
			suboptions: {
				data_integrity: {
					description: [
						"The hash algorithm to be used.",
					]
					type: "str"
					choices: ["aes-xcbc", "sha1", "sha256", "sha384", "md5"]
				}
				encryption_algorithm: {
					description: [
						"The encryption algorithm to be used.",
					]
					type: "str"
					choices: ["cast", "aes-gcm-256", "cast-40", "aes-256", "des", "aes-128", "3des", "des-40cp", "aes-gcm-128", "none"]
				}
			}
		}
		mesh_center_gateways: {
			description: [
				"Indicates whether the meshed community is in center.",
			]
			type: "bool"
		}
		satellite_gateways: {
			description: [
				"Collection of Gateway objects representing satellite gateways identified by the name or UID.",
			]
			type: "list"
		}
		shared_secrets: {
			description: [
				"Shared secrets for external gateways.",
			]
			type: "list"
			suboptions: {
				external_gateway: {
					description: [
						"External gateway identified by the name or UID.",
					]
					type: "str"
				}
				shared_secret: {
					description: [
						"Shared secret.",
					]
					type: "str"
				}
			}
		}
		tags: {
			description: [
				"Collection of tag identifiers.",
			]
			type: "list"
		}
		use_shared_secret: {
			description: [
				"Indicates whether the shared secret should be used for all external gateways.",
			]
			type: "bool"
		}
		color: {
			description: [
				"Color of the object. Should be one of existing colors.",
			]
			type: "str"
			choices: [
				"aquamarine",
				"black",
				"blue",
				"crete blue",
				"burlywood",
				"cyan",
				"dark green",
				"khaki",
				"orchid",
				"dark orange",
				"dark sea green",
				"pink",
				"turquoise",
				"dark blue",
				"firebrick",
				"brown",
				"forest green",
				"gold",
				"dark gold",
				"gray",
				"dark gray",
				"light green",
				"lemon chiffon",
				"coral",
				"sea green",
				"sky blue",
				"magenta",
				"purple",
				"slate blue",
				"violet red",
				"navy blue",
				"olive",
				"orange",
				"red",
				"sienna",
				"yellow",
			]
		}
		comments: {
			description: [
				"Comments string.",
			]
			type: "str"
		}
		details_level: {
			description: [
				"The level of detail for some of the fields in the response can vary from showing only the UID value of the object to a fully detailed representation of the object.",
			]

			type: "str"
			choices: ["uid", "standard", "full"]
		}
		ignore_warnings: {
			description: [
				"Apply changes ignoring warnings.",
			]
			type: "bool"
		}
		ignore_errors: {
			description: [
				"Apply changes ignoring errors. You won't be able to publish such a changes. If ignore-warnings flag was omitted - warnings will also be ignored.",
			]
			type: "bool"
		}
	}
	extends_documentation_fragment: "checkpoint_objects"
}
