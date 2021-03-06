package ansible

module: win_inet_proxy: {
	module:            "win_inet_proxy"
	version_added:     "2.8"
	short_description: "Manages proxy settings for WinINet and Internet Explorer"
	description: [
		"Used to set or remove proxy settings for Windows INet which includes Internet Explorer.",
		"WinINet is a framework used by interactive applications to submit web requests through.",
		"The proxy settings can also be used by other applications like Firefox, Chrome, and others but there is no definitive list.",
	]

	options: {
		auto_detect: {
			description: [
				"Whether to configure WinINet to automatically detect proxy settings through Web Proxy Auto-Detection C(WPAD).",
				"This corresponds to the checkbox I(Automatically detect settings) in the connection settings window.",
			]

			default: true
			type:    "bool"
		}
		auto_config_url: {
			description: [
				"The URL of a proxy configuration script.",
				"Proxy configuration scripts are typically JavaScript files with the C(.pac) extension that implement the C(FindProxyForURL(url, host) function.",
				"Omit, set to null or an empty string to remove the auto config URL.",
				"This corresponds to the checkbox I(Use automatic configuration script) in the connection settings window.",
			]

			type: "str"
		}
		bypass: {
			description: [
				"A list of hosts that will bypass the set proxy when being accessed.",
				"Use C(<local>) to match hostnames that are not fully qualified domain names. This is useful when needing to connect to intranet sites using just the hostname. If defined, this should be the last entry in the bypass list.",
				"Use C(<-loopback>) to stop automatically bypassing the proxy when connecting through any loopback address like C(127.0.0.1), C(localhost), or the local hostname.",
				"Omit, set to null or an empty string/list to remove the bypass list.",
				"If this is set then I(proxy) must also be set.",
			]
			type: "list"
		}
		connection: {
			description: [
				"The name of the IE connection to set the proxy settings for.",
				"These are the connections under the I(Dial-up and Virtual Private Network) header in the IE settings.",
				"When omitted, the default LAN connection is used.",
			]
			type: "str"
		}
		proxy: description: [
			"A string or dict that specifies the proxy to be set.",
			"If setting a string, should be in the form C(hostname), C(hostname:port), or C(protocol=hostname:port).",
			"If the port is undefined, the default port for the protocol in use is used.",
			"If setting a dict, the keys should be the protocol and the values should be the hostname and/or port for that protocol.",
			"Valid protocols are C(http), C(https), C(ftp), and C(socks).",
			"Omit, set to null or an empty string to remove the proxy settings.",
		]
	}
	notes: [
		"This is not the same as the proxy settings set in WinHTTP through the C(netsh) command. Use the M(win_http_proxy) module to manage that instead.",
		"These settings are by default set per user and not system wide. A registry property must be set independently from this module if you wish to apply the proxy for all users. See examples for more detail.",
		"If per user proxy settings are desired, use I(become) to become any local user on the host. No password is needed to be set for this to work.",
		"If the proxy requires authentication, set the credentials using the M(win_credential) module. This requires I(become) to be used so the credential store can be accessed.",
	]

	seealso: [{
		module: "win_http_proxy"
	}, {
		module: "win_credential"
	}]
	author: ["Jordan Borean (@jborean93)"]
}
