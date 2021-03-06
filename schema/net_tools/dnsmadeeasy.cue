package ansible

module: dnsmadeeasy: {
	module:            "dnsmadeeasy"
	version_added:     "1.3"
	short_description: "Interface with dnsmadeeasy.com (a DNS hosting service)."
	description: [
		"""
		Manages DNS records via the v2 REST API of the DNS Made Easy service.  It handles records only; there is no manipulation of domains or monitor/account support yet. See: U(https://www.dnsmadeeasy.com/integration/restapi/)

		""",
	]

	options: {
		account_key: {
			description: [
				"Account API Key.",
			]
			required: true
		}

		account_secret: {
			description: [
				"Account Secret Key.",
			]
			required: true
		}

		domain: {
			description: [
				"Domain to work with. Can be the domain name (e.g. \"mydomain.com\") or the numeric ID of the domain in DNS Made Easy (e.g. \"839989\") for faster resolution",
			]

			required: true
		}

		sandbox: {
			description: [
				"Decides if the sandbox API should be used. Otherwise (default) the production API of DNS Made Easy is used.",
			]
			type:          "bool"
			default:       "no"
			version_added: 2.7
		}

		record_name: description: [
			"Record name to get/create/delete/update. If record_name is not specified; all records for the domain will be returned in \"result\" regardless of the state argument.",
		]

		record_type: {
			description: [
				"Record type.",
			]
			choices: ["A", "AAAA", "CNAME", "ANAME", "HTTPRED", "MX", "NS", "PTR", "SRV", "TXT"]
		}

		record_value: description: [
			"""
		Record value. HTTPRED: <redirection URL>, MX: <priority> <target name>, NS: <name server>, PTR: <target name>, SRV: <priority> <weight> <port> <target name>, TXT: <text value>\"

		""",
			"""
		If record_value is not specified; no changes will be made and the record will be returned in 'result' (in other words, this module can be used to fetch a record's current id, type, and ttl)

		""",
		]

		record_ttl: {
			description: [
				"record's \"Time to live\".  Number of seconds the record remains cached in DNS servers.",
			]
			default: 1800
		}

		state: {
			description: [
				"whether the record should exist or not",
			]
			required: true
			choices: ["present", "absent"]
		}

		validate_certs: {
			description: [
				"If C(no), SSL certificates will not be validated. This should only be used on personally controlled sites using self-signed certificates.",
			]

			type:          "bool"
			default:       "yes"
			version_added: "1.5.1"
		}

		monitor: {
			description: [
				"If C(yes), add or change the monitor.  This is applicable only for A records.",
			]
			type:          "bool"
			default:       "no"
			version_added: 2.4
		}

		systemDescription: {
			description: [
				"Description used by the monitor.",
			]
			required:      true
			default:       ""
			version_added: 2.4
		}

		maxEmails: {
			description: [
				"Number of emails sent to the contact list by the monitor.",
			]
			required:      true
			default:       1
			version_added: 2.4
		}

		protocol: {
			description: [
				"Protocol used by the monitor.",
			]
			required: true
			default:  "HTTP"
			choices: ["TCP", "UDP", "HTTP", "DNS", "SMTP", "HTTPS"]
			version_added: 2.4
		}

		port: {
			description: [
				"Port used by the monitor.",
			]
			required:      true
			default:       80
			version_added: 2.4
		}

		sensitivity: {
			description: [
				"Number of checks the monitor performs before a failover occurs where Low = 8, Medium = 5,and High = 3.",
			]
			required: true
			default:  "Medium"
			choices: ["Low", "Medium", "High"]
			version_added: 2.4
		}

		contactList: {
			description: [
				"Name or id of the contact list that the monitor will notify.",
				"The default C('') means the Account Owner.",
			]
			required:      true
			default:       ""
			version_added: 2.4
		}

		httpFqdn: {
			description: [
				"The fully qualified domain name used by the monitor.",
			]
			version_added: 2.4
		}

		httpFile: {
			description: [
				"The file at the Fqdn that the monitor queries for HTTP or HTTPS.",
			]
			version_added: 2.4
		}

		httpQueryString: {
			description: [
				"The string in the httpFile that the monitor queries for HTTP or HTTPS.",
			]
			version_added: 2.4
		}

		failover: {
			description: [
				"If C(yes), add or change the failover.  This is applicable only for A records.",
			]
			type:          "bool"
			default:       "no"
			version_added: 2.4
		}

		autoFailover: {
			description: [
				"If true, fallback to the primary IP address is manual after a failover.",
				"If false, fallback to the primary IP address is automatic after a failover.",
			]
			type:          "bool"
			default:       "no"
			version_added: 2.4
		}

		ip1: {
			description: [
				"Primary IP address for the failover.",
				"Required if adding or changing the monitor or failover.",
			]
			version_added: 2.4
		}

		ip2: {
			description: [
				"Secondary IP address for the failover.",
				"Required if adding or changing the failover.",
			]
			version_added: 2.4
		}

		ip3: {
			description: [
				"Tertiary IP address for the failover.",
			]
			version_added: 2.4
		}

		ip4: {
			description: [
				"Quaternary IP address for the failover.",
			]
			version_added: 2.4
		}

		ip5: {
			description: [
				"Quinary IP address for the failover.",
			]
			version_added: 2.4
		}
	}

	notes: [
		"The DNS Made Easy service requires that machines interacting with the API have the proper time and timezone set. Be sure you are within a few seconds of actual time by using NTP.",
		"This module returns record(s) and monitor(s) in the \"result\" element when 'state' is set to 'present'. These values can be be registered and used in your playbooks.",
		"Only A records can have a monitor or failover.",
		"To add failover, the 'failover', 'autoFailover', 'port', 'protocol', 'ip1', and 'ip2' options are required.",
		"To add monitor, the 'monitor', 'port', 'protocol', 'maxEmails', 'systemDescription', and 'ip1' options are required.",
		"The monitor and the failover will share 'port', 'protocol', and 'ip1' options.",
	]

	requirements: ["hashlib", "hmac"]
	author: "Brice Burgess (@briceburg)"
}
