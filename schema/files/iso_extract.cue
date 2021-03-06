package ansible

module: iso_extract: {
	author: [
		"Jeroen Hoekx (@jhoekx)",
		"Matt Robinson (@ribbons)",
		"Dag Wieers (@dagwieers)",
	]
	module:            "iso_extract"
	short_description: "Extract files from an ISO image"
	description: [
		"This module has two possible ways of operation.",
		"If 7zip is installed on the system, this module extracts files from an ISO into a temporary directory and copies files to a given destination, if needed.",
		"If the user has mount-capabilities (CAP_SYS_ADMIN on Linux) this module mounts the ISO image to a temporary location, and copies files to a given destination, if needed.",
	]

	version_added: "2.3"
	requirements: [
		"Either 7z (from I(7zip) or I(p7zip) package)",
		"Or mount capabilities (root-access, or CAP_SYS_ADMIN capability on Linux)",
	]
	options: {
		image: {
			description: [
				"The ISO image to extract files from.",
			]
			type:     "path"
			required: true
			aliases: ["path", "src"]
		}
		dest: {
			description: [
				"The destination directory to extract files to.",
			]
			type:     "path"
			required: true
		}
		files: {
			description: [
				"A list of files to extract from the image.",
				"Extracting directories does not work.",
			]
			type:     "list"
			required: true
		}
		force: {
			description: [
				"If C(yes), which will replace the remote file when contents are different than the source.",
				"If C(no), the file will only be extracted and copied if the destination does not already exist.",
				"Alias C(thirsty) has been deprecated and will be removed in 2.13.",
			]
			type:    "bool"
			default: true
			aliases: ["thirsty"]
			version_added: "2.4"
		}
		executable: {
			description: [
				"The path to the C(7z) executable to use for extracting files from the ISO.",
			]
			type:          "path"
			default:       "7z"
			version_added: "2.4"
		}
	}
	notes: [
		"Only the file checksum (content) is taken into account when extracting files from the ISO image. If C(force=no), only checks the presence of the file.",
		"In Ansible 2.3 this module was using C(mount) and C(umount) commands only, requiring root access. This is no longer needed with the introduction of 7zip for extraction.",
	]
}
