package ansible

module: bigip_device_group_member: {
	module:            "bigip_device_group_member"
	short_description: "Manages members in a device group"
	description: [
		"Manages members in a device group. Members in a device group can only be added or removed, never updated. This is because the members are identified by unique name values and changing that name would invalidate the uniqueness.",
	]

	version_added: 2.5
	options: {
		name: {
			description: [
				"Specifies the name of the device that you want to add to the device group. Often this will be the hostname of the device. This member must be trusted by the device already. Trusting can be done with the C(bigip_device_trust) module and the C(peer_hostname) option to that module.",
			]

			type:     "str"
			required: true
		}
		device_group: {
			description: [
				"The device group that you want to add the member to.",
			]
			type:     "str"
			required: true
		}
		state: {
			description: [
				"When C(present), ensures that the device group member exists.",
				"When C(absent), ensures the device group member is removed.",
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
	author: [
		"Tim Rupp (@caphrim007)",
		"Wojciech Wypior (@wojtek0806)",
	]
}
