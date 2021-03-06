package ansible

module: ldap_attrs: {
	module:            "ldap_attrs"
	short_description: "Add or remove multiple LDAP attribute values"
	description: [
		"Add or remove multiple LDAP attribute values.",
	]
	notes: [
		"This only deals with attributes on existing entries. To add or remove whole entries, see M(ldap_entry).",
		"The default authentication settings will attempt to use a SASL EXTERNAL bind over a UNIX domain socket. This works well with the default Ubuntu install for example, which includes a cn=peercred,cn=external,cn=auth ACL rule allowing root to modify the server configuration. If you need to use a simple bind to access your server, pass the credentials in I(bind_dn) and I(bind_pw).",
		"For I(state=present) and I(state=absent), all value comparisons are performed on the server for maximum accuracy. For I(state=exact), values have to be compared in Python, which obviously ignores LDAP matching rules. This should work out in most cases, but it is theoretically possible to see spurious changes when target and actual values are semantically identical but lexically distinct.",
	]

	version_added: "2.10"
	author: [
		"Jiri Tyr (@jtyr)",
		"Alexander Korinek (@noles)",
		"Maciej Delmanowski (@drybjed)",
	]
	requirements: [
		"python-ldap",
	]
	options: {
		state: {
			required: false
			type:     "str"
			choices: ["present", "absent", "exact"]
			default: "present"
			description: [
				"The state of the attribute values. If C(present), all given attribute values will be added if they're missing. If C(absent), all given attribute values will be removed if present. If C(exact), the set of attribute values will be forced to exactly those provided and no others. If I(state=exact) and the attribute I(value) is empty, all values for this attribute will be removed.",
			]
		}

		attributes: {
			required: true
			type:     "dict"
			description: [
				"The attribute(s) and value(s) to add or remove. The complex argument format is required in order to pass a list of strings (see examples).",
			]
		}

		ordered: {
			required: false
			type:     "bool"
			default:  "no"
			description: [
				"If C(yes), prepend list values with X-ORDERED index numbers in all attributes specified in the current task. This is useful mostly with I(olcAccess) attribute to easily manage LDAP Access Control Lists.",
			]
		}
	}

	extends_documentation_fragment: ["ldap.documentation"]
}
