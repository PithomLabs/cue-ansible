package ansible

module: junos_lag_interfaces: {
	module:            "junos_lag_interfaces"
	version_added:     2.9
	short_description: "Manage Link Aggregation on Juniper JUNOS devices."
	description:       "This module manages properties of Link Aggregation Group on Juniper JUNOS devices."
	author:            "Ganesh Nalawade (@ganeshrn)"
	options: {
		config: {
			description: "A list of link aggregation group configurations."
			type:        "list"
			suboptions: {
				name: {
					description: [
						"Name of the link aggregation group (LAG).",
					]
					type:     "str"
					required: true
				}
				mode: {
					description: [
						"LAG mode. A value of C(passive) will enable LACP in C(passive) mode that is it will respond to LACP packets and C(active) configures the link to initiate transmission of LACP packets.",
					]

					choices: ["active", "passive"]
				}
				link_protection: {
					description: [
						"This boolean option indicates if link protection should be enabled for the LAG interface. If value is C(True) link protection is enabled on LAG and if value is C(False) link protection is disabled.",
					]

					type: "bool"
				}
				members: {
					description: [
						"List of member interfaces of the link aggregation group. The value can be single interface or list of interfaces.",
					]

					type: "list"
					suboptions: {
						member: {
							description: [
								"Name of the member interface.",
							]
							type: "str"
						}
						link_type: {
							description: [
								"The value of this options configures the member link as either C(primary) or C(backup). Value C(primary) configures primary interface for link-protection mode and C(backup) configures backup interface for link-protection mode.",
							]

							choices: ["primary", "backup"]
						}
					}
				}
			}
		}
		state: {
			description: [
				"The state of the configuration after module completion",
			]
			type: "str"
			choices: [
				"merged",
				"replaced",
				"overridden",
				"deleted",
			]
			default: "merged"
		}
	}
	requirements: [
		"ncclient (>=v0.6.4)",
	]
	notes: [
		"This module requires the netconf system service be enabled on the remote device being managed.",
		"Tested against vSRX JUNOS version 18.4R1.",
		"This module works with connection C(netconf). See L(the Junos OS Platform Options,../network/user_guide/platform_junos.html).",
	]
}
