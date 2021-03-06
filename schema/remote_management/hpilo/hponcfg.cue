package ansible

module: hponcfg: {
	module:            "hponcfg"
	author:            "Dag Wieers (@dagwieers)"
	version_added:     "2.3"
	short_description: "Configure HP iLO interface using hponcfg"
	description: [
		"This modules configures the HP iLO interface using hponcfg.",
	]
	options: {
		path: {
			description: [
				"The XML file as accepted by hponcfg.",
			]
			required: true
			aliases: ["src"]
		}
		minfw: {
			description: [
				"The minimum firmware level needed.",
			]
			required: false
		}
		executable: {
			description: [
				"Path to the hponcfg executable (`hponcfg` which uses $PATH).",
			]
			default:       "hponcfg"
			version_added: "2.4"
		}
		verbose: {
			description: [
				"Run hponcfg in verbose mode (-v).",
			]
			default:       false
			type:          "bool"
			version_added: "2.4"
		}
	}
	requirements: [
		"hponcfg tool",
	]
	notes: ["You need a working hponcfg on the target system."]
}
