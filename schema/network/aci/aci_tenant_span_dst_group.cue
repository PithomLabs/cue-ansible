package ansible

module: aci_tenant_span_dst_group: {
	module:            "aci_tenant_span_dst_group"
	short_description: "Manage SPAN destination groups (span:DestGrp)"
	description: [
		"Manage SPAN destination groups on Cisco ACI fabrics.",
	]
	version_added: "2.4"
	options: {
		dst_group: {
			description: [
				"The name of the SPAN destination group.",
			]
			type:     "str"
			required: true
			aliases: ["name"]
		}
		description: {
			description: [
				"The description of the SPAN destination group.",
			]
			type: "str"
			aliases: ["descr"]
		}
		tenant: {
			description: [
				"The name of the tenant.",
			]
			type:     "str"
			required: true
			aliases: ["tenant_name"]
		}
		state: {
			description: [
				"Use C(present) or C(absent) for adding or removing.",
				"Use C(query) for listing an object or multiple objects.",
			]
			type: "str"
			choices: ["absent", "present", "query"]
			default: "present"
		}
	}
	extends_documentation_fragment: "aci"
	notes: [
		"The C(tenant) used must exist before using this module in your playbook. The M(aci_tenant) module can be used for this.",
	]

	seealso: [{
		module: "aci_tenant"
	}, {
		name:        "APIC Management Information Model reference"
		description: "More information about the internal APIC class B(span:DestGrp)."
		link:        "https://developer.cisco.com/docs/apic-mim-ref/"
	}]
	author: ["Dag Wieers (@dagwieers)"]
}
