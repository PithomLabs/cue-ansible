package ansible

module: win_share: {
	module:            "win_share"
	version_added:     "2.1"
	short_description: "Manage Windows shares"
	description: [
		"Add, modify or remove Windows share and set share permissions.",
	]
	requirements: [
		"As this module used newer cmdlets like New-SmbShare this can only run on Windows 8 / Windows 2012 or newer.",
		"This is due to the reliance on the WMI provider MSFT_SmbShare U(https://msdn.microsoft.com/en-us/library/hh830471) which was only added with these Windows releases.",
	]

	options: {
		name: {
			description: [
				"Share name.",
			]
			type:     "str"
			required: true
		}
		path: {
			description: [
				"Share directory.",
			]
			type:     "path"
			required: true
		}
		state: {
			description: [
				"Specify whether to add C(present) or remove C(absent) the specified share.",
			]
			type: "str"
			choices: ["absent", "present"]
			default: "present"
		}
		description: {
			description: [
				"Share description.",
			]
			type: "str"
		}
		list: {
			description: [
				"Specify whether to allow or deny file listing, in case user has no permission on share. Also known as Access-Based Enumeration.",
			]
			type:    "bool"
			default: false
		}
		read: {
			description: [
				"Specify user list that should get read access on share, separated by comma.",
			]
			type: "str"
		}
		change: {
			description: [
				"Specify user list that should get read and write access on share, separated by comma.",
			]
			type: "str"
		}
		full: {
			description: [
				"Specify user list that should get full access on share, separated by comma.",
			]
			type: "str"
		}
		deny: {
			description: [
				"Specify user list that should get no access, regardless of implied access on share, separated by comma.",
			]
			type: "str"
		}
		caching_mode: {
			description: [
				"Set the CachingMode for this share.",
			]
			type: "str"
			choices: ["BranchCache", "Documents", "Manual", "None", "Programs", "Unknown"]
			default:       "Manual"
			version_added: "2.3"
		}
		encrypt: {
			description:   "Sets whether to encrypt the traffic to the share or not."
			type:          "bool"
			default:       false
			version_added: "2.4"
		}
	}
	author: [
		"Hans-Joachim Kliemeck (@h0nIg)",
		"David Baumann (@daBONDi)",
	]
}
