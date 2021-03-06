package ansible

module: win_scheduled_task_stat: {
	module:            "win_scheduled_task_stat"
	version_added:     "2.5"
	short_description: "Get information about Windows Scheduled Tasks"
	description: [
		"Will return whether the folder and task exists.",
		"Returns the names of tasks in the folder specified.",
		"Use M(win_scheduled_task) to configure a scheduled task.",
	]
	options: {
		path: {
			description: "The folder path where the task lives."
			type:        "str"
			default:     "\\"
		}
		name: {
			description: [
				"The name of the scheduled task to get information for.",
				"If C(name) is set and exists, will return information on the task itself.",
			]
			type: "str"
		}
	}
	seealso: [{
		module: "win_scheduled_task"
	}]
	author: ["Jordan Borean (@jborean93)"]
}
