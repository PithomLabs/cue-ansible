package ansible

module: fortios_firewall_ssh_setting: {
	module:            "fortios_firewall_ssh_setting"
	short_description: "SSH proxy settings in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify firewall_ssh feature and setting category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
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
		firewall_ssh_setting: {
			description: [
				"SSH proxy settings.",
			]
			default: null
			type:    "dict"
			suboptions: {
				caname: {
					description: [
						"CA certificate used by SSH Inspection. Source firewall.ssh.local-ca.name.",
					]
					type: "str"
				}
				host_trusted_checking: {
					description: [
						"Enable/disable host trusted checking.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				hostkey_dsa1024: {
					description: [
						"DSA certificate used by SSH proxy. Source firewall.ssh.local-key.name.",
					]
					type: "str"
				}
				hostkey_ecdsa256: {
					description: [
						"ECDSA nid256 certificate used by SSH proxy. Source firewall.ssh.local-key.name.",
					]
					type: "str"
				}
				hostkey_ecdsa384: {
					description: [
						"ECDSA nid384 certificate used by SSH proxy. Source firewall.ssh.local-key.name.",
					]
					type: "str"
				}
				hostkey_ecdsa521: {
					description: [
						"ECDSA nid384 certificate used by SSH proxy. Source firewall.ssh.local-key.name.",
					]
					type: "str"
				}
				hostkey_ed25519: {
					description: [
						"ED25519 hostkey used by SSH proxy. Source firewall.ssh.local-key.name.",
					]
					type: "str"
				}
				hostkey_rsa2048: {
					description: [
						"RSA certificate used by SSH proxy. Source firewall.ssh.local-key.name.",
					]
					type: "str"
				}
				untrusted_caname: {
					description: [
						"Untrusted CA certificate used by SSH Inspection. Source firewall.ssh.local-ca.name.",
					]
					type: "str"
				}
			}
		}
	}
}
