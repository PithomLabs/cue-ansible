package ansible

module: consul: {
	module:            "consul"
	short_description: "Add, modify & delete services within a consul cluster."
	description: [
		"Registers services and checks for an agent with a consul cluster. A service is some process running on the agent node that should be advertised by consul's discovery mechanism. It may optionally supply a check definition, a periodic service test to notify the consul cluster of service's health.",
		"Checks may also be registered per node e.g. disk usage, or cpu usage and notify the health of the entire node to the cluster. Service level checks do not require a check name or id as these are derived by Consul from the Service name and id respectively by appending 'service:' Node level checks require a I(check_name) and optionally a I(check_id).",
		"Currently, there is no complete way to retrieve the script, interval or ttl metadata for a registered check. Without this metadata it is  not possible to tell if the data supplied with ansible represents a change to a check. As a result this does not attempt to determine changes and will always report a changed occurred. An API method is planned to supply this metadata so at that stage change management will be added.",
		"See U(http://consul.io) for more details.",
	]
	requirements: [
		"python-consul",
		"requests",
	]
	version_added: "2.0"
	author:        "Steve Gargan (@sgargan)"
	options: {
		state: {
			description: [
				"register or deregister the consul service, defaults to present",
			]
			default: "present"
			choices: ["present", "absent"]
		}
		service_name: {
			type: "str"
			description: [
				"Unique name for the service on a node, must be unique per node, required if registering a service. May be omitted if registering a node level check",
			]
		}

		service_id: {
			type: "str"
			description: [
				"the ID for the service, must be unique per node. If I(state=absent), defaults to the service name if supplied.",
			]
		}

		host: {
			type: "str"
			description: [
				"host of the consul agent defaults to localhost",
			]
			default: "localhost"
		}
		port: {
			type: "int"
			description: [
				"the port on which the consul agent is running",
			]
			default: 8500
		}
		scheme: {
			type: "str"
			description: [
				"the protocol scheme on which the consul agent is running",
			]
			default:       "http"
			version_added: "2.1"
		}
		validate_certs: {
			description: [
				"whether to verify the TLS certificate of the consul agent",
			]
			type:          "bool"
			default:       "yes"
			version_added: "2.1"
		}
		notes: {
			type: "str"
			description: [
				"Notes to attach to check when registering it.",
			]
		}
		service_port: {
			type: "int"
			description: [
				"the port on which the service is listening. Can optionally be supplied for registration of a service, i.e. if I(service_name) or I(service_id) is set",
			]
		}

		service_address: {
			type: "str"
			description: [
				"the address to advertise that the service will be listening on. This value will be passed as the I(address) parameter to Consul's U(/v1/agent/service/register) API method, so refer to the Consul API documentation for further details.",
			]

			version_added: "2.1"
		}
		tags: {
			type: "list"
			description: [
				"tags that will be attached to the service registration.",
			]
		}
		script: {
			type: "str"
			description: [
				"the script/command that will be run periodically to check the health of the service. Scripts require I(interval) and vice versa.",
			]
		}

		interval: {
			type: "str"
			description: [
				"the interval at which the service check will be run. This is a number with a s or m suffix to signify the units of seconds or minutes e.g C(15s) or C(1m). If no suffix is supplied, m will be used by default e.g. C(1) will be C(1m). Required if the I(script) parameter is specified.",
			]
		}

		check_id: {
			type: "str"
			description: [
				"an ID for the service check. If I(state=absent), defaults to I(check_name). Ignored if part of a service definition.",
			]
		}

		check_name: {
			type: "str"
			description: [
				"a name for the service check. Required if standalone, ignored if part of service definition.",
			]
		}

		ttl: {
			type: "str"
			description: [
				"checks can be registered with a ttl instead of a I(script) and I(interval) this means that the service will check in with the agent before the ttl expires. If it doesn't the check will be considered failed. Required if registering a check and the script an interval are missing Similar to the interval this is a number with a s or m suffix to signify the units of seconds or minutes e.g C(15s) or C(1m). If no suffix is supplied, C(m) will be used by default e.g. C(1) will be C(1m)",
			]
		}

		http: {
			type: "str"
			description: [
				"checks can be registered with an HTTP endpoint. This means that consul will check that the http endpoint returns a successful HTTP status. I(interval) must also be provided with this option.",
			]

			version_added: "2.0"
		}
		timeout: {
			type: "str"
			description: [
				"A custom HTTP check timeout. The consul default is 10 seconds. Similar to the interval this is a number with a C(s) or C(m) suffix to signify the units of seconds or minutes, e.g. C(15s) or C(1m).",
			]

			version_added: "2.0"
		}
		token: {
			type: "str"
			description: ["the token key identifying an ACL rule set. May be required to register services."]
		}
	}
}
