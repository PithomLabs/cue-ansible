package ansible

module: homebrew: {
	module: "homebrew"
	author: [
		"Indrajit Raychaudhuri (@indrajitr)",
		"Daniel Jaouen (@danieljaouen)",
		"Andrew Dunham (@andrew-d)",
	]
	requirements: [
		"python >= 2.6",
		"homebrew must already be installed on the target system",
	]
	short_description: "Package manager for Homebrew"
	description: [
		"Manages Homebrew packages",
	]
	version_added: "1.1"
	options: {
		name: {
			description: [
				"list of names of packages to install/remove",
			]
			aliases: ["pkg", "package", "formula"]
			type:     "list"
			elements: "str"
		}
		path: {
			description: [
				"A ':' separated list of paths to search for 'brew' executable. Since a package (I(formula) in homebrew parlance) location is prefixed relative to the actual path of I(brew) command, providing an alternative I(brew) path enables managing different set of packages in an alternative location in the system.",
			]

			default: "/usr/local/bin"
		}
		state: {
			description: [
				"state of the package",
			]
			choices: ["head", "latest", "present", "absent", "linked", "unlinked"]
			default: "present"
		}
		update_homebrew: {
			description: [
				"update homebrew itself first",
			]
			type:    "bool"
			default: "no"
			aliases: ["update-brew"]
		}
		upgrade_all: {
			description: [
				"upgrade all homebrew packages",
			]
			type:    "bool"
			default: "no"
			aliases: ["upgrade"]
		}
		install_options: {
			description: [
				"options flags to install a package",
			]
			aliases: ["options"]
			version_added: "1.4"
		}
	}
	notes: [
		"When used with a `loop:` each package will be processed individually, it is much more efficient to pass the list directly to the `name` option.",
	]
}
