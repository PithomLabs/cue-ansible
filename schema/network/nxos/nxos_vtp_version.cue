package ansible

module: nxos_vtp_version: {
	module:                         "nxos_vtp_version"
	extends_documentation_fragment: "nxos"
	version_added:                  "2.2"
	short_description:              "Manages VTP version configuration."
	description: [
		"Manages VTP version configuration.",
	]
	author: [
		"Gabriele Gerbino (@GGabriele)",
	]
	notes: [
		"Tested against NXOSv 7.3.(0)D1(1) on VIRL",
		"VTP feature must be active on the device to use this module.",
		"This module is used to manage only VTP version.",
		"Use this in combination with M(nxos_vtp_password) and M(nxos_vtp_version) to fully manage VTP operations.",
	]

	options: version: {
		description: [
			"VTP version number.",
		]
		required: true
		choices: ["1", "2"]
	}
}
