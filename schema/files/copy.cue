package ansible

module: copy: {
	module:            "copy"
	version_added:     "historical"
	short_description: "Copy files to remote locations"
	description: [
		"The C(copy) module copies a file from the local or remote machine to a location on the remote machine.",
		"Use the M(fetch) module to copy files from remote locations to the local box.",
		"If you need variable interpolation in copied files, use the M(template) module. Using a variable in the C(content) field will result in unpredictable output.",
		"For Windows targets, use the M(win_copy) module instead.",
	]
	options: {
		src: {
			description: [
				"Local path to a file to copy to the remote server.",
				"This can be absolute or relative.",
				"If path is a directory, it is copied recursively. In this case, if path ends with \"/\", only inside contents of that directory are copied to destination. Otherwise, if it does not end with \"/\", the directory itself with all contents is copied. This behavior is similar to the C(rsync) command line tool.",
			]

			type: "path"
		}
		content: {
			description: [
				"When used instead of C(src), sets the contents of a file directly to the specified value.",
				"Works only when C(dest) is a file. Creates the file if it does not exist.",
				"For advanced formatting or if C(content) contains a variable, use the M(template) module.",
			]
			type:          "str"
			version_added: "1.1"
		}
		dest: {
			description: [
				"Remote absolute path where the file should be copied to.",
				"If C(src) is a directory, this must be a directory too.",
				"If C(dest) is a non-existent path and if either C(dest) ends with \"/\" or C(src) is a directory, C(dest) is created.",
				"If I(dest) is a relative path, the starting directory is determined by the remote host.",
				"If C(src) and C(dest) are files, the parent directory of C(dest) is not created and the task fails if it does not already exist.",
			]
			type:     "path"
			required: true
		}
		backup: {
			description: [
				"Create a backup file including the timestamp information so you can get the original file back if you somehow clobbered it incorrectly.",
			]
			type:          "bool"
			default:       false
			version_added: "0.7"
		}
		force: {
			description: [
				"Influence whether the remote file must always be replaced.",
				"If C(yes), the remote file will be replaced when contents are different than the source.",
				"If C(no), the file will only be transferred if the destination does not exist.",
				"Alias C(thirsty) has been deprecated and will be removed in 2.13.",
			]
			type:    "bool"
			default: true
			aliases: ["thirsty"]
			version_added: "1.1"
		}
		mode: {
			description: [
				"The permissions of the destination file or directory.",
				"For those used to C(/usr/bin/chmod) remember that modes are actually octal numbers. You must either add a leading zero so that Ansible's YAML parser knows it is an octal number (like C(0644) or C(01777))or quote it (like C('644') or C('1777')) so Ansible receives a string and can do its own conversion from string into number. Giving Ansible a number without following one of these rules will end up with a decimal number which will have unexpected results.",
				"As of Ansible 1.8, the mode may be specified as a symbolic mode (for example, C(u+rwx) or C(u=rw,g=r,o=r)).",
				"As of Ansible 2.3, the mode may also be the special string C(preserve).",
				"C(preserve) means that the file will be given the same permissions as the source file.",
			]
			type: "path"
		}
		directory_mode: {
			description: [
				"When doing a recursive copy set the mode for the directories.",
				"If this is not set we will use the system defaults.",
				"The mode is only set on directories which are newly created, and will not affect those that already existed.",
			]
			type:          "raw"
			version_added: "1.5"
		}
		remote_src: {
			description: [
				"Influence whether C(src) needs to be transferred or already is present remotely.",
				"If C(no), it will search for C(src) at originating/master machine.",
				"If C(yes) it will go to the remote/target machine for the C(src).",
				"C(remote_src) supports recursive copying as of version 2.8.",
				"C(remote_src) only works with C(mode=preserve) as of version 2.6.",
			]
			type:          "bool"
			default:       false
			version_added: "2.0"
		}
		follow: {
			description: [
				"This flag indicates that filesystem links in the destination, if they exist, should be followed.",
			]
			type:          "bool"
			default:       false
			version_added: "1.8"
		}
		local_follow: {
			description: [
				"This flag indicates that filesystem links in the source tree, if they exist, should be followed.",
			]
			type:          "bool"
			default:       true
			version_added: "2.4"
		}
		checksum: {
			description: [
				"SHA1 checksum of the file being transferred.",
				"Used to validate that the copy of the file was successful.",
				"If this is not provided, ansible will use the local calculated checksum of the src file.",
			]
			type:          "str"
			version_added: "2.5"
		}
	}
	extends_documentation_fragment: [
		"decrypt",
		"files",
		"validate",
	]
	notes: [
		"The M(copy) module recursively copy facility does not scale to lots (>hundreds) of files.",
	]
	seealso: [{
		module: "assemble"
	}, {
		module: "fetch"
	}, {
		module: "file"
	}, {
		module: "synchronize"
	}, {
		module: "template"
	}, {
		module: "win_copy"
	}]
	author: [
		"Ansible Core Team",
		"Michael DeHaan",
	]
}
