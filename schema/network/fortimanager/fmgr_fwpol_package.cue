package ansible

module: fmgr_fwpol_package: {
	module:        "fmgr_fwpol_package"
	version_added: "2.8"
	notes: [
		"Full Documentation at U(https://ftnt-ansible-docs.readthedocs.io/en/latest/).",
	]
	author: [
		"Luke Weighall (@lweighall)",
		"Andrew Welsh (@Ghilli3)",
		"Jim Huber (@p4r4n0y1ng)",
	]
	short_description: "Manages FortiManager Firewall Policies Packages."
	description: [
		"Manages FortiManager Firewall Policies Packages. Policy Packages contain one or more Firewall Policies/Rules and are distritbuted via FortiManager to Fortigates.",
		"This module controls the creation/edit/delete/assign of these packages.",
	]

	options: {
		adom: {
			description: [
				"The ADOM the configuration should belong to.",
			]
			required: false
			default:  "root"
		}

		mode: {
			description: [
				"Sets one of three modes for managing the object.",
			]
			choices: ["add", "set", "delete"]
			default: "add"
		}

		name: {
			description: [
				"Name of the FortiManager package or folder.",
			]
			required: true
		}

		object_type: {
			description: [
				"Are we managing packages or folders, or installing packages?",
			]
			required: true
			choices: ["pkg", "folder", "install"]
		}

		package_folder: {
			description: [
				"Name of the folder you want to put the package into.",
			]
			required: false
		}

		central_nat: {
			description: [
				"Central NAT setting.",
			]
			required: false
			choices: ["enable", "disable"]
			default: "disable"
		}

		fwpolicy_implicit_log: {
			description: [
				"Implicit Log setting for all IPv4 policies in package.",
			]
			required: false
			choices: ["enable", "disable"]
			default: "disable"
		}

		fwpolicy6_implicit_log: {
			description: [
				"Implicit Log setting for all IPv6 policies in package.",
			]
			required: false
			choices: ["enable", "disable"]
			default: "disable"
		}

		inspection_mode: {
			description: [
				"Inspection mode setting for the policies flow or proxy.",
			]
			required: false
			choices: ["flow", "proxy"]
			default: "flow"
		}

		ngfw_mode: {
			description: [
				"NGFW mode setting for the policies flow or proxy.",
			]
			required: false
			choices: ["profile-based", "policy-based"]
			default: "profile-based"
		}

		ssl_ssh_profile: {
			description: [
				"if policy-based ngfw-mode, refer to firewall ssl-ssh-profile.",
			]
			required: false
		}

		scope_members: {
			description: [
				"The devices or scope that you want to assign this policy package to.",
			]
			required: false
		}

		scope_members_vdom: {
			description: [
				"The members VDOM you want to assign the package to.",
			]
			required: false
			default:  "root"
		}

		parent_folder: {
			description: [
				"The parent folder name you want to add this object under.",
			]
			required: false
		}
	}
}
