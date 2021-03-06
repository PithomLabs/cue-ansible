package ansible

module: netapp_e_host: {
	module:            "netapp_e_host"
	short_description: "NetApp E-Series manage eseries hosts"
	description:       "Create, update, remove hosts on NetApp E-series storage arrays"
	version_added:     "2.2"
	author: [
		"Kevin Hulquest (@hulquest)",
		"Nathan Swartz (@ndswartz)",
	]
	extends_documentation_fragment: [
		"netapp.eseries",
	]
	options: {
		name: {
			description: [
				"If the host doesn't yet exist, the label/name to assign at creation time.",
				"If the hosts already exists, this will be used to uniquely identify the host to make any required changes",
			]
			required: true
			aliases: [
				"label",
			]
		}
		state: {
			description: [
				"Set to absent to remove an existing host",
				"Set to present to modify or create a new host definition",
			]
			choices: [
				"absent",
				"present",
			]
			default:       "present"
			version_added: 2.7
		}
		host_type: {
			description: [
				"This is the type of host to be mapped",
				"Required when C(state=present)",
				"Either one of the following names can be specified, Linux DM-MP, VMWare, Windows, Windows Clustered, or a host type index which can be found in M(netapp_e_facts)",
			]

			type: "str"
			aliases: [
				"host_type_index",
			]
		}
		ports: {
			description: [
				"A list of host ports you wish to associate with the host.",
				"Host ports are uniquely identified by their WWN or IQN. Their assignments to a particular host are uniquely identified by a label and these must be unique.",
			]

			required: false
			suboptions: {
				type: {
					description: [
						"The interface type of the port to define.",
						"Acceptable choices depend on the capabilities of the target hardware/software platform.",
					]
					required: true
					choices: [
						"iscsi",
						"sas",
						"fc",
						"ib",
						"nvmeof",
						"ethernet",
					]
				}
				label: {
					description: [
						"A unique label to assign to this port assignment.",
					]
					required: true
				}
				port: {
					description: [
						"The WWN or IQN of the hostPort to assign to this port definition.",
					]
					required: true
				}
			}
		}
		force_port: {
			description: [
				"Allow ports that are already assigned to be re-assigned to your current host",
			]
			required:      false
			type:          "bool"
			version_added: 2.7
		}
		group: {
			description: [
				"The unique identifier of the host-group you want the host to be a member of; this is used for clustering.",
			]
			required: false
			aliases: [
				"cluster",
			]
		}
		log_path: {
			description: [
				"A local path to a file to be used for debug logging",
			]
			required:      false
			version_added: 2.7
		}
	}
}
