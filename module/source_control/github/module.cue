package github

github_key :: {
	tags?: [...string]
	notify?:   string | [...string]
	name?:     string
	register?: string
	vars?: {...}
	when?: string
	github_key: {

		// The default is C(yes), which will replace the existing remote key if it's different than C(pubkey). If C(no), the key will only be set if no key with the given C(name) exists.

		force?: bool

		// SSH key name

		name: string

		// SSH public key value. Required when C(state=present).

		pubkey?: string

		// Whether to remove a key, ensure that it exists, or update its value.

		state?: string

		// GitHub Access Token with permission to list and create public keys.

		token: string
	}
}

github_webhook :: {
	tags?: [...string]
	notify?:   string | [...string]
	name?:     string
	register?: string
	vars?: {...}
	when?: string
	github_webhook: {

		// Full name of the repository to configure a hook for

		repository: string

		// Whether the hook should be present or absent

		state?: string

		// Token to authenticate to GitHub with

		token?: string

		// The media type used to serialize the payloads

		content_type?: string

		// A list of GitHub events the hook is triggered for. Events are listed at U(https://developer.github.com/v3/activity/events/types/). Required unless C(state) is C(absent)

		events?: string

		// Password to authenticate to GitHub with

		password?: string

		// The shared secret between GitHub and the payload URL.

		secret?: string

		// URL to which payloads will be delivered

		url: string

		// User to authenticate to GitHub as

		user: string

		// Whether or not the hook is active

		active?: bool

		// Base URL of the GitHub API

		github_url?: string

		// Flag to indicate that GitHub should skip SSL verification when calling the hook.

		insecure_ssl?: bool
	}
}

github_webhook_info :: {
	tags?: [...string]
	notify?:   string | [...string]
	name?:     string
	register?: string
	vars?: {...}
	when?: string
	github_webhook_info: {

		// Full name of the repository to configure a hook for

		repository: string

		// Token to authenticate to GitHub with

		token?: string

		// User to authenticate to GitHub as

		user: string

		// Base URL of the github api

		github_url?: string

		// Password to authenticate to GitHub with

		password?: string
	}
}

hg :: {
	tags?: [...string]
	notify?:   string | [...string]
	name?:     string
	register?: string
	vars?: {...}
	when?: string
	hg: {

		// If C(no), do not clone the repository if it does not exist locally.

		clone?: bool

		// Absolute path of where the repository should be cloned to. This parameter is required, unless clone and update are set to no

		dest: string

		// Path to hg executable to use. If not supplied, the normal mechanism for resolving binary paths will be used.

		executable?: string

		// Discards uncommitted changes. Runs C(hg update -C).  Prior to 1.9, the default was `yes`.

		force?: bool

		// Deletes untracked files. Runs C(hg purge).

		purge?: bool

		// The repository address.

		repo: string

		// Equivalent C(-r) option in hg command which could be the changeset, revision number, branch name or even tag.

		revision?: string

		// If C(no), do not retrieve new revisions from the origin repository

		update?: bool
	}
}

github_deploy_key :: {
	tags?: [...string]
	notify?:   string | [...string]
	name?:     string
	register?: string
	vars?: {...}
	when?: string
	github_deploy_key: {

		// The 6 digit One Time Password for 2-Factor Authentication. Required together with I(username) and I(password).

		otp?: string

		// The name of the individual account or organization that owns the GitHub repository.

		owner: string

		// The state of the deploy key.

		state?: string

		// The OAuth2 token or personal access token to authenticate with. Mutually exclusive with I(password).

		token?: string

		// If C(true), forcefully adds the deploy key by deleting any existing deploy key with the same public key or title.

		force?: bool

		// The SSH public key to add to the repository as a deploy key.

		key: string

		// If C(true), the deploy key will only be able to read repository contents. Otherwise, the deploy key will be able to read and write.

		read_only?: bool

		// The name of the GitHub repository.

		repo: string

		// The username to authenticate with. Should not be set when using personal access token

		username?: string

		// The name for the deploy key.

		name: string

		// The password to authenticate with. Alternatively, a personal access token can be used instead of I(username) and I(password) combination.

		password?: string
	}
}

