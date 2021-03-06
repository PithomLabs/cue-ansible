package ansible

module: ucs_ntp_server: {
	module:            "ucs_ntp_server"
	short_description: "Configures NTP server on Cisco UCS Manager"
	extends_documentation_fragment: [
		"ucs",
	]
	description: [
		"Configures NTP server on Cisco UCS Manager.",
		"Examples can be used with the L(UCS Platform Emulator,https://communities.cisco.com/ucspe).",
	]
	options: {
		state: {
			description: [
				"If C(absent), will remove an NTP server.",
				"If C(present), will add or update an NTP server.",
			]
			choices: ["absent", "present"]
			default: "present"
		}

		ntp_server: {
			description: [
				"NTP server IP address or hostname.",
				"Enter up to 63 characters that form a valid hostname.",
				"Enter a valid IPV4 Address.",
			]
			aliases: ["name"]
			default: ""
		}

		description: {
			description: [
				"A user-defined description of the NTP server.",
				"Enter up to 256 characters.",
				"You can use any characters or spaces except the following:",
				"` (accent mark),  (backslash), ^ (carat), \" (double quote), = (equal sign), > (greater than), < (less than), or ' (single quote).",
			]
			aliases: ["descr"]
			default: ""
		}
	}

	requirements: [
		"ucsmsdk",
	]
	author: [
		"John McDonough (@movinalot)",
		"CiscoUcs (@CiscoUcs)",
	]
	version_added: "2.7"
}
