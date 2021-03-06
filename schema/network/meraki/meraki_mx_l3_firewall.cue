package ansible

module: meraki_mx_l3_firewall: {
	module:            "meraki_mx_l3_firewall"
	short_description: "Manage MX appliance layer 3 firewalls in the Meraki cloud"
	version_added:     "2.7"
	description: [
		"Allows for creation, management, and visibility into layer 3 firewalls implemented on Meraki MX firewalls.",
	]
	notes: [
		"Module assumes a complete list of firewall rules are passed as a parameter.",
		"If there is interest in this module allowing manipulation of a single firewall rule, please submit an issue against this module.",
	]
	options: {
		state: {
			description: [
				"Create or modify an organization.",
			]
			choices: ["present", "query"]
			default: "present"
		}
		net_name: description: [
			"Name of network which MX firewall is in.",
		]
		net_id: description: [
			"ID of network which MX firewall is in.",
		]
		rules: {
			description: [
				"List of firewall rules.",
			]
			suboptions: {
				policy: {
					description: [
						"Policy to apply if rule is hit.",
					]
					choices: ["allow", "deny"]
				}
				protocol: {
					description: [
						"Protocol to match against.",
					]
					choices: ["any", "icmp", "tcp", "udp"]
				}
				dest_port: description: [
					"Comma separated list of destination port numbers to match against.",
				]
				dest_cidr: description: [
					"Comma separated list of CIDR notation destination networks.",
				]
				src_port: description: [
					"Comma separated list of source port numbers to match against.",
				]
				src_cidr: description: [
					"Comma separated list of CIDR notation source networks.",
				]
				comment: description: [
					"Optional comment to describe the firewall rule.",
				]
				syslog_enabled: description: [
					"Whether to log hints against the firewall rule.",
					"Only applicable if a syslog server is specified against the network.",
				]
			}
		}

		syslog_default_rule: {
			description: [
				"Whether to log hits against the default firewall rule.",
				"Only applicable if a syslog server is specified against the network.",
				"This is not shown in response from Meraki. Instead, refer to the C(syslog_enabled) value in the default rule.",
			]
			type:    "bool"
			default: false
		}
	}
	author: [
		"Kevin Breit (@kbreit)",
	]
	extends_documentation_fragment: "meraki"
}
