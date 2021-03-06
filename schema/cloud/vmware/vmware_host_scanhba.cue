package ansible

module: vmware_host_scanhba: {
	module:            "vmware_host_scanhba"
	short_description: "Rescan host HBA's and optionally refresh the storage system"
	description: [
		"This module can force a rescan of the hosts HBA subsystem which is needed when wanting to mount a new datastore.",
		"You could use this before using M(vmware_host_datastore) to mount a new datastore to ensure your device/volume is ready.",
		"You can also optionally force a Refresh of the Storage System in vCenter/ESXi Web Client.",
		"All parameters and VMware object names are case sensitive.",
		"You can supply an esxi_hostname or a cluster_name",
	]
	version_added: "2.8"
	author: [
		"Michael Eaton (@michaeldeaton)",
	]
	notes: [
		"Tested on vSphere 6.0",
	]
	requirements: [
		"python >= 2.6",
		"PyVmomi",
	]
	options: {
		esxi_hostname: {
			description: [
				"ESXi hostname to Rescan the storage subsystem on.",
			]
			required: false
			type:     "str"
		}
		cluster_name: {
			description: [
				"Cluster name to Rescan the storage subsystem on (this will run the rescan task on each host in the cluster).",
			]
			required: false
			type:     "str"
		}
		refresh_storage: {
			description: [
				"Refresh the storage system in vCenter/ESXi Web Client for each host found",
			]
			required: false
			default:  false
			type:     "bool"
		}
	}
	extends_documentation_fragment: "vmware.documentation"
}
