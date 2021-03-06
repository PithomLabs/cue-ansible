package ansible

module: fmgr_secprof_wanopt: {
	module:        "fmgr_secprof_wanopt"
	version_added: "2.8"
	notes: [
		"Full Documentation at U(https://ftnt-ansible-docs.readthedocs.io/en/latest/).",
	]
	author: [
		"Luke Weighall (@lweighall)",
		"Andrew Welsh (@Ghilli3)",
		"Jim Huber (@p4r4n0y1ng)",
	]
	short_description: "WAN optimization"
	description: [
		"Manage WanOpt security profiles in FortiManager via API",
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
				"Allows use of soft-adds instead of overwriting existing values",
			]
			choices: ["add", "set", "delete", "update"]
			required: false
			default:  "add"
		}

		transparent: {
			description: [
				"Enable/disable transparent mode.",
			]
			required: false
			choices: [
				"disable",
				"enable",
			]
		}

		name: {
			description: [
				"Profile name.",
			]
			required: false
		}

		comments: {
			description: [
				"Comment.",
			]
			required: false
		}

		auth_group: {
			description: [
				"Optionally add an authentication group to restrict access to the WAN Optimization tunnel to peers in the authentication group.",
			]

			required: false
		}

		cifs: {
			description: [
				"EXPERTS ONLY! KNOWLEDGE OF FMGR JSON API IS REQUIRED!",
				"List of multiple child objects to be added. Expects a list of dictionaries.",
				"Dictionaries must use FortiManager API parameters, not the ansible ones listed below.",
				"If submitted, all other prefixed sub-parameters ARE IGNORED.",
				"This object is MUTUALLY EXCLUSIVE with its options.",
				"We expect that you know what you are doing with these list parameters, and are leveraging the JSON API Guide.",
				"WHEN IN DOUBT, USE THE SUB OPTIONS BELOW INSTEAD TO CREATE OBJECTS WITH MULTIPLE TASKS",
			]
			required: false
		}

		cifs_byte_caching: {
			description: [
				"Enable/disable byte-caching for HTTP. Byte caching reduces the amount of traffic by caching file data sent across the WAN and in future serving if from the cache.",
			]

			required: false
			choices: [
				"disable",
				"enable",
			]
		}

		cifs_log_traffic: {
			description: [
				"Enable/disable logging.",
			]
			required: false
			choices: [
				"disable",
				"enable",
			]
		}

		cifs_port: {
			description: [
				"Single port number or port number range for CIFS. Only packets with a destination port number that matches this port number or range are accepted by this profile.",
			]

			required: false
		}

		cifs_prefer_chunking: {
			description: [
				"Select dynamic or fixed-size data chunking for HTTP WAN Optimization.",
			]
			required: false
			choices: [
				"dynamic",
				"fix",
			]
		}

		cifs_secure_tunnel: {
			description: [
				"Enable/disable securing the WAN Opt tunnel using SSL. Secure and non-secure tunnels use the same TCP port (7810).",
			]

			required: false
			choices: [
				"disable",
				"enable",
			]
		}

		cifs_status: {
			description: [
				"Enable/disable HTTP WAN Optimization.",
			]
			required: false
			choices: [
				"disable",
				"enable",
			]
		}

		cifs_tunnel_sharing: {
			description: [
				"Tunnel sharing mode for aggressive/non-aggressive and/or interactive/non-interactive protocols.",
			]
			required: false
			choices: [
				"private",
				"shared",
				"express-shared",
			]
		}

		ftp: {
			description: [
				"EXPERTS ONLY! KNOWLEDGE OF FMGR JSON API IS REQUIRED!",
				"List of multiple child objects to be added. Expects a list of dictionaries.",
				"Dictionaries must use FortiManager API parameters, not the ansible ones listed below.",
				"If submitted, all other prefixed sub-parameters ARE IGNORED.",
				"This object is MUTUALLY EXCLUSIVE with its options.",
				"We expect that you know what you are doing with these list parameters, and are leveraging the JSON API Guide.",
				"WHEN IN DOUBT, USE THE SUB OPTIONS BELOW INSTEAD TO CREATE OBJECTS WITH MULTIPLE TASKS",
			]
			required: false
		}

		ftp_byte_caching: {
			description: [
				"Enable/disable byte-caching for HTTP. Byte caching reduces the amount of traffic by caching file data sent across the WAN and in future serving if from the cache.",
			]

			required: false
			choices: [
				"disable",
				"enable",
			]
		}

		ftp_log_traffic: {
			description: [
				"Enable/disable logging.",
			]
			required: false
			choices: [
				"disable",
				"enable",
			]
		}

		ftp_port: {
			description: [
				"Single port number or port number range for FTP. Only packets with a destination port number that matches this port number or range are accepted by this profile.",
			]

			required: false
		}

		ftp_prefer_chunking: {
			description: [
				"Select dynamic or fixed-size data chunking for HTTP WAN Optimization.",
			]
			required: false
			choices: [
				"dynamic",
				"fix",
			]
		}

		ftp_secure_tunnel: {
			description: [
				"Enable/disable securing the WAN Opt tunnel using SSL. Secure and non-secure tunnels use the same TCP port (7810).",
			]

			required: false
			choices: [
				"disable",
				"enable",
			]
		}

		ftp_status: {
			description: [
				"Enable/disable HTTP WAN Optimization.",
			]
			required: false
			choices: [
				"disable",
				"enable",
			]
		}

		ftp_tunnel_sharing: {
			description: [
				"Tunnel sharing mode for aggressive/non-aggressive and/or interactive/non-interactive protocols.",
			]
			required: false
			choices: [
				"private",
				"shared",
				"express-shared",
			]
		}

		http: {
			description: [
				"EXPERTS ONLY! KNOWLEDGE OF FMGR JSON API IS REQUIRED!",
				"List of multiple child objects to be added. Expects a list of dictionaries.",
				"Dictionaries must use FortiManager API parameters, not the ansible ones listed below.",
				"If submitted, all other prefixed sub-parameters ARE IGNORED.",
				"This object is MUTUALLY EXCLUSIVE with its options.",
				"We expect that you know what you are doing with these list parameters, and are leveraging the JSON API Guide.",
				"WHEN IN DOUBT, USE THE SUB OPTIONS BELOW INSTEAD TO CREATE OBJECTS WITH MULTIPLE TASKS",
			]
			required: false
		}

		http_byte_caching: {
			description: [
				"Enable/disable byte-caching for HTTP. Byte caching reduces the amount of traffic by caching file data sent across the WAN and in future serving if from the cache.",
			]

			required: false
			choices: [
				"disable",
				"enable",
			]
		}

		http_log_traffic: {
			description: [
				"Enable/disable logging.",
			]
			required: false
			choices: [
				"disable",
				"enable",
			]
		}

		http_port: {
			description: [
				"Single port number or port number range for HTTP. Only packets with a destination port number that matches this port number or range are accepted by this profile.",
			]

			required: false
		}

		http_prefer_chunking: {
			description: [
				"Select dynamic or fixed-size data chunking for HTTP WAN Optimization.",
			]
			required: false
			choices: [
				"dynamic",
				"fix",
			]
		}

		http_secure_tunnel: {
			description: [
				"Enable/disable securing the WAN Opt tunnel using SSL. Secure and non-secure tunnels use the same TCP port (7810).",
			]

			required: false
			choices: [
				"disable",
				"enable",
			]
		}

		http_ssl: {
			description: [
				"Enable/disable SSL/TLS offloading (hardware acceleration) for HTTPS traffic in this tunnel.",
			]
			required: false
			choices: [
				"disable",
				"enable",
			]
		}

		http_ssl_port: {
			description: [
				"Port on which to expect HTTPS traffic for SSL/TLS offloading.",
			]
			required: false
		}

		http_status: {
			description: [
				"Enable/disable HTTP WAN Optimization.",
			]
			required: false
			choices: [
				"disable",
				"enable",
			]
		}

		http_tunnel_non_http: {
			description: [
				"Configure how to process non-HTTP traffic when a profile configured for HTTP traffic accepts a non-HTTP session. Can occur if an application sends non-HTTP traffic using an HTTP destination port.",
			]

			required: false
			choices: [
				"disable",
				"enable",
			]
		}

		http_tunnel_sharing: {
			description: [
				"Tunnel sharing mode for aggressive/non-aggressive and/or interactive/non-interactive protocols.",
			]
			required: false
			choices: [
				"private",
				"shared",
				"express-shared",
			]
		}

		http_unknown_http_version: {
			description: [
				"How to handle HTTP sessions that do not comply with HTTP 0.9, 1.0, or 1.1.",
			]
			required: false
			choices: [
				"best-effort",
				"reject",
				"tunnel",
			]
		}

		mapi: {
			description: [
				"EXPERTS ONLY! KNOWLEDGE OF FMGR JSON API IS REQUIRED!",
				"List of multiple child objects to be added. Expects a list of dictionaries.",
				"Dictionaries must use FortiManager API parameters, not the ansible ones listed below.",
				"If submitted, all other prefixed sub-parameters ARE IGNORED.",
				"This object is MUTUALLY EXCLUSIVE with its options.",
				"We expect that you know what you are doing with these list parameters, and are leveraging the JSON API Guide.",
				"WHEN IN DOUBT, USE THE SUB OPTIONS BELOW INSTEAD TO CREATE OBJECTS WITH MULTIPLE TASKS",
			]
			required: false
		}

		mapi_byte_caching: {
			description: [
				"Enable/disable byte-caching for HTTP. Byte caching reduces the amount of traffic by caching file data sent across the WAN and in future serving if from the cache.",
			]

			required: false
			choices: [
				"disable",
				"enable",
			]
		}

		mapi_log_traffic: {
			description: [
				"Enable/disable logging.",
			]
			required: false
			choices: [
				"disable",
				"enable",
			]
		}

		mapi_port: {
			description: [
				"Single port number or port number range for MAPI. Only packets with a destination port number that matches this port number or range are accepted by this profile.",
			]

			required: false
		}

		mapi_secure_tunnel: {
			description: [
				"Enable/disable securing the WAN Opt tunnel using SSL. Secure and non-secure tunnels use the same TCP port (7810).",
			]

			required: false
			choices: [
				"disable",
				"enable",
			]
		}

		mapi_status: {
			description: [
				"Enable/disable HTTP WAN Optimization.",
			]
			required: false
			choices: [
				"disable",
				"enable",
			]
		}

		mapi_tunnel_sharing: {
			description: [
				"Tunnel sharing mode for aggressive/non-aggressive and/or interactive/non-interactive protocols.",
			]
			required: false
			choices: [
				"private",
				"shared",
				"express-shared",
			]
		}

		tcp: {
			description: [
				"EXPERTS ONLY! KNOWLEDGE OF FMGR JSON API IS REQUIRED!",
				"List of multiple child objects to be added. Expects a list of dictionaries.",
				"Dictionaries must use FortiManager API parameters, not the ansible ones listed below.",
				"If submitted, all other prefixed sub-parameters ARE IGNORED.",
				"This object is MUTUALLY EXCLUSIVE with its options.",
				"We expect that you know what you are doing with these list parameters, and are leveraging the JSON API Guide.",
				"WHEN IN DOUBT, USE THE SUB OPTIONS BELOW INSTEAD TO CREATE OBJECTS WITH MULTIPLE TASKS",
			]
			required: false
		}

		tcp_byte_caching: {
			description: [
				"Enable/disable byte-caching for HTTP. Byte caching reduces the amount of traffic by caching file data sent across the WAN and in future serving if from the cache.",
			]

			required: false
			choices: [
				"disable",
				"enable",
			]
		}

		tcp_byte_caching_opt: {
			description: [
				"Select whether TCP byte-caching uses system memory only or both memory and disk space.",
			]
			required: false
			choices: [
				"mem-only",
				"mem-disk",
			]
		}

		tcp_log_traffic: {
			description: [
				"Enable/disable logging.",
			]
			required: false
			choices: [
				"disable",
				"enable",
			]
		}

		tcp_port: {
			description: [
				"Single port number or port number range for TCP. Only packets with a destination port number that matches this port number or range are accepted by this profile.",
			]

			required: false
		}

		tcp_secure_tunnel: {
			description: [
				"Enable/disable securing the WAN Opt tunnel using SSL. Secure and non-secure tunnels use the same TCP port (7810).",
			]

			required: false
			choices: [
				"disable",
				"enable",
			]
		}

		tcp_ssl: {
			description: [
				"Enable/disable SSL/TLS offloading.",
			]
			required: false
			choices: [
				"disable",
				"enable",
			]
		}

		tcp_ssl_port: {
			description: [
				"Port on which to expect HTTPS traffic for SSL/TLS offloading.",
			]
			required: false
		}

		tcp_status: {
			description: [
				"Enable/disable HTTP WAN Optimization.",
			]
			required: false
			choices: [
				"disable",
				"enable",
			]
		}

		tcp_tunnel_sharing: {
			description: [
				"Tunnel sharing mode for aggressive/non-aggressive and/or interactive/non-interactive protocols.",
			]
			required: false
			choices: [
				"private",
				"shared",
				"express-shared",
			]
		}
	}
}
