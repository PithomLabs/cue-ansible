package ansible

module: win_psmodule: {
	module:            "win_psmodule"
	version_added:     "2.4"
	short_description: "Adds or removes a Windows PowerShell module"
	description: [
		"This module helps to install Windows PowerShell modules and register custom modules repository on Windows-based systems.",
	]
	options: {
		name: {
			description: [
				"Name of the Windows PowerShell module that has to be installed.",
			]
			type:     "str"
			required: true
		}
		state: {
			description: [
				"If C(present) a new module is installed.",
				"If C(absent) a module is removed.",
				"If C(latest) a module is updated to the newest version. This option was added in version 2.8.",
			]
			type: "str"
			choices: ["absent", "latest", "present"]
			default: "present"
		}
		required_version: {
			description: [
				"The exact version of the PowerShell module that has to be installed.",
			]
			type:          "str"
			version_added: "2.8"
		}
		minimum_version: {
			description: [
				"The minimum version of the PowerShell module that has to be installed.",
			]
			type:          "str"
			version_added: "2.8"
		}
		maximum_version: {
			description: [
				"The maximum version of the PowerShell module that has to be installed.",
			]
			type:          "str"
			version_added: "2.8"
		}
		allow_clobber: {
			description: [
				"If C(yes) allows install modules that contains commands those have the same names as commands that already exists.",
			]
			type:    "bool"
			default: false
		}
		skip_publisher_check: {
			description: [
				"If C(yes), allows you to install a different version of a module that already exists on your computer in the case when a different one is not digitally signed by a trusted publisher and the newest existing module is digitally signed by a trusted publisher.",
			]

			type:          "bool"
			default:       false
			version_added: "2.8"
		}
		allow_prerelease: {
			description: [
				"If C(yes) installs modules marked as prereleases.",
				"It doesn't work with the parameters C(minimum_version) and/or C(maximum_version).",
				"It doesn't work with the C(state) set to absent.",
			]
			type:          "bool"
			default:       false
			version_added: "2.8"
		}
		repository: {
			description: [
				"Name of the custom repository to use.",
			]
			type: "str"
		}
		url: {
			description: [
				"URL of the custom repository to register.",
				"This option is deprecated and will be removed in Ansible 2.12. Use the M(win_psrepository) module instead.",
			]

			type: "str"
		}
	}
	notes: [
		"PowerShell modules needed - PowerShellGet >= 1.6.0 - PackageManagement >= 1.1.7",
		"PowerShell package provider needed - NuGet >= 2.8.5.201",
		"On PowerShell 5.x required modules and a package provider will be updated under the first run of the win_psmodule module.",
		"On PowerShell 3.x and 4.x you have to install them before using the win_psmodule.",
	]
	seealso: [{
		module: "win_psrepository"
	}]
	author: [
		"Wojciech Sciesinski (@it-praktyk)",
		"Daniele Lazzari (@dlazz)",
	]
}
