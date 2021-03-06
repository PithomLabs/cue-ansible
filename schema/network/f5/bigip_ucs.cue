package ansible

module: bigip_ucs: {
	module:            "bigip_ucs"
	short_description: "Manage upload, installation and removal of UCS files"
	description: [
		"Manage upload, installation and removal of UCS files.",
	]
	version_added: 2.4
	options: {
		include_chassis_level_config: {
			description: [
				"During restore of the UCS file, include chassis level configuration that is shared among boot volume sets. For example, cluster default configuration.",
			]

			type: "bool"
		}
		ucs: {
			description: [
				"The path to the UCS file to install. The parameter must be provided if the C(state) is either C(installed) or C(activated). When C(state) is C(absent), the full path for this parameter will be ignored and only the filename will be used to select a UCS for removal. Therefore you could specify C(/mickey/mouse/test.ucs) and this module would only look for C(test.ucs).",
			]

			type: "str"
		}
		force: {
			description: [
				"If C(yes) will upload the file every time and replace the file on the device. If C(no), the file will only be uploaded if it does not already exist. Generally should be C(yes) only in cases where you have reason to believe that the image was corrupted during upload.",
			]

			type:    "bool"
			default: false
		}
		no_license: {
			description: [
				"Performs a full restore of the UCS file and all the files it contains, with the exception of the license file. The option must be used to restore a UCS on RMA devices (Returned Materials Authorization).",
			]

			type: "bool"
		}
		no_platform_check: {
			description: [
				"Bypasses the platform check and allows a UCS that was created using a different platform to be installed. By default (without this option), a UCS created from a different platform is not allowed to be installed.",
			]

			type: "bool"
		}
		passphrase: {
			description: [
				"Specifies the passphrase that is necessary to load the specified UCS file.",
			]
			type: "str"
		}
		reset_trust: {
			description: [
				"When specified, the device and trust domain certs and keys are not loaded from the UCS. Instead, a new set is regenerated.",
			]

			type: "bool"
		}
		state: {
			description: [
				"When C(installed), ensures that the UCS is uploaded and installed, on the system. When C(present), ensures that the UCS is uploaded. When C(absent), the UCS will be removed from the system. When C(installed), the uploading of the UCS is idempotent, however the installation of that configuration is not idempotent.",
			]

			type: "str"
			choices: [
				"absent",
				"installed",
				"present",
			]
			default: "present"
		}
	}
	notes: [
		"Only the most basic checks are performed by this module. Other checks and considerations need to be taken into account. See the following URL. https://support.f5.com/kb/en-us/solutions/public/11000/300/sol11318.html",
		"This module does not handle devices with the FIPS 140 HSM",
		"This module does not handle BIG-IPs systems on the 6400, 6800, 8400, or 8800 hardware platform.",
		"This module does not verify that the new or replaced SSH keys from the UCS file are synchronized between the BIG-IP system and the SCCP",
		"This module does not support the 'rma' option",
		"This module does not support restoring a UCS archive on a BIG-IP 1500, 3400, 4100, 6400, 6800, or 8400 hardware platform other than the system from which the backup was created",
		"The UCS restore operation restores the full configuration only if the hostname of the target system matches the hostname on which the UCS archive was created. If the hostname does not match, only the shared configuration is restored. You can ensure hostnames match by using the C(bigip_hostname) Ansible module in a task before using this module.",
		"This module does not support re-licensing a BIG-IP restored from a UCS",
		"This module does not support restoring encrypted archives on replacement RMA units.",
	]

	extends_documentation_fragment: "f5"
	author: [
		"Tim Rupp (@caphrim007)",
		"Wojciech Wypior (@wojtek0806)",
	]
}
