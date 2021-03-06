package ansible

module: facter: {
	module:            "facter"
	short_description: "Runs the discovery program I(facter) on the remote system"
	description: [
		"Runs the I(facter) discovery program (U(https://github.com/puppetlabs/facter)) on the remote system, returning JSON data that can be useful for inventory purposes.",
	]

	version_added: "0.2"
	requirements: [
		"facter",
		"ruby-json",
	]
	author: [
		"Ansible Core Team",
		"Michael DeHaan",
	]
}
