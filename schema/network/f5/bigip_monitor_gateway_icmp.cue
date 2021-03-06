package ansible

module: bigip_monitor_gateway_icmp: {
	module:            "bigip_monitor_gateway_icmp"
	short_description: "Manages F5 BIG-IP LTM gateway ICMP monitors"
	description: [
		"Manages gateway ICMP monitors on a BIG-IP.",
	]
	version_added: 2.8
	options: {
		name: {
			description: [
				"Monitor name.",
			]
			type:     "str"
			required: true
		}
		parent: {
			description: [
				"The parent template of this monitor template. Once this value has been set, it cannot be changed. By default, this value is the C(gateway_icmp) parent on the C(Common) partition.",
			]

			type:    "str"
			default: "/Common/gateway_icmp"
		}
		description: {
			description: [
				"The description of the monitor.",
			]
			type: "str"
		}
		ip: {
			description: [
				"IP address part of the IP/port definition. If this parameter is not provided when creating a new monitor, then the default value will be '*'.",
			]

			type: "str"
		}
		port: {
			description: [
				"Port address part of the IP/port definition. If this parameter is not provided when creating a new monitor, then the default value will be '*'. Note that if specifying an IP address, a value between 1 and 65535 must be specified.",
			]

			type: "str"
		}
		interval: {
			description: [
				"Specifies, in seconds, the frequency at which the system issues the monitor check when either the resource is down or the status of the resource is unknown.",
			]

			type: "int"
		}
		timeout: {
			description: [
				"Specifies the number of seconds the target has in which to respond to the monitor request.",
				"If the target responds within the set time period, it is considered 'up'. If the target does not respond within the set time period, it is considered 'down'. When this value is set to 0 (zero), the system uses the interval from the parent monitor.",
				"Note that C(timeout) and C(time_until_up) combine to control when a resource is set to up.",
			]

			type: "int"
		}
		time_until_up: {
			description: [
				"Specifies the number of seconds to wait after a resource first responds correctly to the monitor before setting the resource to 'up'.",
				"During the interval, all responses from the resource must be correct.",
				"When the interval expires, the resource is marked 'up'.",
				"A value of 0, means that the resource is marked up immediately upon receipt of the first correct response.",
			]

			type: "int"
		}
		up_interval: {
			description: [
				"Specifies the interval for the system to use to perform the health check when a resource is up.",
				"When C(0), specifies that the system uses the interval specified in C(interval) to check the health of the resource.",
				"When any other number, enables specification of a different interval to use when checking the health of a resource that is up.",
			]

			type: "int"
		}
		manual_resume: {
			description: [
				"Specifies whether the system automatically changes the status of a resource to B(enabled) at the next successful monitor check.",
				"If you set this option to C(yes), you must manually re-enable the resource before the system can use it for load balancing connections.",
				"When C(yes), specifies that you must manually re-enable the resource after an unsuccessful monitor check.",
				"When C(no), specifies that the system automatically changes the status of a resource to B(enabled) at the next successful monitor check.",
			]

			type: "bool"
		}
		adaptive: {
			description: [
				"Specifies whether adaptive response time monitoring is enabled for this monitor.",
				"When C(yes), the monitor determines the state of a service based on how divergent from the mean latency a monitor probe for that service is allowed to be. Also, values for the C(allowed_divergence), C(adaptive_limit), and and C(sampling_timespan) will be enforced.",
				"When C(disabled), the monitor determines the state of a service based on the C(interval), C(up_interval), C(time_until_up), and C(timeout) monitor settings.",
			]

			type: "bool"
		}
		allowed_divergence_type: {
			description: [
				"When specifying a new monitor, if C(adaptive) is C(yes), the default is C(relative)",
				"When C(absolute), the number of milliseconds the latency of a monitor probe can exceed the mean latency of a monitor probe for the service being probed. In typical cases, if the monitor detects three probes in a row that miss the latency value you set, the pool member or node is marked down.",
				"When C(relative), the percentage of deviation the latency of a monitor probe can exceed the mean latency of a monitor probe for the service being probed.",
			]

			type: "str"
			choices: [
				"relative",
				"absolute",
			]
		}
		allowed_divergence_value: {
			description: [
				"When specifying a new monitor, if C(adaptive) is C(yes), and C(type) is C(relative), the default is C(25) percent.",
			]

			type: "int"
		}
		adaptive_limit: {
			description: [
				"Specifies the absolute number of milliseconds that may not be exceeded by a monitor probe, regardless of C(allowed_divergence) setting, for a probe to be considered successful.",
				"This value applies regardless of the value of the C(allowed_divergence) setting.",
				"While this value can be configured when C(adaptive) is C(no), it will not take effect on the system until C(adaptive) is C(yes).",
			]

			type: "int"
		}
		sampling_timespan: {
			description: [
				"Specifies the length, in seconds, of the probe history window that the system uses to calculate the mean latency and standard deviation of a monitor probe.",
				"While this value can be configured when C(adaptive) is C(no), it will not take effect on the system until C(adaptive) is C(yes).",
			]

			type: "int"
		}
		transparent: {
			description: [
				"Specifies whether the monitor operates in transparent mode.",
				"A monitor in transparent mode directs traffic through the associated pool members or nodes (usually a router or firewall) to the aliased destination (that is, it probes the C(ip)-C(port) combination specified in the monitor).",
				"If the monitor cannot successfully reach the aliased destination, the pool member or node through which the monitor traffic was sent is marked down.",
				"When creating a new monitor, if this parameter is not provided, then the default value will be whatever is provided by the C(parent).",
			]

			type: "bool"
		}
		partition: {
			description: [
				"Device partition to manage resources on.",
			]
			type:    "str"
			default: "Common"
		}
		state: {
			description: [
				"When C(present), ensures that the monitor exists.",
				"When C(absent), ensures the monitor is removed.",
			]
			type: "str"
			choices: [
				"present",
				"absent",
			]
			default: "present"
		}
	}
	extends_documentation_fragment: "f5"
	author: ["Tim Rupp (@caphrim007)"]
}
