package ansible

module: idrac_firmware: {
	module:            "idrac_firmware"
	short_description: "Firmware update from a repository on a network share (CIFS, NFS)."
	version_added:     "2.8"
	description: [
		"Update the Firmware by connecting to a network share (either CIFS or NFS) that contains a catalog of available updates.",
		"Network share should contain a valid repository of Update Packages (DUPs) and a catalog file describing the DUPs.",
		"All applicable updates contained in the repository are applied to the system.",
		"This feature is available only with iDRAC Enterprise License.",
	]
	options: {
		idrac_ip: {
			description: "iDRAC IP Address."
			type:        "str"
			required:    true
		}
		idrac_user: {
			description: "iDRAC username."
			type:        "str"
			required:    true
		}
		idrac_password: {
			description: "iDRAC user password."
			type:        "str"
			required:    true
			aliases: ["idrac_pwd"]
		}
		idrac_port: {
			description: "iDRAC port."
			type:        "int"
			default:     443
		}
		share_name: {
			description: "CIFS or NFS Network share."
			type:        "str"
			required:    true
		}
		share_user: {
			description: "Network share user in the format 'user@domain' or 'domain\\\\user' if user is part of a domain else 'user'. This option is mandatory for CIFS Network Share."

			type: "str"
		}
		share_password: {
			description: "Network share user password. This option is mandatory for CIFS Network Share."
			type:        "str"
			aliases: ["share_pwd"]
		}
		share_mnt: {
			description: "Local mount path of the network share with read-write permission for ansible user. This option is mandatory for Network Share."

			type:     "str"
			required: true
		}
		reboot: {
			description: "Whether to reboots after applying the updates or not."
			type:        "bool"
			default:     false
		}
		job_wait: {
			description: "Whether to wait for job completion or not."
			type:        "bool"
			default:     true
		}
		catalog_file_name: {
			required:    false
			description: "Catalog file name relative to the I(share_name)."
			type:        "str"
			default:     "Catalog.xml"
		}
	}

	requirements: [
		"omsdk",
		"python >= 2.7.5",
	]
	author: "Rajeev Arakkal (@rajeevarakkal)"
}