github_issue :: {
	tags?: [...string]
	notify?:   string | [...string]
	name?:     string
	register?: string
	vars?: {...}
	when?: string
	github_issue: {

		// Get various details about issue depending upon action specified.

		action?: string

		// Issue number for which information is required.

		issue: string

		// Name of the GitHub organization in which the repository is hosted.

		organization: string

		// Name of repository from which issue needs to be retrieved.

		repo: string
	}
}

git_config :: {
	tags?: [...string]
	notify?:   string | [...string]
	name?:     string
	register?: string
	vars?: {...}
	when?: string
	git_config: {

		// Indicates the setting should be set/unset. This parameter has higher precedence than I(value) parameter: when I(state)=absent and I(value) is defined, I(value) is discarded.

		state?: string

		// When specifying the name of a single setting, supply a value to set that setting to the given value.

		value?: string

		// List all settings (optionally limited to a given I(scope))

		list_all?: bool

		// The name of the setting. If no value is supplied, the value will be read from the config if it has been set.

		name?: string

		// Path to a git repository for reading and writing values from a specific repo.

		repo?: string

		// Specify which scope to read/set values from. This is required when setting config values. If this is set to local, you must also specify the repo parameter. It defaults to system only when not using I(list_all)=yes.

		scope?: string
	}
}

github_hooks :: {
	tags?: [...string]
	notify?:   string | [...string]
	name?:     string
	register?: string
	vars?: {...}
	when?: string
	github_hooks: {

		// If C(no), SSL certificates for the target repo will not be validated. This should only be used on personally controlled sites using self-signed certificates.

		validate_certs?: bool

		// This tells the githooks module what you want it to do.

		action: string

		// Content type to use for requests made to the webhook

		content_type?: string

		// When creating a new hook, this is the url that you want GitHub to post to. It is only required when creating a new hook.

		hookurl?: string

		// The oauth key provided by GitHub. It can be found/generated on GitHub under "Edit Your Profile" >> "Developer settings" >> "Personal Access Tokens"

		oauthkey: string

		// This is the API url for the repository you want to manage hooks for. It should be in the form of: https://api.github.com/repos/user:/repo:. Note this is different than the normal repo url.

		repo: string

		// GitHub username.

		user: string
	}
}

github_release :: {
	tags?: [...string]
	notify?:   string | [...string]
	name?:     string
	register?: string
	vars?: {...}
	when?: string
	github_release: {

		// Target of release when creating a release

		target?: string

		// Description of the release when creating a release

		body?: string

		// The GitHub account password for the user. Mutually exclusive with C(token).

		password?: string

		// Sets if the release is a prerelease or not. (boolean)

		prerelease?: bool

		// Repository name

		repo: string

		// GitHub Personal Access Token for authenticating. Mutually exclusive with C(password).

		token?: string

		// The GitHub account that owns the repository

		user: string

		// Action to perform

		action: string

		// Sets if the release is a draft or not. (boolean)

		draft?: bool

		// Name of release when creating a release

		name?: string

		// Tag name when creating a release. Required when using action is set to C(create_release).

		tag?: string
	}
}

subversion :: {
	tags?: [...string]
	notify?:   string | [...string]
	name?:     string
	register?: string
	vars?: {...}
	when?: string
	subversion: {

		// Path to svn executable to use. If not supplied, the normal mechanism for resolving binary paths will be used.

		executable?: string

		// If C(yes), modified files will be discarded. If C(no), module will fail if it encounters modified files. Prior to 1.9 the default was C(yes).

		force?: bool

		// C(--password) parameter passed to svn.

		password?: string

		// The subversion URL to the repository.

		repo: string

		// Specific revision to checkout.

		revision?: string

		// C(--username) parameter passed to svn.

		username?: string

		// Absolute path where the repository should be deployed.

		dest: string

		// If C(yes), do export instead of checkout/update.

		export?: bool

		// If the directory exists, then the working copy will be checked-out over-the-top using svn checkout --force; if force is specified then existing files with different content are reverted

		in_place?: bool

		// If C(no), do not call svn switch before update.

		switch?: bool

		// If C(no), do not retrieve new revisions from the origin repository.

		update?: bool

		// If C(no), do not check out the repository if it does not exist locally.

		checkout?: bool
	}
}

