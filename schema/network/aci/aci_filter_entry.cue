package ansible

module: aci_filter_entry: {
	module:            "aci_filter_entry"
	short_description: "Manage filter entries (vz:Entry)"
	description: [
		"Manage filter entries for a filter on Cisco ACI fabrics.",
	]
	version_added: "2.4"
	options: {
		arp_flag: {
			description: [
				"The arp flag to use when the ether_type is arp.",
				"The APIC defaults to C(unspecified) when unset during creation.",
			]
			type: "str"
			choices: ["arp_reply", "arp_request", "unspecified"]
		}
		description: {
			description: [
				"Description for the Filter Entry.",
			]
			type: "str"
			aliases: ["descr"]
		}
		dst_port: {
			description: [
				"Used to set both destination start and end ports to the same value when ip_protocol is tcp or udp.",
				"Accepted values are any valid TCP/UDP port range.",
				"The APIC defaults to C(unspecified) when unset during creation.",
			]
			type: "str"
		}
		dst_port_end: {
			description: [
				"Used to set the destination end port when ip_protocol is tcp or udp.",
				"Accepted values are any valid TCP/UDP port range.",
				"The APIC defaults to C(unspecified) when unset during creation.",
			]
			type: "str"
		}
		dst_port_start: {
			description: [
				"Used to set the destination start port when ip_protocol is tcp or udp.",
				"Accepted values are any valid TCP/UDP port range.",
				"The APIC defaults to C(unspecified) when unset during creation.",
			]
			type: "str"
		}
		entry: {
			description: [
				"Then name of the Filter Entry.",
			]
			type: "str"
			aliases: ["entry_name", "filter_entry", "name"]
		}
		ether_type: {
			description: [
				"The Ethernet type.",
				"The APIC defaults to C(unspecified) when unset during creation.",
			]
			type: "str"
			choices: ["arp", "fcoe", "ip", "mac_security", "mpls_ucast", "trill", "unspecified"]
		}
		filter: {
			description: [
				"The name of Filter that the entry should belong to.",
			]
			type: "str"
			aliases: ["filter_name"]
		}
		icmp_msg_type: {
			description: [
				"ICMPv4 message type; used when ip_protocol is icmp.",
				"The APIC defaults to C(unspecified) when unset during creation.",
			]
			type: "str"
			choices: ["dst_unreachable", "echo", "echo_reply", "src_quench", "time_exceeded", "unspecified"]
		}
		icmp6_msg_type: {
			description: [
				"ICMPv6 message type; used when ip_protocol is icmpv6.",
				"The APIC defaults to C(unspecified) when unset during creation.",
			]
			type: "str"
			choices: ["dst_unreachable", "echo_request", "echo_reply", "neighbor_advertisement", "neighbor_solicitation", "redirect", "time_exceeded", "unspecified"]
		}
		ip_protocol: {
			description: [
				"The IP Protocol type when ether_type is ip.",
				"The APIC defaults to C(unspecified) when unset during creation.",
			]
			type: "str"
			choices: ["eigrp", "egp", "icmp", "icmpv6", "igmp", "igp", "l2tp", "ospfigp", "pim", "tcp", "udp", "unspecified"]
		}
		state: {
			description: [
				"present, absent, query",
			]
			type:    "str"
			default: "present"
			choices: ["absent", "present", "query"]
		}
		stateful: {
			description: [
				"Determines the statefulness of the filter entry.",
			]
			type: "bool"
		}
		tenant: {
			description: [
				"The name of the tenant.",
			]
			type: "str"
			aliases: ["tenant_name"]
		}
	}
	extends_documentation_fragment: "aci"
	notes: [
		"The C(tenant) and C(filter) used must exist before using this module in your playbook. The M(aci_tenant) and M(aci_filter) modules can be used for this.",
	]

	seealso: [{
		module: "aci_tenant"
	}, {
		module: "aci_filter"
	}, {
		name:        "APIC Management Information Model reference"
		description: "More information about the internal APIC class B(vz:Entry)."
		link:        "https://developer.cisco.com/docs/apic-mim-ref/"
	}]
	author: ["Jacob McGill (@jmcgill298)"]
}
