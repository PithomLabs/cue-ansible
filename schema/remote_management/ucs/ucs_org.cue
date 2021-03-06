package ansible

module: ucs_org: {
	module: "ucs_org"

	short_description: "Manages UCS Organizations for UCS Manager"

	description: [
		"Manages UCS Organizations for UCS Manager.",
		"Examples can be used with the UCS Platform Emulator U(https://cs.co/ucspe).",
	]

	extends_documentation_fragment: "ucs"

	options: {
		state: {
			description: [
				"If C(absent), will remove organization.",
				"If C(present), will create or update organization.",
			]
			choices: ["absent", "present"]
			default: "present"
			type:    "str"
		}

		org_name: {
			description: [
				"The name of the organization.",
				"Enter up to 16 characters.",
				"You can use any characters or spaces except the following:",
				"` (accent mark),  (backslash), ^ (carat), \" (double quote), = (equal sign), > (greater than), < (less than), or ' (single quote).",
			]
			aliases: ["name"]
			type: "str"
		}

		parent_org_path: {
			description: [
				"A forward slash / separated hierarchical path from the root organization to the parent of the organization to be added or updated.",
				"UCS Manager supports a hierarchical structure of organizations up to five levels deep not including the root organization.",
				"For example the parent_org_path for an organization named level5 could be root/level1/level2/level3/level4/level5",
			]
			default: "root"
			type:    "str"
		}

		description: {
			description: [
				"A user-defined description of the organization.",
				"Enter up to 256 characters.",
				"You can use any characters or spaces except the following:",
				"` (accent mark),  (backslash), ^ (carat), \" (double quote), = (equal sign), > (greater than), < (less than), or ' (single quote).",
			]
			aliases: ["descr"]
			type: "str"
		}

		delegate_to: {
			description: [
				"Where the module will be run",
			]
			default: "localhost"
			type:    "str"
		}
	}

	requirements: [
		"ucsmsdk",
	]

	author: [
		"John McDonough (@movinalot)",
		"CiscoUcs (@CiscoUcs)",
	]
	version_added: "2.8"
}
