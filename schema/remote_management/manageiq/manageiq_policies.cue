package ansible

module: manageiq_policies: {
	module: "manageiq_policies"

	short_description:              "Management of resource policy_profiles in ManageIQ."
	extends_documentation_fragment: "manageiq"
	version_added:                  "2.5"
	author:                         "Daniel Korn (@dkorn)"
	description: [
		"The manageiq_policies module supports adding and deleting policy_profiles in ManageIQ.",
	]

	options: {
		state: {
			description: [
				"absent - policy_profiles should not exist,",
				"present - policy_profiles should exist,",
				"list - list current policy_profiles and policies.",
			]
			choices: ["absent", "present", "list"]
			default: "present"
		}
		policy_profiles: description: [
			"list of dictionaries, each includes the policy_profile 'name' key.",
			"required if state is present or absent.",
		]
		resource_type: {
			description: [
				"the type of the resource to which the profile should be [un]assigned",
			]
			required: true
			choices: [
				"provider",
				"host",
				"vm",
				"blueprint",
				"category",
				"cluster",
				"data store",
				"group",
				"resource pool",
				"service",
				"service template",
				"template",
				"tenant",
				"user",
			]
		}
		resource_name: {
			description: [
				"the name of the resource to which the profile should be [un]assigned",
			]
			required: true
		}
	}
}
