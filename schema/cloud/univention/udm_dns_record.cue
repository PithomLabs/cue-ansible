package ansible

module: udm_dns_record: {
	module:        "udm_dns_record"
	version_added: "2.2"
	author: ["Tobias Rüetschi (@keachi)"]
	short_description: "Manage dns entries on a univention corporate server"
	description: [
		"This module allows to manage dns records on a univention corporate server (UCS). It uses the python API of the UCS to create a new object or edit it.",
	]

	requirements: [
		"Python >= 2.6",
		"Univention",
	]
	options: {
		state: {
			required: false
			default:  "present"
			choices: ["present", "absent"]
			description: ["Whether the dns record is present or not."]
		}
		name: {
			required: true
			description: [
				"Name of the record, this is also the DNS record. E.g. www for www.example.com.",
			]
		}

		zone: {
			required: true
			description: ["Corresponding DNS zone for this record, e.g. example.com."]
		}
		type: {
			required: true
			choices: ["host_record", "alias", "ptr_record", "srv_record", "txt_record"]
			description: [
				"Define the record type. C(host_record) is a A or AAAA record, C(alias) is a CNAME, C(ptr_record) is a PTR record, C(srv_record) is a SRV record and C(txt_record) is a TXT record.",
			]
		}

		data: {
			required: false
			default: []
			description: [
				"Additional data for this record, e.g. ['a': '192.0.2.1']. Required if C(state=present).",
			]
		}
	}
}
