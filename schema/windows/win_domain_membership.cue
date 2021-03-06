package ansible

module: win_domain_membership: {
	module:            "win_domain_membership"
	short_description: "Manage domain/workgroup membership for a Windows host"
	version_added:     "2.3"
	description: [
		"Manages domain membership or workgroup membership for a Windows host. Also supports hostname changes.",
		"This module may require subsequent use of the M(win_reboot) action if changes are made.",
	]
	options: {
		dns_domain_name: {
			description: [
				"When C(state) is C(domain), the DNS name of the domain to which the targeted Windows host should be joined.",
			]
			type: "str"
		}
		domain_admin_user: {
			description: [
				"Username of a domain admin for the target domain (required to join or leave the domain).",
			]
			type:     "str"
			required: true
		}
		domain_admin_password: {
			description: [
				"Password for the specified C(domain_admin_user).",
			]
			type: "str"
		}
		hostname: {
			description: [
				"The desired hostname for the Windows host.",
			]
			type: "str"
		}
		domain_ou_path: {
			description: [
				"The desired OU path for adding the computer object.",
				"This is only used when adding the target host to a domain, if it is already a member then it is ignored.",
			]
			type:          "str"
			version_added: "2.4"
		}
		state: {
			description: [
				"Whether the target host should be a member of a domain or workgroup.",
			]
			type: "str"
			choices: ["domain", "workgroup"]
		}
		workgroup_name: {
			description: [
				"When C(state) is C(workgroup), the name of the workgroup that the Windows host should be in.",
			]
			type: "str"
		}
	}
	seealso: [{
		module: "win_domain"
	}, {
		module: "win_domain_controller"
	}, {
		module: "win_domain_computer"
	}, {
		module: "win_domain_group"
	}, {
		module: "win_domain_user"
	}, {
		module: "win_group"
	}, {
		module: "win_group_membership"
	}, {
		module: "win_user"
	}]
	author: ["Matt Davis (@nitzmahone)"]
}
