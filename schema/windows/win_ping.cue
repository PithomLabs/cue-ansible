package ansible

module: win_ping: {
	module:            "win_ping"
	version_added:     "1.7"
	short_description: "A windows version of the classic ping module"
	description: [
		"Checks management connectivity of a windows host.",
		"This is NOT ICMP ping, this is just a trivial test module.",
		"For non-Windows targets, use the M(ping) module instead.",
		"For Network targets, use the M(net_ping) module instead.",
	]
	options: data: {
		description: [
			"Alternate data to return instead of 'pong'.",
			"If this parameter is set to C(crash), the module will cause an exception.",
		]
		type:    "str"
		default: "pong"
	}
	seealso: [{
		module: "ping"
	}]
	author: ["Chris Church (@cchurch)"]
}
