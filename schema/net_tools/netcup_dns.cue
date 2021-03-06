package ansible

module: netcup_dns: {
	module: "netcup_dns"
	notes: []
	version_added:     "2.7.0"
	short_description: "manage Netcup DNS records"
	description: [
		"Manages DNS records via the Netcup API, see the docs U(https://ccp.netcup.net/run/webservice/servers/endpoint.php)",
	]
	options: {
		api_key: {
			description: [
				"API key for authentification, must be obtained via the netcup CCP (U(https://ccp.netcup.net))",
			]
			required: true
		}
		api_password: {
			description: [
				"API password for authentification, must be obtained via the netcup CCP (https://ccp.netcup.net)",
			]
			required: true
		}
		customer_id: {
			description: [
				"Netcup customer id",
			]
			required: true
		}
		domain: {
			description: [
				"Domainname the records should be added / removed",
			]
			required: true
		}
		record: {
			description: [
				"Record to add or delete, supports wildcard (*). Default is C(@) (e.g. the zone name)",
			]
			default: "@"
			aliases: ["name"]
		}
		type: {
			description: [
				"Record type",
			]
			choices: ["A", "AAAA", "MX", "CNAME", "CAA", "SRV", "TXT", "TLSA", "NS", "DS"]
			required: true
		}
		value: {
			description: [
				"Record value",
			]
			required: true
		}
		solo: {
			type:    "bool"
			default: false
			description: [
				"Whether the record should be the only one for that record type and record name. Only use with C(state=present)",
				"This will delete all other records with the same record name and type.",
			]
		}
		priority: {
			description: [
				"Record priority. Required for C(type=MX)",
			]
			required: false
		}
		state: {
			description: [
				"Whether the record should exist or not",
			]
			required: false
			default:  "present"
			choices: ["present", "absent"]
		}
	}
	requirements: [
		"nc-dnsapi >= 0.1.3",
	]
	author: "Nicolai Buchwitz (@nbuchwitz)"
}
