package ansible

module: bigip_tunnel: {
	module:            "bigip_tunnel"
	short_description: "Manage tunnels on a BIG-IP"
	description: [
		"Manages tunnels on a BIG-IP. Tunnels are usually based upon a tunnel profile which defines both default arguments and constraints for the tunnel.",
		"Due to this, this module exposes a number of settings that may or may not be related to the type of tunnel you are working with. It is important that you take this into consideration when declaring your tunnel config.",
		"If a specific tunnel does not support the parameter you are considering, the documentation of the parameter will usually make mention of this. Otherwise, when configuring that parameter on the device, the device will notify you.",
	]

	version_added: 2.7
	options: {
		name: {
			description: [
				"Specifies the name of the tunnel.",
			]
			type:     "str"
			required: true
		}
		description: {
			description: [
				"Description of the tunnel.",
			]
			type: "str"
		}
		profile: {
			description: [
				"Specifies the profile to associate with the tunnel for handling traffic.",
				"Depending on your selection, other settings become available or disappear.",
				"This parameter may not be changed after it is set.",
			]
			type: "str"
		}
		key: {
			description: [
				"When applied to a GRE tunnel, this value specifies an optional field in the GRE header, used to authenticate the source of the packet.",
				"When applied to a VXLAN or Geneve tunnel, this value specifies the Virtual Network Identifier (VNI).",
				"When applied to an NVGRE tunnel, this value specifies the Virtual Subnet Identifier (VSID).",
				"When creating a new tunnel, if this parameter is supported by the tunnel profile but not specified, the default value is C(0).",
			]

			type: "int"
		}
		local_address: {
			description: [
				"Specifies the IP address of the local endpoint of the tunnel.",
			]
			type: "str"
		}
		remote_address: {
			description: [
				"Specifies the IP address of the remote endpoint of the tunnel.",
				"For C(dslite), C(fec) (when configuring the FEC tunnel for receiving traffic only), C(v6rd) (configured as a border relay), or C(map), the tunnel must have an unspecified remote address (any).",
			]

			type: "str"
		}
		secondary_address: {
			description: [
				"Specifies a non-floating IP address for the tunnel, to be used with host-initiated traffic.",
			]
			type: "str"
		}
		mtu: {
			description: [
				"Specifies the maximum transmission unit (MTU) of the tunnel.",
				"When creating a new tunnel, if this parameter is supported by the tunnel profile but not specified, the default value is C(0).",
				"The valid range is from C(0) to C(65515).",
			]
			type: "int"
		}
		use_pmtu: {
			description: [
				"Enables or disables the tunnel to use the PMTU (Path MTU) information provided by ICMP NeedFrag error messages.",
				"If C(yes) and the tunnel C(mtu) is set to C(0), the tunnel will use the PMTU information.",
				"If C(yes) and the tunnel C(mtu) is fixed to a non-zero value, the tunnel will use the minimum of PMTU and MTU.",
				"If C(no), the tunnel will use fixed MTU or calculate its MTU using tunnel encapsulation configurations.",
			]

			type: "bool"
		}
		tos: {
			description: [
				"Specifies the Type of Service (TOS) value to insert in the encapsulating header of transmitted packets.",
				"When creating a new tunnel, if this parameter is supported by the tunnel profile but not specified, the default value is C(preserve).",
				"When C(preserve), the system copies the TOS value from the inner header to the outer header.",
				"You may also specify a numeric value. The possible values are from C(0) to C(255).",
			]
			type: "str"
		}
		auto_last_hop: {
			description: [
				"Allows you to configure auto last hop on a per-tunnel basis.",
				"When creating a new tunnel, if this parameter is supported by the tunnel profile but not specified, the default is C(default).",
				"When C(default), means that the system uses the global auto-lasthop setting to send back the request.",
				"When C(enabled), allows the system to send return traffic to the MAC address that transmitted the request, even if the routing table points to a different network or interface. As a result, the system can send return traffic to clients even when there is no matching route.",
			]

			type: "str"
			choices: [
				"default",
				"enabled",
				"disabled",
			]
		}
		traffic_group: {
			description: [
				"Specifies the traffic group to associate with the tunnel.",
				"This value cannot be changed after it is set. This is a limitation of BIG-IP.",
			]
			type: "str"
		}
		mode: {
			description: [
				"Specifies how the tunnel carries traffic.",
				"When creating a new tunnel, if this parameter is supported by the tunnel profile but not specified, the default is C(bidirectional).",
				"When C(bidirectional), specifies that the tunnel carries both inbound and outbound traffic.",
				"When C(inbound), specifies that the tunnel carries only incoming traffic.",
				"When C(outbound), specifies that the tunnel carries only outgoing traffic.",
			]
			type: "str"
			choices: [
				"bidirectional",
				"inbound",
				"outbound",
			]
		}
		transparent: {
			description: [
				"Specifies that the tunnel operates in transparent mode.",
				"When C(yes), you can inspect and manipulate the encapsulated traffic flowing through the BIG-IP system.",
				"A transparent tunnel terminates a tunnel while presenting the illusion that the tunnel transits the device unmodified (that is, the BIG-IP system appears as if it were an intermediate router that simply routes IP traffic through the device).",
			]

			type: "bool"
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
				"When C(present), ensures that the tunnel exists.",
				"When C(absent), ensures the tunnel is removed.",
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
