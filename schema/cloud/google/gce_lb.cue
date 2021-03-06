package ansible

module: gce_lb: {
	module:            "gce_lb"
	version_added:     "1.5"
	short_description: "create/destroy GCE load-balancer resources"
	description: [
		"This module can create and destroy Google Compute Engine C(loadbalancer) and C(httphealthcheck) resources.  The primary LB resource is the C(load_balancer) resource and the health check parameters are all prefixed with I(httphealthcheck). The full documentation for Google Compute Engine load balancing is at U(https://developers.google.com/compute/docs/load-balancing/).  However, the ansible module simplifies the configuration by following the libcloud model. Full install/configuration instructions for the gce* modules can be found in the comments of ansible/test/gce_tests.py.",
	]

	options: {
		httphealthcheck_name: description: [
			"the name identifier for the HTTP health check",
		]
		httphealthcheck_port: {
			description: [
				"the TCP port to use for HTTP health checking",
			]
			default: 80
		}
		httphealthcheck_path: {
			description: [
				"the url path to use for HTTP health checking",
			]
			default: "/"
		}
		httphealthcheck_interval: {
			description: [
				"the duration in seconds between each health check request",
			]
			default: 5
		}
		httphealthcheck_timeout: {
			description: [
				"the timeout in seconds before a request is considered a failed check",
			]
			default: 5
		}
		httphealthcheck_unhealthy_count: {
			description: [
				"number of consecutive failed checks before marking a node unhealthy",
			]
			default: 2
		}
		httphealthcheck_healthy_count: {
			description: [
				"number of consecutive successful checks before marking a node healthy",
			]
			default: 2
		}
		httphealthcheck_host: description: [
			"host header to pass through on HTTP check requests",
		]
		name: description: [
			"name of the load-balancer resource",
		]
		protocol: {
			description: [
				"the protocol used for the load-balancer packet forwarding, tcp or udp",
			]
			default: "tcp"
			choices: ["tcp", "udp"]
		}
		region: description: [
			"the GCE region where the load-balancer is defined",
		]
		external_ip: description: [
			"the external static IPv4 (or auto-assigned) address for the LB",
		]
		port_range: description: [
			"the port (range) to forward, e.g. 80 or 8000-8888 defaults to all ports",
		]
		members: {
			description: [
				"a list of zone/nodename pairs, e.g ['us-central1-a/www-a', ...]",
			]
			aliases: ["nodes"]
		}
		state: {
			description: [
				"desired state of the LB",
			]
			default: "present"
			choices: ["active", "present", "absent", "deleted"]
		}
		service_account_email: {
			version_added: "1.6"
			description: [
				"service account email",
			]
		}
		pem_file: {
			version_added: "1.6"
			description: [
				"path to the pem file associated with the service account email This option is deprecated. Use 'credentials_file'.",
			]
		}

		credentials_file: {
			version_added: "2.1.0"
			description: [
				"path to the JSON file associated with the service account email",
			]
		}
		project_id: {
			version_added: "1.6"
			description: [
				"your GCE project ID",
			]
		}
	}

	requirements: [
		"python >= 2.6",
		"apache-libcloud >= 0.13.3, >= 0.17.0 if using JSON credentials",
	]
	author: "Eric Johnson (@erjohnso) <erjohnso@google.com>"
}
