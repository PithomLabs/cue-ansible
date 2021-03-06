package ansible

module: udm_user: {
	module:        "udm_user"
	version_added: "2.2"
	author: ["Tobias Rüetschi (@keachi)"]
	short_description: "Manage posix users on a univention corporate server"
	description: [
		"This module allows to manage posix users on a univention corporate server (UCS). It uses the python API of the UCS to create a new object or edit it.",
	]

	requirements: ["Python >= 2.6"]
	options: {
		state: {
			default: "present"
			choices: ["present", "absent"]
			description: ["Whether the user is present or not."]
		}
		username: {
			required: true
			description: ["User name"]
			aliases: ["name"]
		}
		firstname: description: ["First name. Required if C(state=present)."]
		lastname: description: ["Last name. Required if C(state=present)."]
		password: description: ["Password. Required if C(state=present)."]
		birthday: description: ["Birthday"]
		city: description: ["City of users business address."]
		country: description: ["Country of users business address."]
		department_number: {
			description: ["Department number of users business address."]
			aliases: ["departmentNumber"]
		}
		description: description: ["Description (not gecos)"]
		display_name: {
			description: ["Display name (not gecos)"]
			aliases: ["displayName"]
		}
		email: {
			default: []
			description: ["A list of e-mail addresses."]
		}
		employee_number: {
			description: ["Employee number"]
			aliases: ["employeeNumber"]
		}
		employee_type: {
			description: ["Employee type"]
			aliases: ["employeeType"]
		}
		gecos: description: ["GECOS"]
		groups: {
			default: []
			description: [
				"POSIX groups, the LDAP DNs of the groups will be found with the LDAP filter for each group as $GROUP: C((&(objectClass=posixGroup)(cn=$GROUP))).",
			]
		}

		home_share: {
			description: [
				"Home NFS share. Must be a LDAP DN, e.g. C(cn=home,cn=shares,ou=school,dc=example,dc=com).",
			]

			aliases: ["homeShare"]
		}
		home_share_path: {
			description: ["Path to home NFS share, inside the homeShare."]
			aliases: ["homeSharePath"]
		}
		home_telephone_number: {
			default: []
			description: ["List of private telephone numbers."]
			aliases: ["homeTelephoneNumber"]
		}
		homedrive: description: ["Windows home drive, e.g. C(\"H:\")."]
		mail_alternative_address: {
			default: []
			description: ["List of alternative e-mail addresses."]
			aliases: ["mailAlternativeAddress"]
		}
		mail_home_server: {
			description: ["FQDN of mail server"]
			aliases: ["mailHomeServer"]
		}
		mail_primary_address: {
			description: ["Primary e-mail address"]
			aliases: ["mailPrimaryAddress"]
		}
		mobile_telephone_number: {
			default: []
			description: ["Mobile phone number"]
			aliases: ["mobileTelephoneNumber"]
		}
		organisation: {
			description: ["Organisation"]
			aliases: ["organization"]
		}
		override_pw_history: {
			type:    "bool"
			default: "no"
			description: ["Override password history"]
			aliases: ["overridePWHistory"]
		}
		override_pw_length: {
			type:    "bool"
			default: "no"
			description: ["Override password check"]
			aliases: ["overridePWLength"]
		}
		pager_telephonenumber: {
			default: []
			description: ["List of pager telephone numbers."]
			aliases: ["pagerTelephonenumber"]
		}
		phone: description: ["List of telephone numbers."]
		postcode: description: ["Postal code of users business address."]
		primary_group: {
			default: "cn=Domain Users,cn=groups,$LDAP_BASE_DN"
			description: ["Primary group. This must be the group LDAP DN."]
			aliases: ["primaryGroup"]
		}
		profilepath: description: ["Windows profile directory"]
		pwd_change_next_login: {
			choices: ["0", "1"]
			description: ["Change password on next login."]
			aliases: ["pwdChangeNextLogin"]
		}
		room_number: {
			description: ["Room number of users business address."]
			aliases: ["roomNumber"]
		}
		samba_privileges: {
			description: [
				"Samba privilege, like allow printer administration, do domain join.",
			]

			aliases: ["sambaPrivileges"]
		}
		samba_user_workstations: {
			description: ["Allow the authentication only on this Microsoft Windows host."]
			aliases: ["sambaUserWorkstations"]
		}
		sambahome: description: ["Windows home path, e.g. C('\\\\$FQDN\\$USERNAME')."]
		scriptpath: description: ["Windows logon script."]
		secretary: {
			default: []
			description: ["A list of superiors as LDAP DNs."]
		}
		serviceprovider: {
			default: []
			description: ["Enable user for the following service providers."]
		}
		shell: {
			default: "/bin/bash"
			description: ["Login shell"]
		}
		street: description: ["Street of users business address."]
		title: description: ["Title, e.g. C(Prof.)."]
		unixhome: {
			default: "/home/$USERNAME"
			description: ["Unix home directory"]
		}
		userexpiry: {
			default: "Today + 1 year"
			description: ["Account expiry date, e.g. C(1999-12-31)."]
		}
		position: {
			default: ""
			description: [
				"Define the whole position of users object inside the LDAP tree, e.g. C(cn=employee,cn=users,ou=school,dc=example,dc=com).",
			]
		}

		update_password: {
			default: "always"
			description: [
				"C(always) will update passwords if they differ. C(on_create) will only set the password for newly created users.",
			]

			version_added: "2.3"
		}
		ou: {
			default: ""
			description: [
				"Organizational Unit inside the LDAP Base DN, e.g. C(school) for LDAP OU C(ou=school,dc=example,dc=com).",
			]
		}

		subpath: {
			default: "cn=users"
			description: [
				"LDAP subpath inside the organizational unit, e.g. C(cn=teachers,cn=users) for LDAP container C(cn=teachers,cn=users,dc=example,dc=com).",
			]
		}
	}
}
