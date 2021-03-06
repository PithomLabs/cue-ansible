package ansible

module: installp: {
	module: "installp"
	author: [
		"Kairo Araujo (@kairoaraujo)",
	]
	short_description: "Manage packages on AIX"
	description: [
		"Manage packages using 'installp' on AIX",
	]
	version_added: "2.8"
	options: {
		accept_license: {
			description: [
				"Whether to accept the license for the package(s).",
			]
			type:    "bool"
			default: false
		}
		name: {
			description: [
				"One or more packages to install or remove.",
				"Use C(all) to install all packages available on informed C(repository_path).",
			]
			type:     "list"
			required: true
			aliases: ["pkg"]
		}
		repository_path: {
			description: [
				"Path with AIX packages (required to install).",
			]
			type: "path"
		}
		state: {
			description: [
				"Whether the package needs to be present on or absent from the system.",
			]
			type: "str"
			choices: ["absent", "present"]
			default: "present"
		}
	}
	notes: ["If the package is already installed, even the package/fileset is new, the module will not install it."]
}
