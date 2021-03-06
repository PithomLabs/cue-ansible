package ansible

module: win_netbios: {
	module:            "win_netbios"
	version_added:     "2.9"
	short_description: "Manage NetBIOS over TCP/IP settings on Windows."
	description: [
		"Enables or disables NetBIOS on Windows network adapters.",
		"Can be used to protect a system against NBT-NS poisoning and avoid NBNS broadcast storms.",
		"Settings can be applied system wide or per adapter.",
	]
	options: {
		state: {
			description: [
				"Whether NetBIOS should be enabled, disabled, or default (use setting from DHCP server or if static IP address is assigned enable NetBIOS).",
			]
			choices: [
				"enabled",
				"disabled",
				"default",
			]
			required: true
			type:     "str"
		}
		adapter_names: {
			description: [
				"List of adapter names for which to manage NetBIOS settings. If this option is omitted then configuration is applied to all adapters on the system.",
				"The adapter name used is the connection caption in the Network Control Panel or via C(Get-NetAdapter), eg C(Ethernet 2).",
			]
			type:     "list"
			required: false
		}
	}

	author: [
		"Thomas Moore (@tmmruk)",
	]
	notes: [
		"Changing NetBIOS settings does not usually require a reboot and will take effect immediately.",
		"UDP port 137/138/139 will no longer be listening once NetBIOS is disabled.",
	]
}
