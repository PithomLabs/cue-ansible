package ansible

module: postgresql_owner: {
	module:            "postgresql_owner"
	short_description: "Change an owner of PostgreSQL database object"
	description: [
		"Change an owner of PostgreSQL database object.",
		"Also allows to reassign the ownership of database objects owned by a database role to another role.",
	]
	version_added: "2.8"

	options: {
		new_owner: {
			description: [
				"Role (user/group) to set as an I(obj_name) owner.",
			]
			type:     "str"
			required: true
		}
		obj_name: {
			description: [
				"Name of a database object to change ownership.",
				"Mutually exclusive with I(reassign_owned_by).",
			]
			type: "str"
		}
		obj_type: {
			description: [
				"Type of a database object.",
				"Mutually exclusive with I(reassign_owned_by).",
			]
			type:     "str"
			required: true
			choices: ["database", "function", "matview", "sequence", "schema", "table", "tablespace", "view"]
			aliases: [
				"type",
			]
		}
		reassign_owned_by: {
			description: [
				"The list of role names. The ownership of all the objects within the current database, and of all shared objects (databases, tablespaces), owned by this role(s) will be reassigned to I(owner).",
				"Pay attention - it reassigns all objects owned by this role(s) in the I(db)!",
				"If role(s) exists, always returns changed True.",
				"Cannot reassign ownership of objects that are required by the database system.",
				"Mutually exclusive with C(obj_type).",
			]
			type:     "list"
			elements: "str"
		}
		fail_on_role: {
			description: [
				"If C(yes), fail when I(reassign_owned_by) role does not exist. Otherwise just warn and continue.",
				"Mutually exclusive with I(obj_name) and I(obj_type).",
			]
			default: true
			type:    "bool"
		}
		db: {
			description: [
				"Name of database to connect to.",
			]
			type: "str"
			aliases: [
				"login_db",
			]
		}
		session_role: {
			description: [
				"Switch to session_role after connecting. The specified session_role must be a role that the current login_user is a member of.",
				"Permissions checking for SQL commands is carried out as though the session_role were the one that had logged in originally.",
			]

			type: "str"
		}
	}
	seealso: [{
		module: "postgresql_user"
	}, {
		module: "postgresql_privs"
	}, {
		module: "postgresql_membership"
	}, {
		name:        "PostgreSQL REASSIGN OWNED command reference"
		description: "Complete reference of the PostgreSQL REASSIGN OWNED command documentation."
		link:        "https://www.postgresql.org/docs/current/sql-reassign-owned.html"
	}]
	author: [
		"Andrew Klychkov (@Andersson007)",
	]
	extends_documentation_fragment: "postgres"
}
