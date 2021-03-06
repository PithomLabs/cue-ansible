package ansible

module: bigip_timer_policy: {
	module:            "bigip_timer_policy"
	short_description: "Manage timer policies on a BIG-IP"
	description: [
		"Manage timer policies on a BIG-IP.",
	]
	version_added: 2.6
	options: {
		name: {
			description: [
				"Specifies the name of the timer policy.",
			]
			type:     "str"
			required: true
		}
		description: {
			description: [
				"Specifies descriptive text that identifies the timer policy.",
			]
			type: "str"
		}
		rules: {
			description: [
				"Rules that you want assigned to the timer policy",
			]
			suboptions: {
				name: {
					description: [
						"The name of the rule.",
					]
					type:     "str"
					required: true
				}
				protocol: {
					description: [
						"Specifies the IP protocol entry for which the timer policy rule is being configured. This could be a layer-4 protocol (such as C(tcp), C(udp) or C(sctp).",
						"Only flows matching the configured protocol will make use of this rule.",
						"When C(all-other) is specified, if there are no specific ip-protocol rules that match the flow, the flow matches all the other ip-protocol rules.",
						"When specifying rules, if this parameter is not specified, the default of C(all-other) will be used.",
					]

					type: "str"
					choices: [
						"all-other",
						"ah",
						"bna",
						"esp",
						"etherip",
						"gre",
						"icmp",
						"ipencap",
						"ipv6",
						"ipv6-auth",
						"ipv6-crypt",
						"ipv6-icmp",
						"isp-ip",
						"mux",
						"ospf",
						"sctp",
						"tcp",
						"udp",
						"udplite",
					]
				}
				destination_ports: {
					description: [
						"The list of destination ports to match the rule on.",
						"Specify a port range by specifying start and end ports separated by a dash (-).",
						"This field is only available if you have selected the C(sctp), C(tcp), or C(udp) protocol.",
					]

					type: "list"
				}
				idle_timeout: {
					description: [
						"Specifies an idle timeout, in seconds, for protocol and port pairs that match the timer policy rule.",
						"When C(infinite), specifies that the protocol and port pairs that match the timer policy rule have no idle timeout.",
						"When specifying rules, if this parameter is not specified, the default of C(unspecified) will be used.",
					]

					type: "str"
				}
			}
			type: "list"
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
				"When C(present), ensures that the resource exists.",
				"When C(absent), ensures the resource is removed.",
			]
			type: "str"
			choices: [
				"present",
				"absent",
			]
			default: "present"
		}
	}
	extends_documentation_fragment: "f5"
	author: ["Tim Rupp (@caphrim007)"]
}
