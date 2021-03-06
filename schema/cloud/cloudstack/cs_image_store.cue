package ansible

module: cs_image_store: {
	module: "cs_image_store"

	short_description: "Manages CloudStack Image Stores."

	version_added: "2.8"

	description: [
		"Deploy, remove, recreate CloudStack Image Stores.",
	]

	options: {
		url: {
			description: [
				"The URL for the Image Store.",
				"Required when I(state=present).",
			]
			type: "str"
		}
		name: {
			description: [
				"The ID of the Image Store. Required when deleting a Image Store.",
			]
			required: true
			type:     "str"
		}
		zone: {
			description: [
				"The Zone name for the Image Store.",
			]
			required: true
			type:     "str"
		}
		state: {
			description: [
				"Stage of the Image Store",
			]
			choices: ["present", "absent"]
			default: "present"
			type:    "str"
		}
		provider: {
			description: [
				"The image store provider name. Required when creating a new Image Store",
			]
			type: "str"
		}
		force_recreate: {
			description: [
				"Set to C(yes) if you're changing an existing Image Store.",
				"This will force the recreation of the Image Store.",
				"Recreation might fail if there are snapshots present on the Image Store. Delete them before running the recreation.",
			]
			type:    "bool"
			default: false
		}
	}

	extends_documentation_fragment: "cloudstack"

	author: ["Patryk Cichy (@PatTheSilent)"]
}
