package ansible

module: yum_repository: {
	module:            "yum_repository"
	author:            "Jiri Tyr (@jtyr)"
	version_added:     "2.1"
	short_description: "Add or remove YUM repositories"
	description: [
		"Add or remove YUM repositories in RPM-based Linux distributions.",
		"If you wish to update an existing repository definition use M(ini_file) instead.",
	]

	options: {
		async: {
			description: [
				"If set to C(yes) Yum will download packages and metadata from this repo in parallel, if possible.",
			]

			type:    "bool"
			default: "yes"
		}
		bandwidth: {
			description: [
				"Maximum available network bandwidth in bytes/second. Used with the I(throttle) option.",
				"If I(throttle) is a percentage and bandwidth is C(0) then bandwidth throttling will be disabled. If I(throttle) is expressed as a data rate (bytes/sec) then this option is ignored. Default is C(0) (no bandwidth throttling).",
			]

			default: 0
		}
		baseurl: description: [
			"URL to the directory where the yum repository's 'repodata' directory lives.",
			"It can also be a list of multiple URLs.",
			"This, the I(metalink) or I(mirrorlist) parameters are required if I(state) is set to C(present).",
		]

		cost: {
			description: [
				"Relative cost of accessing this repository. Useful for weighing one repo's packages as greater/less than any other.",
			]

			default: 1000
		}
		deltarpm_metadata_percentage: {
			description: [
				"When the relative size of deltarpm metadata vs pkgs is larger than this, deltarpm metadata is not downloaded from the repo. Note that you can give values over C(100), so C(200) means that the metadata is required to be half the size of the packages. Use C(0) to turn off this check, and always download metadata.",
			]

			default: 100
		}
		deltarpm_percentage: {
			description: [
				"When the relative size of delta vs pkg is larger than this, delta is not used. Use C(0) to turn off delta rpm processing. Local repositories (with file:// I(baseurl)) have delta rpms turned off by default.",
			]

			default: 75
		}
		description: description: [
			"A human readable string describing the repository. This option corresponds to the \"name\" property in the repo file.",
			"This parameter is only required if I(state) is set to C(present).",
		]
		enabled: {
			description: [
				"This tells yum whether or not use this repository.",
			]
			type:    "bool"
			default: "yes"
		}
		enablegroups: {
			description: [
				"Determines whether yum will allow the use of package groups for this repository.",
			]

			type:    "bool"
			default: "yes"
		}
		exclude: description: [
			"List of packages to exclude from updates or installs. This should be a space separated list. Shell globs using wildcards (eg. C(*) and C(?)) are allowed.",
			"The list can also be a regular YAML array.",
		]
		failovermethod: {
			choices: ["roundrobin", "priority"]
			default: "roundrobin"
			description: [
				"C(roundrobin) randomly selects a URL out of the list of URLs to start with and proceeds through each of them as it encounters a failure contacting the host.",
				"C(priority) starts from the first I(baseurl) listed and reads through them sequentially.",
			]
		}

		file: description: [
			"File name without the C(.repo) extension to save the repo in. Defaults to the value of I(name).",
		]

		gpgcakey: description: [
			"A URL pointing to the ASCII-armored CA key file for the repository.",
		]
		gpgcheck: {
			description: [
				"Tells yum whether or not it should perform a GPG signature check on packages.",
				"No default setting. If the value is not set, the system setting from C(/etc/yum.conf) or system default of C(no) will be used.",
			]

			type: "bool"
		}
		gpgkey: description: [
			"A URL pointing to the ASCII-armored GPG key file for the repository.",
			"It can also be a list of multiple URLs.",
		]
		http_caching: {
			description: [
				"Determines how upstream HTTP caches are instructed to handle any HTTP downloads that Yum does.",
				"C(all) means that all HTTP downloads should be cached.",
				"C(packages) means that only RPM package downloads should be cached (but not repository metadata downloads).",
				"C(none) means that no HTTP downloads should be cached.",
			]
			choices: ["all", "packages", "none"]
			default: "all"
		}
		include: description: [
			"Include external configuration file. Both, local path and URL is supported. Configuration file will be inserted at the position of the I(include=) line. Included files may contain further include lines. Yum will abort with an error if an inclusion loop is detected.",
		]

		includepkgs: description: [
			"List of packages you want to only use from a repository. This should be a space separated list. Shell globs using wildcards (eg. C(*) and C(?)) are allowed. Substitution variables (e.g. C($releasever)) are honored here.",
			"The list can also be a regular YAML array.",
		]
		ip_resolve: {
			description: [
				"Determines how yum resolves host names.",
				"C(4) or C(IPv4) - resolve to IPv4 addresses only.",
				"C(6) or C(IPv6) - resolve to IPv6 addresses only.",
			]
			choices: [4, 6, "IPv4", "IPv6", "whatever"]
			default: "whatever"
		}
		keepalive: {
			description: [
				"This tells yum whether or not HTTP/1.1 keepalive should be used with this repository. This can improve transfer speeds by using one connection when downloading multiple files from a repository.",
			]

			type:    "bool"
			default: "no"
		}
		keepcache: {
			description: [
				"Either C(1) or C(0). Determines whether or not yum keeps the cache of headers and packages after successful installation.",
			]

			choices: ["0", "1"]
			default: "1"
		}
		metadata_expire: {
			description: [
				"Time (in seconds) after which the metadata will expire.",
				"Default value is 6 hours.",
			]
			default: 21600
		}
		metadata_expire_filter: {
			description: [
				"Filter the I(metadata_expire) time, allowing a trade of speed for accuracy if a command doesn't require it. Each yum command can specify that it requires a certain level of timeliness quality from the remote repos. from \"I'm about to install/upgrade, so this better be current\" to \"Anything that's available is good enough\".",
				"C(never) - Nothing is filtered, always obey I(metadata_expire).",
				"C(read-only:past) - Commands that only care about past information are filtered from metadata expiring. Eg. I(yum history) info (if history needs to lookup anything about a previous transaction, then by definition the remote package was available in the past).",
				"C(read-only:present) - Commands that are balanced between past and future. Eg. I(yum list yum).",
				"C(read-only:future) - Commands that are likely to result in running other commands which will require the latest metadata. Eg. I(yum check-update).",
				"Note that this option does not override \"yum clean expire-cache\".",
			]
			choices: ["never", "read-only:past", "read-only:present", "read-only:future"]
			default: "read-only:present"
		}
		metalink: description: [
			"Specifies a URL to a metalink file for the repomd.xml, a list of mirrors for the entire repository are generated by converting the mirrors for the repomd.xml file to a I(baseurl).",
			"This, the I(baseurl) or I(mirrorlist) parameters are required if I(state) is set to C(present).",
		]

		mirrorlist: description: [
			"Specifies a URL to a file containing a list of baseurls.",
			"This, the I(baseurl) or I(metalink) parameters are required if I(state) is set to C(present).",
		]

		mirrorlist_expire: {
			description: [
				"Time (in seconds) after which the mirrorlist locally cached will expire.",
				"Default value is 6 hours.",
			]
			default: 21600
		}
		name: {
			description: [
				"Unique repository ID. This option builds the section name of the repository in the repo file.",
				"This parameter is only required if I(state) is set to C(present) or C(absent).",
			]

			required: true
		}
		password: description: [
			"Password to use with the username for basic authentication.",
		]
		priority: {
			description: [
				"Enforce ordered protection of repositories. The value is an integer from 1 to 99.",
				"This option only works if the YUM Priorities plugin is installed.",
			]
			default: 99
		}
		protect: {
			description: [
				"Protect packages from updates from other repositories.",
			]
			type:    "bool"
			default: "no"
		}
		proxy: description: [
			"URL to the proxy server that yum should use. Set to C(_none_) to disable the global proxy setting.",
		]

		proxy_password: description: [
			"Password for this proxy.",
		]
		proxy_username: description: [
			"Username to use for proxy.",
		]
		repo_gpgcheck: {
			description: [
				"This tells yum whether or not it should perform a GPG signature check on the repodata from this repository.",
			]

			type:    "bool"
			default: "no"
		}
		reposdir: {
			description: [
				"Directory where the C(.repo) files will be stored.",
			]
			default: "/etc/yum.repos.d"
		}
		retries: {
			description: [
				"Set the number of times any attempt to retrieve a file should retry before returning an error. Setting this to C(0) makes yum try forever.",
			]

			default: 10
		}
		s3_enabled: {
			description: [
				"Enables support for S3 repositories.",
				"This option only works if the YUM S3 plugin is installed.",
			]
			type:    "bool"
			default: "no"
		}
		skip_if_unavailable: {
			description: [
				"If set to C(yes) yum will continue running if this repository cannot be contacted for any reason. This should be set carefully as all repos are consulted for any given command.",
			]

			type:    "bool"
			default: "no"
		}
		ssl_check_cert_permissions: {
			description: [
				"Whether yum should check the permissions on the paths for the certificates on the repository (both remote and local).",
				"If we can't read any of the files then yum will force I(skip_if_unavailable) to be C(yes). This is most useful for non-root processes which use yum on repos that have client cert files which are readable only by root.",
			]

			type:    "bool"
			default: "no"
		}
		sslcacert: {
			description: [
				"Path to the directory containing the databases of the certificate authorities yum should use to verify SSL certificates.",
			]

			aliases: ["ca_cert"]
		}
		sslclientcert: {
			description: [
				"Path to the SSL client certificate yum should use to connect to repos/remote sites.",
			]

			aliases: ["client_cert"]
		}
		sslclientkey: {
			description: [
				"Path to the SSL client key yum should use to connect to repos/remote sites.",
			]

			aliases: ["client_key"]
		}
		sslverify: {
			description: [
				"Defines whether yum should verify SSL certificates/hosts at all.",
			]
			type:    "bool"
			default: "yes"
			aliases: ["validate_certs"]
		}
		state: {
			description: [
				"State of the repo file.",
			]
			choices: ["absent", "present"]
			default: "present"
		}
		throttle: description: [
			"Enable bandwidth throttling for downloads.",
			"This option can be expressed as a absolute data rate in bytes/sec. An SI prefix (k, M or G) may be appended to the bandwidth value.",
		]

		timeout: {
			description: [
				"Number of seconds to wait for a connection before timing out.",
			]
			default: 30
		}
		ui_repoid_vars: {
			description: [
				"When a repository id is displayed, append these yum variables to the string if they are used in the I(baseurl)/etc. Variables are appended in the order listed (and found).",
			]

			default: "releasever basearch"
		}
		username: description: [
			"Username to use for basic authentication to a repo or really any url.",
		]
	}

	extends_documentation_fragment: [
		"files",
	]

	notes: [
		"All comments will be removed if modifying an existing repo file.",
		"Section order is preserved in an existing repo file.",
		"Parameters in a section are ordered alphabetically in an existing repo file.",
		"The repo file will be automatically deleted if it contains no repository.",
		"When removing a repository, beware that the metadata cache may still remain on disk until you run C(yum clean all). Use a notification handler for this.",
		"The C(params) parameter was removed in Ansible 2.5 due to circumventing Ansible's parameter handling",
	]
}
