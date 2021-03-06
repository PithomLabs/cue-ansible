package ansible

module: influxdb_write: {
	module:            "influxdb_write"
	short_description: "Write data points into InfluxDB."
	description: [
		"Write data points into InfluxDB.",
	]
	version_added: 2.5
	author:        "René Moser (@resmo)"
	requirements: [
		"python >= 2.6",
		"influxdb >= 0.9",
	]
	options: {
		data_points: {
			description: ["Data points as dict to write into the database."]
			required: true
		}
		database_name: {
			description: ["Name of the database."]
			required: true
		}
	}
	extends_documentation_fragment: "influxdb"
}
