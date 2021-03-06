package ansible

module: na_ontap_cluster_ha: {
	author: "NetApp Ansible Team (@carchi8py) <ng-ansibleteam@netapp.com>"
	description: [
		"Enable or disable HA on a cluster",
	]
	extends_documentation_fragment: [
		"netapp.na_ontap",
	]
	module: "na_ontap_cluster_ha"
	options: state: {
		choices: ["present", "absent"]
		description: [
			"Whether HA on cluster should be enabled or disabled.",
		]
		default: "present"
	}
	short_description: "NetApp ONTAP Manage HA status for cluster"
	version_added:     "2.6"
}
