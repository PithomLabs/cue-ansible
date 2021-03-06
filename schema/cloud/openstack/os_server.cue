package ansible

module: os_server: {
	module:                         "os_server"
	short_description:              "Create/Delete Compute Instances from OpenStack"
	extends_documentation_fragment: "openstack"
	version_added:                  "2.0"
	author:                         "Monty Taylor (@emonty)"
	description: [
		"Create or Remove compute instances from OpenStack.",
	]
	options: {
		name: {
			description: [
				"Name that has to be given to the instance. It is also possible to specify the ID of the instance instead of its name if I(state) is I(absent).",
			]

			required: true
		}
		image: {
			description: [
				"The name or id of the base image to boot.",
			]
			required: true
		}
		image_exclude: description: [
			"Text to use to filter image names, for the case, such as HP, where there are multiple image names matching the common identifying portions. image_exclude is a negative match filter - it is text that may not exist in the image name. Defaults to \"(deprecated)\"",
		]

		flavor: {
			description: [
				"The name or id of the flavor in which the new instance has to be created. Mutually exclusive with flavor_ram",
			]

			default: 1
		}
		flavor_ram: {
			description: [
				"The minimum amount of ram in MB that the flavor in which the new instance has to be created must have. Mutually exclusive with flavor.",
			]

			default: 1
		}
		flavor_include: description: [
			"Text to use to filter flavor names, for the case, such as Rackspace, where there are multiple flavors that have the same ram count. flavor_include is a positive match filter - it must exist in the flavor name.",
		]

		key_name: description: [
			"The key pair name to be used when creating a instance",
		]
		security_groups: description: [
			"Names of the security groups to which the instance should be added. This may be a YAML list or a comma separated string.",
		]

		network: description: [
			"Name or ID of a network to attach this instance to. A simpler version of the nics parameter, only one of network or nics should be supplied.",
		]

		nics: {
			description: [
				"A list of networks to which the instance's interface should be attached. Networks may be referenced by net-id/net-name/port-id or port-name.",
				"Also this accepts a string containing a list of (net/port)-(id/name) Eg: nics: \"net-id=uuid-1,port-name=myport\" Only one of network or nics should be supplied.",
			]

			suboptions: tag: {
				description: [
					"A \"tag\" for the specific port to be passed via metadata. Eg: tag: test_tag",
				]

				version_added: "2.10"
			}
		}
		auto_ip: {
			description: [
				"Ensure instance has public ip however the cloud wants to do that",
			]
			type:    "bool"
			default: "yes"
			aliases: ["auto_floating_ip", "public_ip"]
		}
		floating_ips: description: [
			"list of valid floating IPs that pre-exist to assign to this node",
		]
		floating_ip_pools: description: [
			"Name of floating IP pool from which to choose a floating IP",
		]
		meta: description: [
			"A list of key value pairs that should be provided as a metadata to the new instance or a string containing a list of key-value pairs. Eg:  meta: \"key1=value1,key2=value2\"",
		]

		wait: {
			description: [
				"If the module should wait for the instance to be created.",
			]
			type:    "bool"
			default: "yes"
		}
		timeout: {
			description: [
				"The amount of time the module should wait for the instance to get into active state.",
			]

			default: 180
		}
		config_drive: {
			description: [
				"Whether to boot the server with config drive enabled",
			]
			type:    "bool"
			default: "no"
		}
		userdata: description: [
			"Opaque blob of data which is made available to the instance",
		]
		boot_from_volume: {
			description: [
				"Should the instance boot from a persistent volume created based on the image given. Mutually exclusive with boot_volume.",
			]

			type:    "bool"
			default: "no"
		}
		volume_size: description: [
			"The size of the volume to create in GB if booting from volume based on an image.",
		]

		boot_volume: {
			description: [
				"Volume name or id to use as the volume to boot from. Implies boot_from_volume. Mutually exclusive with image and boot_from_volume.",
			]

			aliases: ["root_volume"]
		}
		terminate_volume: {
			description: [
				"If C(yes), delete volume when deleting instance (if booted from volume)",
			]
			type:    "bool"
			default: "no"
		}
		volumes: {
			description: [
				"A list of preexisting volumes names or ids to attach to the instance",
			]
			default: []
		}
		scheduler_hints: {
			description: [
				"Arbitrary key/value pairs to the scheduler for custom use",
			]
			version_added: "2.1"
		}
		state: {
			description: [
				"Should the resource be present or absent.",
			]
			choices: ["present", "absent"]
			default: "present"
		}
		delete_fip: {
			description: [
				"When I(state) is absent and this option is true, any floating IP associated with the instance will be deleted along with the instance.",
			]

			type:          "bool"
			default:       "no"
			version_added: "2.2"
		}
		reuse_ips: {
			description: [
				"When I(auto_ip) is true and this option is true, the I(auto_ip) code will attempt to re-use unassigned floating ips in the project before creating a new one. It is important to note that it is impossible to safely do this concurrently, so if your use case involves concurrent server creation, it is highly recommended to set this to false and to delete the floating ip associated with a server when the server is deleted using I(delete_fip).",
			]

			type:          "bool"
			default:       "yes"
			version_added: "2.2"
		}
		availability_zone: description: [
			"Availability zone in which to create the server.",
		]
	}
	requirements: [
		"python >= 2.7",
		"openstacksdk",
	]
}
