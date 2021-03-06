package ansible

module: bigiq_regkey_license: {
	module:            "bigiq_regkey_license"
	short_description: "Manages licenses in a BIG-IQ registration key pool"
	description: [
		"Manages licenses in a BIG-IQ registration key pool.",
	]
	version_added: 2.5
	options: {
		regkey_pool: {
			description: [
				"The registration key pool that you want to place the license in.",
				"You must be mindful to name your registration pools unique names. While BIG-IQ does not require this, this module does. If you do not do this, the behavior of the module is undefined and you may end up putting licenses in the wrong registration key pool.",
			]

			type:     "str"
			required: true
		}
		license_key: {
			description: [
				"The license key to put in the pool.",
			]
			type:     "str"
			required: true
		}
		description: {
			description: [
				"Description of the license.",
			]
			type: "str"
		}
		accept_eula: {
			description: [
				"A key that signifies that you accept the F5 EULA for this license.",
				"A copy of the EULA can be found here https://askf5.f5.com/csp/article/K12902",
				"This is required when C(state) is C(present).",
			]
			type: "bool"
		}
		state: {
			description: [
				"The state of the regkey license in the pool on the system.",
				"When C(present), guarantees that the license exists in the pool.",
				"When C(absent), removes the license from the pool.",
			]
			type: "str"
			choices: [
				"absent",
				"present",
			]
			default: "present"
		}
	}
	requirements: [
		"BIG-IQ >= 5.3.0",
	]
	extends_documentation_fragment: "f5"
	author: ["Tim Rupp (@caphrim007)"]
}
