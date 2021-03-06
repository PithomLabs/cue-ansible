package ansible

module: gce_pd: {
	module:            "gce_pd"
	version_added:     "1.4"
	short_description: "utilize GCE persistent disk resources"
	description: [
		"This module can create and destroy unformatted GCE persistent disks U(https://developers.google.com/compute/docs/disks#persistentdisks). It also supports attaching and detaching disks from running instances. Full install/configuration instructions for the gce* modules can be found in the comments of ansible/test/gce_tests.py.",
	]

	options: {
		detach_only: {
			description: [
				"do not destroy the disk, merely detach it from an instance",
			]
			type:    "bool"
			default: "no"
		}
		instance_name: description: [
			"instance name if you wish to attach or detach the disk",
		]
		mode: {
			description: [
				"GCE mount mode of disk, READ_ONLY (default) or READ_WRITE",
			]
			default: "READ_ONLY"
			choices: ["READ_WRITE", "READ_ONLY"]
		}
		name: {
			description: [
				"name of the disk",
			]
			required: true
		}
		size_gb: {
			description: [
				"whole integer size of disk (in GB) to create, default is 10 GB",
			]
			default: 10
		}
		image: {
			description: [
				"the source image to use for the disk",
			]
			version_added: "1.7"
		}
		snapshot: {
			description: [
				"the source snapshot to use for the disk",
			]
			version_added: "1.7"
		}
		state: {
			description: [
				"desired state of the persistent disk",
			]
			default: "present"
			choices: ["active", "present", "absent", "deleted"]
		}
		zone: {
			description: [
				"zone in which to create the disk",
			]
			default: "us-central1-b"
		}
		service_account_email: {
			version_added: "1.6"
			description: [
				"service account email",
			]
		}
		pem_file: {
			version_added: "1.6"
			description: [
				"path to the pem file associated with the service account email This option is deprecated. Use 'credentials_file'.",
			]
		}

		credentials_file: {
			version_added: "2.1.0"
			description: [
				"path to the JSON file associated with the service account email",
			]
		}
		project_id: {
			version_added: "1.6"
			description: [
				"your GCE project ID",
			]
		}
		disk_type: {
			version_added: "1.9"
			description: [
				"type of disk provisioned",
			]
			default: "pd-standard"
			choices: ["pd-standard", "pd-ssd"]
		}
		delete_on_termination: {
			version_added: "2.3"
			description: [
				"If C(yes), deletes the volume when instance is terminated",
			]
			type:    "bool"
			default: "no"
		}
	}

	requirements: [
		"python >= 2.6",
		"apache-libcloud >= 0.13.3, >= 0.17.0 if using JSON credentials",
	]
	author: "Eric Johnson (@erjohnso) <erjohnso@google.com>"
}
