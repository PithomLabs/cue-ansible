package ansible

module: vmware_vspan_session: {
	module:            "vmware_vspan_session"
	short_description: "Create or remove a Port Mirroring session."
	description: [
		"This module can be used to create, delete or edit different kind of port mirroring sessions.",
	]
	version_added: "2.8"
	author: [
		"Peter Gyorgy (@gyorgypeter)",
	]
	notes: [
		"Tested on vSphere 6.7",
	]
	requirements: [
		"python > =  2.6",
		"PyVmomi",
	]
	options: {
		switch: {
			description: [
				"The name of the distributed vSwitch on which to add or remove the mirroring session.",
			]
			required: true
			aliases: ["switch_name"]
			type: "str"
		}
		name: {
			description: [
				"Name of the session.",
			]
			required: true
			type:     "str"
		}
		state: {
			choices: [
				"present",
				"absent",
			]
			description: [
				"Create or remove the session.",
			]
			required: true
			type:     "str"
		}
		session_type: {
			default: "dvPortMirror"
			choices: [
				"encapsulatedRemoteMirrorSource",
				"remoteMirrorDest",
				"remoteMirrorSource",
				"dvPortMirror",
			]
			description: [
				"Select the mirroring type.",
				"- C(encapsulatedRemoteMirrorSource) (str): In encapsulatedRemoteMirrorSource session, Distributed Ports can be used as source entities, and Ip address can be used as destination entities.",
				"- C(remoteMirrorDest) (str): In remoteMirrorDest session, vlan Ids can be used as source entities, and Distributed Ports can be used as destination entities.",
				"- C(remoteMirrorSource) (str): In remoteMirrorSource session, Distributed Ports can be used as source entities, and uplink ports name can be used as destination entities.",
				"- C(dvPortMirror) (str): In dvPortMirror session, Distributed Ports can be used as both source and destination entities.",
			]

			required: false
			type:     "str"
		}
		enabled: {
			type:    "bool"
			default: true
			description: [
				"Whether the session is enabled.",
			]
		}
		description: {
			description: [
				"The description for the session.",
			]
			required: false
			type:     "str"
		}
		source_port_transmitted: {
			description: [
				"Source port for which transmitted packets are mirrored.",
			]
			required: false
			type:     "str"
		}
		source_port_received: {
			description: [
				"Source port for which received packets are mirrored.",
			]
			required: false
			type:     "str"
		}
		destination_port: {
			description: [
				"Destination port that received the mirrored packets. Also any port designated in the value of this property can not match the source port in any of the Distributed Port Mirroring session.",
			]

			required: false
			type:     "str"
		}
		encapsulation_vlan_id: {
			description: [
				"VLAN ID used to encapsulate the mirrored traffic.",
			]
			required: false
			type:     "int"
		}
		strip_original_vlan: {
			description: [
				"Whether to strip the original VLAN tag. if false, the original VLAN tag will be preserved on the mirrored traffic. If encapsulationVlanId has been set and this property is false, the frames will be double tagged with the original VLAN ID as the inner tag.",
			]

			type:     "bool"
			required: false
		}
		mirrored_packet_length: {
			description: [
				"An integer that describes how much of each frame to mirror. If unset, all of the frame would be mirrored. Setting this property to a smaller value is useful when the consumer will look only at the headers. The value cannot be less than 60.",
			]

			required: false
			type:     "int"
		}
		normal_traffic_allowed: {
			description: [
				"Whether or not destination ports can send and receive \"normal\" traffic. Setting this to false will make mirror ports be used solely for mirroring and not double as normal access ports.",
			]

			type:     "bool"
			required: false
		}
		sampling_rate: {
			description: [
				"Sampling rate of the session. If its value is n, one of every n packets is mirrored. Valid values are between 1 to 65535, and default value is 1.",
			]

			type:     "int"
			required: false
		}
		source_vm_transmitted: {
			description: [
				"With this parameter it is possible, to add a NIC of a VM to a port mirroring session.",
				"Valid attributes are:",
				"- C(name) (str): Name of the VM",
				"- C(nic_label) (bool): Label of the Network Interface Card to use.",
			]
			type: "dict"
		}
		source_vm_received: {
			description: [
				"With this parameter it is possible, to add a NIC of a VM to a port mirroring session.",
				"Valid attributes are:",
				"- C(name) (str): Name of the VM",
				"- C(nic_label) (bool): Label of the Network Interface Card to use.",
			]
			type: "dict"
		}
		destination_vm: {
			description: [
				"With this parameter it is possible, to add a NIC of a VM to a port mirroring session.",
				"Valid attributes are:",
				"- C(name) (str): Name of the VM",
				"- C(nic_label) (bool): Label of the Network Interface Card to use.",
			]
			required: false
			type:     "dict"
		}
	}
	extends_documentation_fragment: "vmware.documentation"
}
