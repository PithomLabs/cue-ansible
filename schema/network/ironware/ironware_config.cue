package ansible

module: ironware_config: {
	module:            "ironware_config"
	version_added:     "2.5"
	author:            "Paul Baker (@paulquack)"
	short_description: "Manage configuration sections on Extreme Ironware devices"
	description: [
		"Extreme Ironware configurations use a simple block indent file syntax for segmenting configuration into sections.  This module provides an implementation for working with Ironware configuration sections in a deterministic way.",
	]

	extends_documentation_fragment: "ironware"
	options: {
		lines: {
			description: [
				"The ordered set of commands that should be configured in the section.  The commands must be the exact same commands as found in the device running-config.  Be sure to note the configuration command syntax as some commands are automatically modified by the device config parser.",
			]

			aliases: ["commands"]
		}
		parents: description: [
			"The ordered set of parents that uniquely identify the section the commands should be checked against.  If the parents argument is omitted, the commands are checked against the set of top level or global commands.",
		]

		src: description: [
			"Specifies the source path to the file that contains the configuration or configuration template to load.  The path to the source file can either be the full path on the Ansible control host or a relative path from the playbook or role root directory.  This argument is mutually exclusive with I(lines), I(parents).",
		]

		before: description: [
			"The ordered set of commands to push on to the command stack if a change needs to be made.  This allows the playbook designer the opportunity to perform configuration commands prior to pushing any changes without affecting how the set of commands are matched against the system",
		]

		after: description: [
			"The ordered set of commands to append to the end of the command stack if a change needs to be made.  Just like with I(before) this allows the playbook designer to append a set of commands to be executed after the command set.",
		]

		match: {
			description: [
				"Instructs the module on the way to perform the matching of the set of commands against the current device config.  If match is set to I(line), commands are matched line by line.  If match is set to I(strict), command lines are matched with respect to position.  If match is set to I(exact), command lines must be an equal match.  Finally, if match is set to I(none), the module will not attempt to compare the source configuration with the running configuration on the remote device.",
			]

			default: "line"
			choices: ["line", "strict", "exact", "none"]
		}
		replace: {
			description: [
				"Instructs the module on the way to perform the configuration on the device.  If the replace argument is set to I(line) then the modified lines are pushed to the device in configuration mode.  If the replace argument is set to I(block) then the entire command block is pushed to the device in configuration mode if any line is not correct",
			]

			default: "line"
			choices: ["line", "block"]
		}
		update: {
			description: [
				"The I(update) argument controls how the configuration statements are processed on the remote device.  Valid choices for the I(update) argument are I(merge) and I(check).  When the argument is set to I(merge), the configuration changes are merged with the current device running configuration.  When the argument is set to I(check) the configuration updates are determined but not actually configured on the remote device.",
			]

			default: "merge"
			choices: ["merge", "check"]
		}
		commit: {
			description: [
				"This argument specifies the update method to use when applying the configuration changes to the remote node.  If the value is set to I(merge) the configuration updates are merged with the running- config.  If the value is set to I(check), no changes are made to the remote host.",
			]

			default: "merge"
			choices: ["merge", "check"]
		}
		backup: {
			description: [
				"This argument will cause the module to create a full backup of the current C(running-config) from the remote device before any changes are made. If the C(backup_options) value is not given, the backup file is written to the C(backup) folder in the playbook root directory.  If the directory does not exist, it is created.",
			]

			type:    "bool"
			default: "no"
		}
		config: description: [
			"The C(config) argument allows the playbook designer to supply the base configuration to be used to validate configuration changes necessary.  If this argument is provided, the module will not download the running-config from the remote node.",
		]

		save_when: {
			description: [
				"When changes are made to the device running-configuration, the changes are not copied to non-volatile storage by default.  Using this argument will change that before.  If the argument is set to I(always), then the running-config will always be copied to the startup-config and the I(modified) flag will always be set to True.  If the argument is set to I(modified), then the running-config will only be copied to the startup-config if it has changed since the last save to startup-config.  If the argument is set to I(never), the running-config will never be copied to the startup-config",
			]

			default: "never"
			choices: ["always", "never", "modified"]
			version_added: "2.4"
		}
		backup_options: {
			description: [
				"This is a dict object containing configurable options related to backup file path. The value of this option is read only when C(backup) is set to I(yes), if C(backup) is set to I(no) this option will be silently ignored.",
			]

			suboptions: {
				filename: description: [
					"The filename to be used to store the backup configuration. If the the filename is not given it will be generated based on the hostname, current time and date in format defined by <hostname>_config.<current-date>@<current-time>",
				]

				dir_path: {
					description: [
						"This option provides the path ending with directory name in which the backup configuration file will be stored. If the directory does not exist it will be first created and the filename is either the value of C(filename) or default filename as described in C(filename) options description. If the path value is not given in that case a I(backup) directory will be created in the current working directory and backup configuration will be copied in C(filename) within I(backup) directory.",
					]

					type: "path"
				}
			}
			type:          "dict"
			version_added: "2.8"
		}
	}
}
