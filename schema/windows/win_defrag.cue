package ansible

module: win_defrag: {
	module:            "win_defrag"
	version_added:     "2.4"
	short_description: "Consolidate fragmented files on local volumes"
	description: [
		"Locates and consolidates fragmented files on local volumes to improve system performance.",
		"More information regarding C(win_defrag) is available from: U(https://technet.microsoft.com/en-us/library/cc731650(v=ws.11).aspx)",
	]
	requirements: [
		"defrag.exe",
	]
	options: {
		include_volumes: {
			description: [
				"A list of drive letters or mount point paths of the volumes to be defragmented.",
				"If this parameter is omitted, all volumes (not excluded) will be fragmented.",
			]
			type: "list"
		}
		exclude_volumes: {
			description: [
				"A list of drive letters or mount point paths to exclude from defragmentation.",
			]
			type: "list"
		}
		freespace_consolidation: {
			description: [
				"Perform free space consolidation on the specified volumes.",
			]
			type:    "bool"
			default: false
		}
		priority: {
			description: [
				"Run the operation at low or normal priority.",
			]
			type: "str"
			choices: ["low", "normal"]
			default: "low"
		}
		parallel: {
			description: [
				"Run the operation on each volume in parallel in the background.",
			]
			type:    "bool"
			default: false
		}
	}
	author: ["Dag Wieers (@dagwieers)"]
}
