package ansible

module: zabbix_proxy: {
	module:            "zabbix_proxy"
	short_description: "Create/delete/get/update Zabbix proxies"
	description: [
		"This module allows you to create, modify, get and delete Zabbix proxy entries.",
	]
	version_added: "2.5"
	author: [
		"Alen Komic (@akomic)",
	]
	requirements: [
		"python >= 2.6",
		"zabbix-api >= 0.5.3",
	]
	options: {
		proxy_name: {
			description: [
				"Name of the proxy in Zabbix.",
			]
			required: true
		}
		description: {
			description: [
				"Description of the proxy.",
			]
			required: false
		}
		status: {
			description: [
				"Type of proxy. (4 - active, 5 - passive)",
			]
			required: false
			choices: ["active", "passive"]
			default: "active"
		}
		tls_connect: {
			description: [
				"Connections to proxy.",
			]
			required: false
			choices: ["no_encryption", "PSK", "certificate"]
			default: "no_encryption"
		}
		tls_accept: {
			description: [
				"Connections from proxy.",
			]
			required: false
			choices: ["no_encryption", "PSK", "certificate"]
			default: "no_encryption"
		}
		ca_cert: {
			description: [
				"Certificate issuer.",
			]
			required: false
			aliases: ["tls_issuer"]
		}
		tls_subject: {
			description: [
				"Certificate subject.",
			]
			required: false
		}
		tls_psk_identity: {
			description: [
				"PSK identity. Required if either I(tls_connect) or I(tls_accept) has PSK enabled.",
			]
			required: false
		}
		tls_psk: {
			description: [
				"The preshared key, at least 32 hex digits. Required if either I(tls_connect) or I(tls_accept) has PSK enabled.",
			]
			required: false
		}
		state: {
			description: [
				"State of the proxy.",
				"On C(present), it will create if proxy does not exist or update the proxy if the associated data is different.",
				"On C(absent) will remove a proxy if it exists.",
			]
			required: false
			choices: ["present", "absent"]
			default: "present"
		}
		interface: {
			description: [
				"Dictionary with params for the interface when proxy is in passive mode",
				"Available values are: dns, ip, main, port, type and useip.",
				"Please review the interface documentation for more information on the supported properties",
				"U(https://www.zabbix.com/documentation/3.2/manual/api/reference/proxy/object#proxy_interface)",
			]
			required: false
			default: {}
		}
	}

	extends_documentation_fragment: ["zabbix"]
}
