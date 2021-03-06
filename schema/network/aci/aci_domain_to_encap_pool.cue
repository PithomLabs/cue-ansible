package ansible

module: aci_domain_to_encap_pool: {
	module:            "aci_domain_to_encap_pool"
	short_description: "Bind Domain to Encap Pools (infra:RsVlanNs)"
	description: [
		"Bind Domain to Encap Pools on Cisco ACI fabrics.",
	]
	notes: [
		"The C(domain) and C(encap_pool) parameters should exist before using this module. The M(aci_domain) and M(aci_encap_pool) can be used for these.",
	]

	version_added: "2.5"
	options: {
		domain: {
			description: [
				"Name of the domain being associated with the Encap Pool.",
			]
			type: "str"
			aliases: ["domain_name", "domain_profile"]
		}
		domain_type: {
			description: [
				"Determines if the Domain is physical (phys) or virtual (vmm).",
			]
			type: "str"
			choices: ["fc", "l2dom", "l3dom", "phys", "vmm"]
		}
		pool: {
			description: [
				"The name of the pool.",
			]
			type: "str"
			aliases: ["pool_name"]
		}
		pool_allocation_mode: {
			description: [
				"The method used for allocating encaps to resources.",
				"Only vlan and vsan support allocation modes.",
			]
			type: "str"
			choices: ["dynamic", "static"]
			aliases: ["allocation_mode", "mode"]
		}
		pool_type: {
			description: [
				"The encap type of C(pool).",
			]
			type:     "str"
			required: true
			choices: ["vlan", "vsan", "vxlan"]
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
		vm_provider: {
			description: [
				"The VM platform for VMM Domains.",
				"Support for Kubernetes was added in ACI v3.0.",
				"Support for CloudFoundry, OpenShift and Red Hat was added in ACI v3.1.",
			]
			type: "str"
			choices: ["cloudfoundry", "kubernetes", "microsoft", "openshift", "openstack", "redhat", "vmware"]
		}
	}
	extends_documentation_fragment: "aci"
	seealso: [{
		module: "aci_domain"
	}, {
		module: "aci_encap_pool"
	}, {
		name:        "APIC Management Information Model reference"
		description: "More information about the internal APIC class B(infra:RsVlanNs)."
		link:        "https://developer.cisco.com/docs/apic-mim-ref/"
	}]
	author: ["Dag Wieers (@dagwieers)"]
}
