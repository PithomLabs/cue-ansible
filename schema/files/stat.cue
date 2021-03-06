package ansible

module: stat: {
	module:            "stat"
	version_added:     "1.3"
	short_description: "Retrieve file or file system status"
	description: [
		"Retrieves facts for a file similar to the Linux/Unix 'stat' command.",
		"For Windows targets, use the M(win_stat) module instead.",
	]
	options: {
		path: {
			description: [
				"The full path of the file/object to get the facts of.",
			]
			type:     "path"
			required: true
			aliases: ["dest", "name"]
		}
		follow: {
			description: [
				"Whether to follow symlinks.",
			]
			type:    "bool"
			default: false
		}
		get_checksum: {
			description: [
				"Whether to return a checksum of the file.",
			]
			type:          "bool"
			default:       true
			version_added: "1.8"
		}
		checksum_algorithm: {
			description: [
				"Algorithm to determine checksum of file.",
				"Will throw an error if the host is unable to use specified algorithm.",
				"The remote host has to support the hashing method specified, C(md5) can be unavailable if the host is FIPS-140 compliant.",
			]

			type: "str"
			choices: ["md5", "sha1", "sha224", "sha256", "sha384", "sha512"]
			default: "sha1"
			aliases: ["checksum", "checksum_algo"]
			version_added: "2.0"
		}
		get_mime: {
			description: [
				"Use file magic and return data about the nature of the file. this uses the 'file' utility found on most Linux/Unix systems.",
				"This will add both `mime_type` and 'charset' fields to the return, if possible.",
				"In Ansible 2.3 this option changed from 'mime' to 'get_mime' and the default changed to 'Yes'.",
			]
			type:    "bool"
			default: true
			aliases: ["mime", "mime_type", "mime-type"]
			version_added: "2.1"
		}
		get_attributes: {
			description: [
				"Get file attributes using lsattr tool if present.",
			]
			type:    "bool"
			default: true
			aliases: ["attr", "attributes"]
			version_added: "2.3"
		}
	}
	seealso: [{
		module: "file"
	}, {
		module: "win_stat"
	}]
	author: "Bruce Pennypacker (@bpennypacker)"
}
