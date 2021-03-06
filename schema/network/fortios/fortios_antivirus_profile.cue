package ansible

module: fortios_antivirus_profile: {
	module:            "fortios_antivirus_profile"
	short_description: "Configure AntiVirus profiles in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify antivirus feature and profile category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
	]

	version_added: "2.8"
	author: [
		"Miguel Angel Munoz (@mamunozgonzalez)",
		"Nicolas Thomas (@thomnico)",
	]
	notes: [
		"Requires fortiosapi library developed by Fortinet",
		"Run as a local_action in your playbook",
	]
	requirements: [
		"fortiosapi>=0.9.8",
	]
	options: {
		host: {
			description: [
				"FortiOS or FortiGate IP address.",
			]
			type:     "str"
			required: false
		}
		username: {
			description: [
				"FortiOS or FortiGate username.",
			]
			type:     "str"
			required: false
		}
		password: {
			description: [
				"FortiOS or FortiGate password.",
			]
			type:    "str"
			default: ""
		}
		vdom: {
			description: [
				"Virtual domain, among those defined previously. A vdom is a virtual instance of the FortiGate that can be configured and used as a different unit.",
			]

			type:    "str"
			default: "root"
		}
		https: {
			description: [
				"Indicates if the requests towards FortiGate must use HTTPS protocol.",
			]
			type:    "bool"
			default: true
		}
		ssl_verify: {
			description: [
				"Ensures FortiGate certificate must be verified by a proper CA.",
			]
			type:          "bool"
			default:       true
			version_added: 2.9
		}
		state: {
			description: [
				"Indicates whether to create or remove the object. This attribute was present already in previous version in a deeper level. It has been moved out to this outer level.",
			]

			type:     "str"
			required: false
			choices: [
				"present",
				"absent",
			]
			version_added: 2.9
		}
		antivirus_profile: {
			description: [
				"Configure AntiVirus profiles.",
			]
			default: null
			type:    "dict"
			suboptions: {
				state: {
					description: [
						"B(Deprecated)",
						"Starting with Ansible 2.9 we recommend using the top-level 'state' parameter.",
						"HORIZONTALLINE",
						"Indicates whether to create or remove the object.",
					]
					type:     "str"
					required: false
					choices: [
						"present",
						"absent",
					]
				}
				analytics_bl_filetype: {
					description: [
						"Only submit files matching this DLP file-pattern to FortiSandbox. Source dlp.filepattern.id.",
					]
					type: "int"
				}
				analytics_db: {
					description: [
						"Enable/disable using the FortiSandbox signature database to supplement the AV signature databases.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				analytics_max_upload: {
					description: [
						"Maximum size of files that can be uploaded to FortiSandbox (1 - 395 MBytes).",
					]
					type: "int"
				}
				analytics_wl_filetype: {
					description: [
						"Do not submit files matching this DLP file-pattern to FortiSandbox. Source dlp.filepattern.id.",
					]
					type: "int"
				}
				av_block_log: {
					description: [
						"Enable/disable logging for AntiVirus file blocking.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				av_virus_log: {
					description: [
						"Enable/disable AntiVirus logging.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				comment: {
					description: [
						"Comment.",
					]
					type: "str"
				}
				content_disarm: {
					description: [
						"AV Content Disarm and Reconstruction settings.",
					]
					type: "dict"
					suboptions: {
						cover_page: {
							description: [
								"Enable/disable inserting a cover page into the disarmed document.",
							]
							type: "str"
							choices: [
								"disable",
								"enable",
							]
						}
						detect_only: {
							description: [
								"Enable/disable only detect disarmable files, do not alter content.",
							]
							type: "str"
							choices: [
								"disable",
								"enable",
							]
						}
						office_embed: {
							description: [
								"Enable/disable stripping of embedded objects in Microsoft Office documents.",
							]
							type: "str"
							choices: [
								"disable",
								"enable",
							]
						}
						office_hylink: {
							description: [
								"Enable/disable stripping of hyperlinks in Microsoft Office documents.",
							]
							type: "str"
							choices: [
								"disable",
								"enable",
							]
						}
						office_linked: {
							description: [
								"Enable/disable stripping of linked objects in Microsoft Office documents.",
							]
							type: "str"
							choices: [
								"disable",
								"enable",
							]
						}
						office_macro: {
							description: [
								"Enable/disable stripping of macros in Microsoft Office documents.",
							]
							type: "str"
							choices: [
								"disable",
								"enable",
							]
						}
						original_file_destination: {
							description: [
								"Destination to send original file if active content is removed.",
							]
							type: "str"
							choices: [
								"fortisandbox",
								"quarantine",
								"discard",
							]
						}
						pdf_act_form: {
							description: [
								"Enable/disable stripping of actions that submit data to other targets in PDF documents.",
							]
							type: "str"
							choices: [
								"disable",
								"enable",
							]
						}
						pdf_act_gotor: {
							description: [
								"Enable/disable stripping of links to other PDFs in PDF documents.",
							]
							type: "str"
							choices: [
								"disable",
								"enable",
							]
						}
						pdf_act_java: {
							description: [
								"Enable/disable stripping of actions that execute JavaScript code in PDF documents.",
							]
							type: "str"
							choices: [
								"disable",
								"enable",
							]
						}
						pdf_act_launch: {
							description: [
								"Enable/disable stripping of links to external applications in PDF documents.",
							]
							type: "str"
							choices: [
								"disable",
								"enable",
							]
						}
						pdf_act_movie: {
							description: [
								"Enable/disable stripping of embedded movies in PDF documents.",
							]
							type: "str"
							choices: [
								"disable",
								"enable",
							]
						}
						pdf_act_sound: {
							description: [
								"Enable/disable stripping of embedded sound files in PDF documents.",
							]
							type: "str"
							choices: [
								"disable",
								"enable",
							]
						}
						pdf_embedfile: {
							description: [
								"Enable/disable stripping of embedded files in PDF documents.",
							]
							type: "str"
							choices: [
								"disable",
								"enable",
							]
						}
						pdf_hyperlink: {
							description: [
								"Enable/disable stripping of hyperlinks from PDF documents.",
							]
							type: "str"
							choices: [
								"disable",
								"enable",
							]
						}
						pdf_javacode: {
							description: [
								"Enable/disable stripping of JavaScript code in PDF documents.",
							]
							type: "str"
							choices: [
								"disable",
								"enable",
							]
						}
					}
				}
				extended_log: {
					description: [
						"Enable/disable extended logging for antivirus.",
					]
					type: "str"
					choices: [
						"enable",
						"disable",
					]
				}
				ftgd_analytics: {
					description: [
						"Settings to control which files are uploaded to FortiSandbox.",
					]
					type: "str"
					choices: [
						"disable",
						"suspicious",
						"everything",
					]
				}
				ftp: {
					description: [
						"Configure FTP AntiVirus options.",
					]
					type: "dict"
					suboptions: {
						archive_block: {
							description: [
								"Select the archive types to block.",
							]
							type: "str"
							choices: [
								"encrypted",
								"corrupted",
								"partiallycorrupted",
								"multipart",
								"nested",
								"mailbomb",
								"fileslimit",
								"timeout",
								"unhandled",
							]
						}
						archive_log: {
							description: [
								"Select the archive types to log.",
							]
							type: "str"
							choices: [
								"encrypted",
								"corrupted",
								"partiallycorrupted",
								"multipart",
								"nested",
								"mailbomb",
								"fileslimit",
								"timeout",
								"unhandled",
							]
						}
						emulator: {
							description: [
								"Enable/disable the virus emulator.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						options: {
							description: [
								"Enable/disable FTP AntiVirus scanning, monitoring, and quarantine.",
							]
							type: "str"
							choices: [
								"scan",
								"avmonitor",
								"quarantine",
							]
						}
						outbreak_prevention: {
							description: [
								"Enable FortiGuard Virus Outbreak Prevention service.",
							]
							type: "str"
							choices: [
								"disabled",
								"files",
								"full-archive",
							]
						}
					}
				}
				http: {
					description: [
						"Configure HTTP AntiVirus options.",
					]
					type: "dict"
					suboptions: {
						archive_block: {
							description: [
								"Select the archive types to block.",
							]
							type: "str"
							choices: [
								"encrypted",
								"corrupted",
								"partiallycorrupted",
								"multipart",
								"nested",
								"mailbomb",
								"fileslimit",
								"timeout",
								"unhandled",
							]
						}
						archive_log: {
							description: [
								"Select the archive types to log.",
							]
							type: "str"
							choices: [
								"encrypted",
								"corrupted",
								"partiallycorrupted",
								"multipart",
								"nested",
								"mailbomb",
								"fileslimit",
								"timeout",
								"unhandled",
							]
						}
						content_disarm: {
							description: [
								"Enable Content Disarm and Reconstruction for this protocol.",
							]
							type: "str"
							choices: [
								"disable",
								"enable",
							]
						}
						emulator: {
							description: [
								"Enable/disable the virus emulator.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						options: {
							description: [
								"Enable/disable HTTP AntiVirus scanning, monitoring, and quarantine.",
							]
							type: "str"
							choices: [
								"scan",
								"avmonitor",
								"quarantine",
							]
						}
						outbreak_prevention: {
							description: [
								"Enable FortiGuard Virus Outbreak Prevention service.",
							]
							type: "str"
							choices: [
								"disabled",
								"files",
								"full-archive",
							]
						}
					}
				}
				imap: {
					description: [
						"Configure IMAP AntiVirus options.",
					]
					type: "dict"
					suboptions: {
						archive_block: {
							description: [
								"Select the archive types to block.",
							]
							type: "str"
							choices: [
								"encrypted",
								"corrupted",
								"partiallycorrupted",
								"multipart",
								"nested",
								"mailbomb",
								"fileslimit",
								"timeout",
								"unhandled",
							]
						}
						archive_log: {
							description: [
								"Select the archive types to log.",
							]
							type: "str"
							choices: [
								"encrypted",
								"corrupted",
								"partiallycorrupted",
								"multipart",
								"nested",
								"mailbomb",
								"fileslimit",
								"timeout",
								"unhandled",
							]
						}
						content_disarm: {
							description: [
								"Enable Content Disarm and Reconstruction for this protocol.",
							]
							type: "str"
							choices: [
								"disable",
								"enable",
							]
						}
						emulator: {
							description: [
								"Enable/disable the virus emulator.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						executables: {
							description: [
								"Treat Windows executable files as viruses for the purpose of blocking or monitoring.",
							]
							type: "str"
							choices: [
								"default",
								"virus",
							]
						}
						options: {
							description: [
								"Enable/disable IMAP AntiVirus scanning, monitoring, and quarantine.",
							]
							type: "str"
							choices: [
								"scan",
								"avmonitor",
								"quarantine",
							]
						}
						outbreak_prevention: {
							description: [
								"Enable FortiGuard Virus Outbreak Prevention service.",
							]
							type: "str"
							choices: [
								"disabled",
								"files",
								"full-archive",
							]
						}
					}
				}
				inspection_mode: {
					description: [
						"Inspection mode.",
					]
					type: "str"
					choices: [
						"proxy",
						"flow-based",
					]
				}
				mapi: {
					description: [
						"Configure MAPI AntiVirus options.",
					]
					type: "dict"
					suboptions: {
						archive_block: {
							description: [
								"Select the archive types to block.",
							]
							type: "str"
							choices: [
								"encrypted",
								"corrupted",
								"partiallycorrupted",
								"multipart",
								"nested",
								"mailbomb",
								"fileslimit",
								"timeout",
								"unhandled",
							]
						}
						archive_log: {
							description: [
								"Select the archive types to log.",
							]
							type: "str"
							choices: [
								"encrypted",
								"corrupted",
								"partiallycorrupted",
								"multipart",
								"nested",
								"mailbomb",
								"fileslimit",
								"timeout",
								"unhandled",
							]
						}
						emulator: {
							description: [
								"Enable/disable the virus emulator.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						executables: {
							description: [
								"Treat Windows executable files as viruses for the purpose of blocking or monitoring.",
							]
							type: "str"
							choices: [
								"default",
								"virus",
							]
						}
						options: {
							description: [
								"Enable/disable MAPI AntiVirus scanning, monitoring, and quarantine.",
							]
							type: "str"
							choices: [
								"scan",
								"avmonitor",
								"quarantine",
							]
						}
						outbreak_prevention: {
							description: [
								"Enable FortiGuard Virus Outbreak Prevention service.",
							]
							type: "str"
							choices: [
								"disabled",
								"files",
								"full-archive",
							]
						}
					}
				}
				mobile_malware_db: {
					description: [
						"Enable/disable using the mobile malware signature database.",
					]
					type: "str"
					choices: [
						"disable",
						"enable",
					]
				}
				nac_quar: {
					description: [
						"Configure AntiVirus quarantine settings.",
					]
					type: "dict"
					suboptions: {
						expiry: {
							description: [
								"Duration of quarantine.",
							]
							type: "str"
						}
						infected: {
							description: [
								"Enable/Disable quarantining infected hosts to the banned user list.",
							]
							type: "str"
							choices: [
								"none",
								"quar-src-ip",
							]
						}
						log: {
							description: [
								"Enable/disable AntiVirus quarantine logging.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
					}
				}
				name: {
					description: [
						"Profile name.",
					]
					required: true
					type:     "str"
				}
				nntp: {
					description: [
						"Configure NNTP AntiVirus options.",
					]
					type: "dict"
					suboptions: {
						archive_block: {
							description: [
								"Select the archive types to block.",
							]
							type: "str"
							choices: [
								"encrypted",
								"corrupted",
								"partiallycorrupted",
								"multipart",
								"nested",
								"mailbomb",
								"fileslimit",
								"timeout",
								"unhandled",
							]
						}
						archive_log: {
							description: [
								"Select the archive types to log.",
							]
							type: "str"
							choices: [
								"encrypted",
								"corrupted",
								"partiallycorrupted",
								"multipart",
								"nested",
								"mailbomb",
								"fileslimit",
								"timeout",
								"unhandled",
							]
						}
						emulator: {
							description: [
								"Enable/disable the virus emulator.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						options: {
							description: [
								"Enable/disable NNTP AntiVirus scanning, monitoring, and quarantine.",
							]
							type: "str"
							choices: [
								"scan",
								"avmonitor",
								"quarantine",
							]
						}
						outbreak_prevention: {
							description: [
								"Enable FortiGuard Virus Outbreak Prevention service.",
							]
							type: "str"
							choices: [
								"disabled",
								"files",
								"full-archive",
							]
						}
					}
				}
				pop3: {
					description: [
						"Configure POP3 AntiVirus options.",
					]
					type: "dict"
					suboptions: {
						archive_block: {
							description: [
								"Select the archive types to block.",
							]
							type: "str"
							choices: [
								"encrypted",
								"corrupted",
								"partiallycorrupted",
								"multipart",
								"nested",
								"mailbomb",
								"fileslimit",
								"timeout",
								"unhandled",
							]
						}
						archive_log: {
							description: [
								"Select the archive types to log.",
							]
							type: "str"
							choices: [
								"encrypted",
								"corrupted",
								"partiallycorrupted",
								"multipart",
								"nested",
								"mailbomb",
								"fileslimit",
								"timeout",
								"unhandled",
							]
						}
						content_disarm: {
							description: [
								"Enable Content Disarm and Reconstruction for this protocol.",
							]
							type: "str"
							choices: [
								"disable",
								"enable",
							]
						}
						emulator: {
							description: [
								"Enable/disable the virus emulator.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						executables: {
							description: [
								"Treat Windows executable files as viruses for the purpose of blocking or monitoring.",
							]
							type: "str"
							choices: [
								"default",
								"virus",
							]
						}
						options: {
							description: [
								"Enable/disable POP3 AntiVirus scanning, monitoring, and quarantine.",
							]
							type: "str"
							choices: [
								"scan",
								"avmonitor",
								"quarantine",
							]
						}
						outbreak_prevention: {
							description: [
								"Enable FortiGuard Virus Outbreak Prevention service.",
							]
							type: "str"
							choices: [
								"disabled",
								"files",
								"full-archive",
							]
						}
					}
				}
				replacemsg_group: {
					description: [
						"Replacement message group customized for this profile. Source system.replacemsg-group.name.",
					]
					type: "str"
				}
				scan_mode: {
					description: [
						"Choose between full scan mode and quick scan mode.",
					]
					type: "str"
					choices: [
						"quick",
						"full",
					]
				}
				smb: {
					description: [
						"Configure SMB AntiVirus options.",
					]
					type: "dict"
					suboptions: {
						archive_block: {
							description: [
								"Select the archive types to block.",
							]
							type: "str"
							choices: [
								"encrypted",
								"corrupted",
								"partiallycorrupted",
								"multipart",
								"nested",
								"mailbomb",
								"fileslimit",
								"timeout",
								"unhandled",
							]
						}
						archive_log: {
							description: [
								"Select the archive types to log.",
							]
							type: "str"
							choices: [
								"encrypted",
								"corrupted",
								"partiallycorrupted",
								"multipart",
								"nested",
								"mailbomb",
								"fileslimit",
								"timeout",
								"unhandled",
							]
						}
						emulator: {
							description: [
								"Enable/disable the virus emulator.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						options: {
							description: [
								"Enable/disable SMB AntiVirus scanning, monitoring, and quarantine.",
							]
							type: "str"
							choices: [
								"scan",
								"avmonitor",
								"quarantine",
							]
						}
						outbreak_prevention: {
							description: [
								"Enable FortiGuard Virus Outbreak Prevention service.",
							]
							type: "str"
							choices: [
								"disabled",
								"files",
								"full-archive",
							]
						}
					}
				}
				smtp: {
					description: [
						"Configure SMTP AntiVirus options.",
					]
					type: "dict"
					suboptions: {
						archive_block: {
							description: [
								"Select the archive types to block.",
							]
							type: "str"
							choices: [
								"encrypted",
								"corrupted",
								"partiallycorrupted",
								"multipart",
								"nested",
								"mailbomb",
								"fileslimit",
								"timeout",
								"unhandled",
							]
						}
						archive_log: {
							description: [
								"Select the archive types to log.",
							]
							type: "str"
							choices: [
								"encrypted",
								"corrupted",
								"partiallycorrupted",
								"multipart",
								"nested",
								"mailbomb",
								"fileslimit",
								"timeout",
								"unhandled",
							]
						}
						content_disarm: {
							description: [
								"Enable Content Disarm and Reconstruction for this protocol.",
							]
							type: "str"
							choices: [
								"disable",
								"enable",
							]
						}
						emulator: {
							description: [
								"Enable/disable the virus emulator.",
							]
							type: "str"
							choices: [
								"enable",
								"disable",
							]
						}
						executables: {
							description: [
								"Treat Windows executable files as viruses for the purpose of blocking or monitoring.",
							]
							type: "str"
							choices: [
								"default",
								"virus",
							]
						}
						options: {
							description: [
								"Enable/disable SMTP AntiVirus scanning, monitoring, and quarantine.",
							]
							type: "str"
							choices: [
								"scan",
								"avmonitor",
								"quarantine",
							]
						}
						outbreak_prevention: {
							description: [
								"Enable FortiGuard Virus Outbreak Prevention service.",
							]
							type: "str"
							choices: [
								"disabled",
								"files",
								"full-archive",
							]
						}
					}
				}
			}
		}
	}
}
