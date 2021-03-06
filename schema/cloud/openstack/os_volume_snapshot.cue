package ansible

module: os_volume_snapshot: {
	module:                         "os_volume_snapshot"
	short_description:              "Create/Delete Cinder Volume Snapshots"
	extends_documentation_fragment: "openstack"
	version_added:                  "2.6"
	author:                         "Mario Santos (@ruizink)"
	description: [
		"Create or Delete cinder block storage volume snapshots",
	]
	options: {
		display_name: {
			description: [
				"Name of the snapshot",
			]
			required: true
			aliases: ["name"]
		}
		display_description: {
			description: [
				"String describing the snapshot",
			]
			aliases: ["description"]
		}
		volume: {
			description: [
				"The volume name or id to create/delete the snapshot",
			]
			required: true
		}
		force: {
			description: [
				"Allows or disallows snapshot of a volume to be created when the volume is attached to an instance.",
			]

			type:    "bool"
			default: "no"
		}
		state: {
			description: [
				"Should the resource be present or absent.",
			]
			choices: ["present", "absent"]
			default: "present"
		}
		availability_zone: description: [
			"Availability zone in which to create the snapshot.",
		]
	}
	requirements: [
		"python >= 2.7",
		"openstacksdk",
	]
}
