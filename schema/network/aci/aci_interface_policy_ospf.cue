package ansible

module: aci_interface_policy_ospf: {
	module:            "aci_interface_policy_ospf"
	short_description: "Manage OSPF interface policies (ospf:IfPol)"
	description: [
		"Manage OSPF interface policies on Cisco ACI fabrics.",
	]
	version_added: "2.7"
	options: {
		tenant: {
			description: [
				"The name of the Tenant the OSPF interface policy should belong to.",
			]
			type:     "str"
			required: true
			aliases: ["tenant_name"]
		}
		ospf: {
			description: [
				"The OSPF interface policy name.",
				"This name can be between 1 and 64 alphanumeric characters.",
				"Note that you cannot change this name after the object has been saved.",
			]
			type:     "str"
			required: true
			aliases: ["ospf_interface", "name"]
		}
		description: {
			description: [
				"The description for the OSPF interface.",
			]
			type: "str"
			aliases: ["descr"]
		}
		network_type: {
			description: [
				"The OSPF interface policy network type.",
				"OSPF supports broadcast and point-to-point.",
				"The APIC defaults to C(unspecified) when unset during creation.",
			]
			type: "str"
			choices: ["bcast", "p2p"]
		}
		cost: {
			description: [
				"The OSPF cost of the interface.",
				"The cost (also called metric) of an interface in OSPF is an indication of the overhead required to send packets across a certain interface. The cost of an interface is inversely proportional to the bandwidth of that interface. A higher bandwidth indicates a lower cost. There is more overhead (higher cost) and time delays involved in crossing a 56k serial line than crossing a 10M ethernet line. The formula used to calculate the cost is C(cost= 10000 0000/bandwith in bps) For example, it will cost 10 EXP8/10 EXP7 = 10 to cross a 10M Ethernet line and will cost 10 EXP8/1544000 = 64 to cross a T1 line.",
				"By default, the cost of an interface is calculated based on the bandwidth; you can force the cost of an interface with the ip ospf cost value interface subconfiguration mode command.",
				"Accepted values range between C(1) and C(450).",
				"The APIC defaults to C(0) when unset during creation.",
			]
			type: "int"
		}
		controls: {
			description: [
				"The interface policy controls.",
				"This is a list of one or more of the following controls:",
				"C(advert-subnet) -- Advertise IP subnet instead of a host mask in the router LSA.",
				"C(bfd) -- Bidirectional Forwarding Detection",
				"C(mtu-ignore) -- Disables MTU mismatch detection on an interface.",
				"C(passive) -- The interface does not participate in the OSPF protocol and will not establish adjacencies or send routing updates. However the interface is announced as part of the routing network.",
			]

			type: "list"
			choices: ["advert-subnet", "bfd", "mtu-ignore", "passive"]
		}
		dead_interval: {
			description: [
				"The interval between hello packets from a neighbor before the router declares the neighbor as down.",
				"This value must be the same for all networking devices on a specific network.",
				"Specifying a smaller dead interval (seconds) will give faster detection of a neighbor being down and improve convergence, but might cause more routing instability.",
				"Accepted values range between C(1) and C(65535).",
				"The APIC defaults to C(40) when unset during creation.",
			]
			type: "int"
		}
		hello_interval: {
			description: [
				"The interval between hello packets that OSPF sends on the interface.",
				"Note that the smaller the hello interval, the faster topological changes will be detected, but more routing traffic will ensue.",
				"This value must be the same for all routers and access servers on a specific network.",
				"Accepted values range between C(1) and C(65535).",
				"The APIC defaults to C(10) when unset during creation.",
			]
			type: "int"
		}
		prefix_suppression: {
			description: [
				"Whether prefix suppressions is enabled or disabled.",
				"The APIC defaults to C(inherit) when unset during creation.",
			]
			type: "bool"
		}
		priority: {
			description: [
				"The priority for the OSPF interface profile.",
				"Accepted values ranges between C(0) and C(255).",
				"The APIC defaults to C(1) when unset during creation.",
			]
			type: "int"
		}
		retransmit_interval: {
			description: [
				"The interval between LSA retransmissions.",
				"The retransmit interval occurs while the router is waiting for an acknowledgement from the neighbor router that it received the LSA.",
				"If no acknowledgment is received at the end of the interval, then the LSA is resent.",
				"Accepted values range between C(1) and C(65535).",
				"The APIC defaults to C(5) when unset during creation.",
			]
			type: "int"
		}
		transmit_delay: {
			description: [
				"The delay time needed to send an LSA update packet.",
				"OSPF increments the LSA age time by the transmit delay amount before transmitting the LSA update.",
				"You should take into account the transmission and propagation delays for the interface when you set this value.",
				"Accepted values range between C(1) and C(450).",
				"The APIC defaults to C(1) when unset during creation.",
			]
			type: "int"
		}
		state: {
			description: [
				"Use C(present) or C(absent) for adding or removing.",
				"Use C(query) for listing an object or multiple objects.",
			]
			type: "str"
			choices: ["absent", "present", "query"]
			default: "present"
		}
	}
	extends_documentation_fragment: "aci"
	seealso: [{
		name:        "APIC Management Information Model reference"
		description: "More information about the internal APIC class B(ospf:IfPol)."
		link:        "https://developer.cisco.com/docs/apic-mim-ref/"
	}]
	author: ["Dag Wieers (@dagwieers)"]
}
