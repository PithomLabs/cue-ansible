package ansible

module: bigip_pool_member: {
	module:            "bigip_pool_member"
	short_description: "Manages F5 BIG-IP LTM pool members"
	description: [
		"Manages F5 BIG-IP LTM pool members via iControl SOAP API.",
	]
	version_added: 1.4
	options: {
		name: {
			description: [
				"Name of the node to create, or re-use, when creating a new pool member.",
				"This parameter is optional and, if not specified, a node name will be created automatically from either the specified C(address) or C(fqdn).",
				"The C(enabled) state is an alias of C(present).",
			]
			type:          "str"
			version_added: 2.6
		}
		state: {
			description: [
				"Pool member state.",
			]
			type:     "str"
			required: true
			choices: [
				"present",
				"absent",
				"enabled",
				"disabled",
				"forced_offline",
			]
			default: "present"
		}
		pool: {
			description: [
				"Pool name. This pool must exist.",
			]
			type:     "str"
			required: true
		}
		partition: {
			description: [
				"Partition to manage resources on.",
			]
			type:    "str"
			default: "Common"
		}
		address: {
			description: [
				"IP address of the pool member. This can be either IPv4 or IPv6. When creating a new pool member, one of either C(address) or C(fqdn) must be provided. This parameter cannot be updated after it is set.",
			]

			type: "str"
			aliases: [
				"ip",
				"host",
			]
			version_added: 2.2
		}
		fqdn: {
			description: [
				"FQDN name of the pool member. This can be any name that is a valid RFC 1123 DNS name. Therefore, the only characters that can be used are \"A\" to \"Z\", \"a\" to \"z\", \"0\" to \"9\", the hyphen (\"-\") and the period (\".\").",
				"FQDN names must include at lease one period; delineating the host from the domain. ex. C(host.domain).",
				"FQDN names must end with a letter or a number.",
				"When creating a new pool member, one of either C(address) or C(fqdn) must be provided. This parameter cannot be updated after it is set.",
			]

			type: "str"
			aliases: [
				"hostname",
			]
			version_added: 2.6
		}
		port: {
			description: [
				"Pool member port.",
				"This value cannot be changed after it has been set.",
			]
			type:     "int"
			required: true
		}
		connection_limit: {
			description: [
				"Pool member connection limit. Setting this to 0 disables the limit.",
			]
			type: "int"
		}
		description: {
			description: [
				"Pool member description.",
			]
			type: "str"
		}
		rate_limit: {
			description: [
				"Pool member rate limit (connections-per-second). Setting this to 0 disables the limit.",
			]

			type: "int"
		}
		ratio: {
			description: [
				"Pool member ratio weight. Valid values range from 1 through 100. New pool members -- unless overridden with this value -- default to 1.",
			]

			type: "int"
		}
		preserve_node: {
			description: [
				"When state is C(absent) attempts to remove the node that the pool member references.",
				"The node will not be removed if it is still referenced by other pool members. If this happens, the module will not raise an error.",
				"Setting this to C(yes) disables this behavior.",
			]
			type:          "bool"
			version_added: 2.1
		}
		priority_group: {
			description: [
				"Specifies a number representing the priority group for the pool member.",
				"When adding a new member, the default is 0, meaning that the member has no priority.",
				"To specify a priority, you must activate priority group usage when you create a new pool or when adding or removing pool members. When activated, the system load balances traffic according to the priority group number assigned to the pool member.",
				"The higher the number, the higher the priority, so a member with a priority of 3 has higher priority than a member with a priority of 1.",
			]

			type:          "int"
			version_added: 2.5
		}
		fqdn_auto_populate: {
			description: [
				"Specifies whether the system automatically creates ephemeral nodes using the IP addresses returned by the resolution of a DNS query for a node defined by an FQDN.",
				"When C(yes), the system generates an ephemeral node for each IP address returned in response to a DNS query for the FQDN of the node. Additionally, when a DNS response indicates the IP address of an ephemeral node no longer exists, the system deletes the ephemeral node.",
				"When C(no), the system resolves a DNS query for the FQDN of the node with the single IP address associated with the FQDN.",
				"When creating a new pool member, the default for this parameter is C(yes).",
				"Once set this parameter cannot be changed afterwards.",
				"This parameter is ignored when C(reuse_nodes) is C(yes).",
			]
			type:          "bool"
			version_added: 2.6
		}
		reuse_nodes: {
			description: [
				"Reuses node definitions if requested.",
			]
			type:          "bool"
			default:       true
			version_added: 2.6
		}
		monitors: {
			description: [
				"Specifies the health monitors that the system currently uses to monitor this resource.",
			]

			type:          "list"
			version_added: 2.8
		}
		availability_requirements: {
			description: [
				"Specifies, if you activate more than one health monitor, the number of health monitors that must receive successful responses in order for the link to be considered available.",
				"Specifying an empty string will remove the monitors and revert to inheriting from pool (default).",
				"Specifying C(none) value will remove any health monitoring from the member completely.",
			]
			suboptions: {
				type: {
					description: [
						"Monitor rule type when C(monitors) is specified.",
						"When creating a new pool, if this value is not specified, the default of 'all' will be used.",
					]

					type: "str"
					choices: [
						"all",
						"at_least",
					]
				}
				at_least: {
					description: [
						"Specifies the minimum number of active health monitors that must be successful before the link is considered up.",
						"This parameter is only relevant when a C(type) of C(at_least) is used.",
						"This parameter will be ignored if a type of C(all) is used.",
					]
					type: "int"
				}
			}
			type:          "dict"
			version_added: 2.8
		}
		ip_encapsulation: {
			description: [
				"Specifies the IP encapsulation using either IPIP (IP encapsulation within IP, RFC 2003) or GRE (Generic Router Encapsulation, RFC 2784) on outbound packets (from BIG-IP system to server-pool member).",
				"When C(none), disables IP encapsulation.",
				"When C(inherit), inherits IP encapsulation setting from the member's pool.",
				"When any other value, Options are None, Inherit from Pool, and Member Specific.",
			]
			type:          "str"
			version_added: 2.8
		}
		aggregate: {
			description: [
				"List of pool member definitions to be created, modified or removed.",
				"When using C(aggregates) if one of the aggregate definitions is invalid, the aggregate run will fail, indicating the error it last encountered.",
				"The module will C(NOT) rollback any changes it has made prior to encountering the error.",
				"The module also will not indicate what changes were made prior to failure, therefore it is strongly advised to run the module in check mode to make basic validation, prior to module execution.",
			]

			type: "list"
			aliases: [
				"members",
			]
			version_added: 2.8
		}
		replace_all_with: {
			description: [
				"Remove members not defined in the C(aggregate) parameter.",
				"This operation is all or none, meaning that it will stop if there are some pool members that cannot be removed.",
			]

			type:    "bool"
			default: false
			aliases: [
				"purge",
			]
			version_added: 2.8
		}
	}
	notes: [
		"In previous versions of this module, which used the SDK, the C(name) parameter would act as C(fqdn) if C(address) or C(fqdn) were not provided.",
	]

	extends_documentation_fragment: "f5"
	author: [
		"Tim Rupp (@caphrim007)",
		"Wojciech Wypior (@wojtek0806)",
	]
}
