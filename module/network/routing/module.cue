package routing

net_static_route :: {

	// Admin distance of the static route.

	admin_distance?: string

	// List of static route definitions

	aggregate?: string

	// Network prefix mask of the static route.

	mask: string

	// Next hop IP of the static route.

	next_hop: string

	// Network prefix of the static route.

	prefix: string

	// Purge static routes not defined in the I(aggregate) parameter.

	purge?: string

	// State of the static route configuration.

	state?: string
}