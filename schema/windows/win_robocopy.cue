package ansible

module: win_robocopy: {
	module:            "win_robocopy"
	version_added:     "2.2"
	short_description: "Synchronizes the contents of two directories using Robocopy"
	description: [
		"Synchronizes the contents of files/directories from a source to destination.",
		"Under the hood this just calls out to RoboCopy, since that should be available on most modern Windows systems.",
	]

	options: {
		src: {
			description: [
				"Source file/directory to sync.",
			]
			type:     "path"
			required: true
		}
		dest: {
			description: [
				"Destination file/directory to sync (Will receive contents of src).",
			]
			type:     "path"
			required: true
		}
		recurse: {
			description: [
				"Includes all subdirectories (Toggles the C(/e) flag to RoboCopy).",
				"If C(flags) is set, this will be ignored.",
			]
			type:    "bool"
			default: false
		}
		purge: {
			description: [
				"Deletes any files/directories found in the destination that do not exist in the source.",
				"Toggles the C(/purge) flag to RoboCopy.",
				"If C(flags) is set, this will be ignored.",
			]
			type:    "bool"
			default: false
		}
		flags: {
			description: [
				"Directly supply Robocopy flags.",
				"If set, C(purge) and C(recurse) will be ignored.",
			]
			type: "str"
		}
	}
	notes: [
		"This is not a complete port of the M(synchronize) module. Unlike the M(synchronize) module this only performs the sync/copy on the remote machine, not from the master to the remote machine.",
		"This module does not currently support all Robocopy flags.",
	]
	seealso: [{
		module: "synchronize"
	}, {
		module: "win_copy"
	}]
	author: ["Corwin Brown (@blakfeld)"]
}