bzr :: {
	tags?: [...string]
	notify?:   string | [...string]
	name?:     string
	register?: string
	vars?: {...}
	when?: string
	bzr: {

		// SSH or HTTP protocol address of the parent branch.

		name: string

		// What version of the branch to clone.  This can be the bzr revno or revid.

		version?: string

		// Absolute path of where the branch should be cloned to.

		dest: string

		// Path to bzr executable to use. If not supplied, the normal mechanism for resolving binary paths will be used.

		executable?: string

		// If C(yes), any modified files in the working tree will be discarded.  Before 1.9 the default value was C(yes).

		force?: bool
	}
}

git :: {
	tags?: [...string]
	notify?:   string | [...string]
	name?:     string
	register?: string
	vars?: {...}
	when?: string
	git: {

		// The path of where the repository should be checked out. This parameter is required, unless C(clone) is set to C(no).

		dest: string

		// if C(no), repository will be cloned without the --recursive option, skipping sub-modules.

		recursive?: bool

		// Creates a wrapper script and exports the path as GIT_SSH which git then automatically uses to override ssh arguments. An example value could be "-o StrictHostKeyChecking=no" (although this particular option is better set via C(accept_hostkey)).

		ssh_opts?: string

		// What version of the repository to check out.  This can be the literal string C(HEAD), a branch name, a tag name. It can also be a I(SHA-1) hash, in which case C(refspec) needs to be specified if the given revision is not already available.

		version?: string

		// Specify an optional private key file path, on the target host, to use for the checkout.

		key_file?: string

		// Name of the remote.

		remote?: string

		// if C(yes), ensure that "-o StrictHostKeyChecking=no" is present as an ssh option.

		accept_hostkey?: bool

		// If C(no), do not clone the repository even if it does not exist locally

		clone?: bool

		// Create a shallow clone with a history truncated to the specified number or revisions. The minimum possible value is C(1), otherwise ignored. Needs I(git>=1.9.1) to work correctly.

		depth?: string

		// If C(yes), any modified files in the working repository will be discarded.  Prior to 0.7, this was always 'yes' and could not be disabled.  Prior to 1.9, the default was `yes`

		force?: bool

		// The umask to set before doing any checkouts, or any other repository maintenance.

		umask?: string

		// If C(no), do not retrieve new revisions from the origin repository
		// Operations like archive will work on the existing (old) repository and might not respond to changes to the options version or remote.

		update?: bool

		// if C(yes), repository will be created as a bare repo, otherwise it will be a standard repo with a workspace.

		bare?: bool

		// Reference repository (see "git clone --reference ...")

		reference?: string

		// Add an additional refspec to be fetched. If version is set to a I(SHA-1) not reachable from any branch or tag, this option may be necessary to specify the ref containing the I(SHA-1). Uses the same syntax as the 'git fetch' command. An example value could be "refs/meta/config".

		refspec?: string

		// if C(yes), submodules will track the latest commit on their master branch (or other branch specified in .gitmodules).  If C(no), submodules will be kept at the revision specified by the main project. This is equivalent to specifying the --remote flag to git submodule update.

		track_submodules?: bool

		// The path to place the cloned repository. If specified, Git repository can be separated from working tree.

		separate_git_dir?: string

		// if C(yes), when cloning or checking out a C(version) verify the signature of a GPG signed commit. This requires C(git) version>=2.1.0 to be installed. The commit MUST be signed and the public key MUST be present in the GPG keyring.

		verify_commit?: bool

		// Specify archive file path with extension. If specified, creates an archive file of the specified format containing the tree structure for the source tree. Allowed archive formats ["zip", "tar.gz", "tar", "tgz"]
		// This will clone and perform git archive from local directory as not all git servers support git archive.

		archive?: string

		// Path to git executable to use. If not supplied, the normal mechanism for resolving binary paths will be used.

		executable?: string

		// A list of trusted GPG fingerprints to compare to the fingerprint of the GPG-signed commit.
		// Only used when I(verify_commit=yes).

		gpg_whitelist?: [...]

		// git, SSH, or HTTP(S) protocol address of the git repository.

		repo: string
	}
}
