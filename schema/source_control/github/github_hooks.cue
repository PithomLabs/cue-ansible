package ansible

module: github_hooks: {
	module:            "github_hooks"
	short_description: "Manages GitHub service hooks."
	deprecated: {
		removed_in:  "2.12"
		why:         "Replaced by more granular modules"
		alternative: "Use M(github_webhook) and M(github_webhook_info) instead."
	}
	description: [
		"Adds service hooks and removes service hooks that have an error status.",
	]
	version_added: "1.4"
	options: {
		user: {
			description: [
				"GitHub username.",
			]
			required: true
		}
		oauthkey: {
			description: [
				"The oauth key provided by GitHub. It can be found/generated on GitHub under \"Edit Your Profile\" >> \"Developer settings\" >> \"Personal Access Tokens\"",
			]
			required: true
		}
		repo: {
			description: [
				"""
		This is the API url for the repository you want to manage hooks for. It should be in the form of: https://api.github.com/repos/user:/repo:. Note this is different than the normal repo url.

		""",
			]

			required: true
		}
		hookurl: {
			description: [
				"When creating a new hook, this is the url that you want GitHub to post to. It is only required when creating a new hook.",
			]
			required: false
		}
		action: {
			description: [
				"This tells the githooks module what you want it to do.",
			]
			required: true
			choices: ["create", "cleanall", "list", "clean504"]
		}
		validate_certs: {
			description: [
				"If C(no), SSL certificates for the target repo will not be validated. This should only be used on personally controlled sites using self-signed certificates.",
			]

			required: false
			default:  "yes"
			type:     "bool"
		}
		content_type: {
			description: [
				"Content type to use for requests made to the webhook",
			]
			required: false
			default:  "json"
			choices: ["json", "form"]
		}
	}

	author: "Phillip Gentry, CX Inc (@pcgentry)"
}
