package ansible

module: fmgr_secprof_voip: {
	module:        "fmgr_secprof_voip"
	version_added: "2.8"
	notes: [
		"Full Documentation at U(https://ftnt-ansible-docs.readthedocs.io/en/latest/).",
	]
	author: [
		"Luke Weighall (@lweighall)",
		"Andrew Welsh (@Ghilli3)",
		"Jim Huber (@p4r4n0y1ng)",
	]
	short_description: "VOIP security profiles in FMG"
	description: [
		"Manage VOIP security profiles in FortiManager via API",
	]

	options: {
		adom: {
			description: [
				"The ADOM the configuration should belong to.",
			]
			required: false
			default:  "root"
		}

		mode: {
			description: [
				"Sets one of three modes for managing the object.",
				"Allows use of soft-adds instead of overwriting existing values",
			]
			choices: ["add", "set", "delete", "update"]
			required: false
			default:  "add"
		}

		name: {
			description: [
				"Profile name.",
			]
			required: false
		}

		comment: {
			description: [
				"Comment.",
			]
			required: false
		}

		sccp: {
			description: [
				"EXPERTS ONLY! KNOWLEDGE OF FMGR JSON API IS REQUIRED!",
				"List of multiple child objects to be added. Expects a list of dictionaries.",
				"Dictionaries must use FortiManager API parameters, not the ansible ones listed below.",
				"If submitted, all other prefixed sub-parameters ARE IGNORED.",
				"This object is MUTUALLY EXCLUSIVE with its options.",
				"We expect that you know what you are doing with these list parameters, and are leveraging the JSON API Guide.",
				"WHEN IN DOUBT, USE THE SUB OPTIONS BELOW INSTEAD TO CREATE OBJECTS WITH MULTIPLE TASKS",
			]
			required: false
		}

		sccp_block_mcast: {
			description: [
				"Enable/disable block multicast RTP connections.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sccp_log_call_summary: {
			description: [
				"Enable/disable log summary of SCCP calls.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sccp_log_violations: {
			description: [
				"Enable/disable logging of SCCP violations.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sccp_max_calls: {
			description: [
				"Maximum calls per minute per SCCP client (max 65535).",
			]
			required: false
		}

		sccp_status: {
			description: [
				"Enable/disable SCCP.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sccp_verify_header: {
			description: [
				"Enable/disable verify SCCP header content.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip: {
			description: [
				"EXPERTS ONLY! KNOWLEDGE OF FMGR JSON API IS REQUIRED!",
				"List of multiple child objects to be added. Expects a list of dictionaries.",
				"Dictionaries must use FortiManager API parameters, not the ansible ones listed below.",
				"If submitted, all other prefixed sub-parameters ARE IGNORED.",
				"This object is MUTUALLY EXCLUSIVE with its options.",
				"We expect that you know what you are doing with these list parameters, and are leveraging the JSON API Guide.",
				"WHEN IN DOUBT, USE THE SUB OPTIONS BELOW INSTEAD TO CREATE OBJECTS WITH MULTIPLE TASKS",
			]
			required: false
		}

		sip_ack_rate: {
			description: [
				"ACK request rate limit (per second, per policy).",
			]
			required: false
		}

		sip_block_ack: {
			description: [
				"Enable/disable block ACK requests.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_block_bye: {
			description: [
				"Enable/disable block BYE requests.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_block_cancel: {
			description: [
				"Enable/disable block CANCEL requests.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_block_geo_red_options: {
			description: [
				"Enable/disable block OPTIONS requests, but OPTIONS requests still notify for redundancy.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_block_info: {
			description: [
				"Enable/disable block INFO requests.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_block_invite: {
			description: [
				"Enable/disable block INVITE requests.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_block_long_lines: {
			description: [
				"Enable/disable block requests with headers exceeding max-line-length.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_block_message: {
			description: [
				"Enable/disable block MESSAGE requests.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_block_notify: {
			description: [
				"Enable/disable block NOTIFY requests.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_block_options: {
			description: [
				"Enable/disable block OPTIONS requests and no OPTIONS as notifying message for redundancy either.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_block_prack: {
			description: [
				"Enable/disable block prack requests.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_block_publish: {
			description: [
				"Enable/disable block PUBLISH requests.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_block_refer: {
			description: [
				"Enable/disable block REFER requests.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_block_register: {
			description: [
				"Enable/disable block REGISTER requests.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_block_subscribe: {
			description: [
				"Enable/disable block SUBSCRIBE requests.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_block_unknown: {
			description: [
				"Block unrecognized SIP requests (enabled by default).",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_block_update: {
			description: [
				"Enable/disable block UPDATE requests.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_bye_rate: {
			description: [
				"BYE request rate limit (per second, per policy).",
			]
			required: false
		}

		sip_call_keepalive: {
			description: [
				"Continue tracking calls with no RTP for this many minutes.",
			]
			required: false
		}

		sip_cancel_rate: {
			description: [
				"CANCEL request rate limit (per second, per policy).",
			]
			required: false
		}

		sip_contact_fixup: {
			description: [
				"Fixup contact anyway even if contact's IP|port doesn't match session's IP|port.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_hnt_restrict_source_ip: {
			description: [
				"Enable/disable restrict RTP source IP to be the same as SIP source IP when HNT is enabled.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_hosted_nat_traversal: {
			description: [
				"Hosted NAT Traversal (HNT).",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_info_rate: {
			description: [
				"INFO request rate limit (per second, per policy).",
			]
			required: false
		}

		sip_invite_rate: {
			description: [
				"INVITE request rate limit (per second, per policy).",
			]
			required: false
		}

		sip_ips_rtp: {
			description: [
				"Enable/disable allow IPS on RTP.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_log_call_summary: {
			description: [
				"Enable/disable logging of SIP call summary.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_log_violations: {
			description: [
				"Enable/disable logging of SIP violations.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_malformed_header_allow: {
			description: [
				"Action for malformed Allow header.",
				"choice | pass | Bypass malformed messages.",
				"choice | discard | Discard malformed messages.",
				"choice | respond | Respond with error code.",
			]
			required: false
			choices: ["pass", "discard", "respond"]
		}

		sip_malformed_header_call_id: {
			description: [
				"Action for malformed Call-ID header.",
				"choice | pass | Bypass malformed messages.",
				"choice | discard | Discard malformed messages.",
				"choice | respond | Respond with error code.",
			]
			required: false
			choices: ["pass", "discard", "respond"]
		}

		sip_malformed_header_contact: {
			description: [
				"Action for malformed Contact header.",
				"choice | pass | Bypass malformed messages.",
				"choice | discard | Discard malformed messages.",
				"choice | respond | Respond with error code.",
			]
			required: false
			choices: ["pass", "discard", "respond"]
		}

		sip_malformed_header_content_length: {
			description: [
				"Action for malformed Content-Length header.",
				"choice | pass | Bypass malformed messages.",
				"choice | discard | Discard malformed messages.",
				"choice | respond | Respond with error code.",
			]
			required: false
			choices: ["pass", "discard", "respond"]
		}

		sip_malformed_header_content_type: {
			description: [
				"Action for malformed Content-Type header.",
				"choice | pass | Bypass malformed messages.",
				"choice | discard | Discard malformed messages.",
				"choice | respond | Respond with error code.",
			]
			required: false
			choices: ["pass", "discard", "respond"]
		}

		sip_malformed_header_cseq: {
			description: [
				"Action for malformed CSeq header.",
				"choice | pass | Bypass malformed messages.",
				"choice | discard | Discard malformed messages.",
				"choice | respond | Respond with error code.",
			]
			required: false
			choices: ["pass", "discard", "respond"]
		}

		sip_malformed_header_expires: {
			description: [
				"Action for malformed Expires header.",
				"choice | pass | Bypass malformed messages.",
				"choice | discard | Discard malformed messages.",
				"choice | respond | Respond with error code.",
			]
			required: false
			choices: ["pass", "discard", "respond"]
		}

		sip_malformed_header_from: {
			description: [
				"Action for malformed From header.",
				"choice | pass | Bypass malformed messages.",
				"choice | discard | Discard malformed messages.",
				"choice | respond | Respond with error code.",
			]
			required: false
			choices: ["pass", "discard", "respond"]
		}

		sip_malformed_header_max_forwards: {
			description: [
				"Action for malformed Max-Forwards header.",
				"choice | pass | Bypass malformed messages.",
				"choice | discard | Discard malformed messages.",
				"choice | respond | Respond with error code.",
			]
			required: false
			choices: ["pass", "discard", "respond"]
		}

		sip_malformed_header_p_asserted_identity: {
			description: [
				"Action for malformed P-Asserted-Identity header.",
				"choice | pass | Bypass malformed messages.",
				"choice | discard | Discard malformed messages.",
				"choice | respond | Respond with error code.",
			]
			required: false
			choices: ["pass", "discard", "respond"]
		}

		sip_malformed_header_rack: {
			description: [
				"Action for malformed RAck header.",
				"choice | pass | Bypass malformed messages.",
				"choice | discard | Discard malformed messages.",
				"choice | respond | Respond with error code.",
			]
			required: false
			choices: ["pass", "discard", "respond"]
		}

		sip_malformed_header_record_route: {
			description: [
				"Action for malformed Record-Route header.",
				"choice | pass | Bypass malformed messages.",
				"choice | discard | Discard malformed messages.",
				"choice | respond | Respond with error code.",
			]
			required: false
			choices: ["pass", "discard", "respond"]
		}

		sip_malformed_header_route: {
			description: [
				"Action for malformed Route header.",
				"choice | pass | Bypass malformed messages.",
				"choice | discard | Discard malformed messages.",
				"choice | respond | Respond with error code.",
			]
			required: false
			choices: ["pass", "discard", "respond"]
		}

		sip_malformed_header_rseq: {
			description: [
				"Action for malformed RSeq header.",
				"choice | pass | Bypass malformed messages.",
				"choice | discard | Discard malformed messages.",
				"choice | respond | Respond with error code.",
			]
			required: false
			choices: ["pass", "discard", "respond"]
		}

		sip_malformed_header_sdp_a: {
			description: [
				"Action for malformed SDP a line.",
				"choice | pass | Bypass malformed messages.",
				"choice | discard | Discard malformed messages.",
				"choice | respond | Respond with error code.",
			]
			required: false
			choices: ["pass", "discard", "respond"]
		}

		sip_malformed_header_sdp_b: {
			description: [
				"Action for malformed SDP b line.",
				"choice | pass | Bypass malformed messages.",
				"choice | discard | Discard malformed messages.",
				"choice | respond | Respond with error code.",
			]
			required: false
			choices: ["pass", "discard", "respond"]
		}

		sip_malformed_header_sdp_c: {
			description: [
				"Action for malformed SDP c line.",
				"choice | pass | Bypass malformed messages.",
				"choice | discard | Discard malformed messages.",
				"choice | respond | Respond with error code.",
			]
			required: false
			choices: ["pass", "discard", "respond"]
		}

		sip_malformed_header_sdp_i: {
			description: [
				"Action for malformed SDP i line.",
				"choice | pass | Bypass malformed messages.",
				"choice | discard | Discard malformed messages.",
				"choice | respond | Respond with error code.",
			]
			required: false
			choices: ["pass", "discard", "respond"]
		}

		sip_malformed_header_sdp_k: {
			description: [
				"Action for malformed SDP k line.",
				"choice | pass | Bypass malformed messages.",
				"choice | discard | Discard malformed messages.",
				"choice | respond | Respond with error code.",
			]
			required: false
			choices: ["pass", "discard", "respond"]
		}

		sip_malformed_header_sdp_m: {
			description: [
				"Action for malformed SDP m line.",
				"choice | pass | Bypass malformed messages.",
				"choice | discard | Discard malformed messages.",
				"choice | respond | Respond with error code.",
			]
			required: false
			choices: ["pass", "discard", "respond"]
		}

		sip_malformed_header_sdp_o: {
			description: [
				"Action for malformed SDP o line.",
				"choice | pass | Bypass malformed messages.",
				"choice | discard | Discard malformed messages.",
				"choice | respond | Respond with error code.",
			]
			required: false
			choices: ["pass", "discard", "respond"]
		}

		sip_malformed_header_sdp_r: {
			description: [
				"Action for malformed SDP r line.",
				"choice | pass | Bypass malformed messages.",
				"choice | discard | Discard malformed messages.",
				"choice | respond | Respond with error code.",
			]
			required: false
			choices: ["pass", "discard", "respond"]
		}

		sip_malformed_header_sdp_s: {
			description: [
				"Action for malformed SDP s line.",
				"choice | pass | Bypass malformed messages.",
				"choice | discard | Discard malformed messages.",
				"choice | respond | Respond with error code.",
			]
			required: false
			choices: ["pass", "discard", "respond"]
		}

		sip_malformed_header_sdp_t: {
			description: [
				"Action for malformed SDP t line.",
				"choice | pass | Bypass malformed messages.",
				"choice | discard | Discard malformed messages.",
				"choice | respond | Respond with error code.",
			]
			required: false
			choices: ["pass", "discard", "respond"]
		}

		sip_malformed_header_sdp_v: {
			description: [
				"Action for malformed SDP v line.",
				"choice | pass | Bypass malformed messages.",
				"choice | discard | Discard malformed messages.",
				"choice | respond | Respond with error code.",
			]
			required: false
			choices: ["pass", "discard", "respond"]
		}

		sip_malformed_header_sdp_z: {
			description: [
				"Action for malformed SDP z line.",
				"choice | pass | Bypass malformed messages.",
				"choice | discard | Discard malformed messages.",
				"choice | respond | Respond with error code.",
			]
			required: false
			choices: ["pass", "discard", "respond"]
		}

		sip_malformed_header_to: {
			description: [
				"Action for malformed To header.",
				"choice | pass | Bypass malformed messages.",
				"choice | discard | Discard malformed messages.",
				"choice | respond | Respond with error code.",
			]
			required: false
			choices: ["pass", "discard", "respond"]
		}

		sip_malformed_header_via: {
			description: [
				"Action for malformed VIA header.",
				"choice | pass | Bypass malformed messages.",
				"choice | discard | Discard malformed messages.",
				"choice | respond | Respond with error code.",
			]
			required: false
			choices: ["pass", "discard", "respond"]
		}

		sip_malformed_request_line: {
			description: [
				"Action for malformed request line.",
				"choice | pass | Bypass malformed messages.",
				"choice | discard | Discard malformed messages.",
				"choice | respond | Respond with error code.",
			]
			required: false
			choices: ["pass", "discard", "respond"]
		}

		sip_max_body_length: {
			description: [
				"Maximum SIP message body length (0 meaning no limit).",
			]
			required: false
		}

		sip_max_dialogs: {
			description: [
				"Maximum number of concurrent calls/dialogs (per policy).",
			]
			required: false
		}

		sip_max_idle_dialogs: {
			description: [
				"Maximum number established but idle dialogs to retain (per policy).",
			]
			required: false
		}

		sip_max_line_length: {
			description: [
				"Maximum SIP header line length (78-4096).",
			]
			required: false
		}

		sip_message_rate: {
			description: [
				"MESSAGE request rate limit (per second, per policy).",
			]
			required: false
		}

		sip_nat_trace: {
			description: [
				"Enable/disable preservation of original IP in SDP i line.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_no_sdp_fixup: {
			description: [
				"Enable/disable no SDP fix-up.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_notify_rate: {
			description: [
				"NOTIFY request rate limit (per second, per policy).",
			]
			required: false
		}

		sip_open_contact_pinhole: {
			description: [
				"Enable/disable open pinhole for non-REGISTER Contact port.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_open_record_route_pinhole: {
			description: [
				"Enable/disable open pinhole for Record-Route port.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_open_register_pinhole: {
			description: [
				"Enable/disable open pinhole for REGISTER Contact port.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_open_via_pinhole: {
			description: [
				"Enable/disable open pinhole for Via port.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_options_rate: {
			description: [
				"OPTIONS request rate limit (per second, per policy).",
			]
			required: false
		}

		sip_prack_rate: {
			description: [
				"PRACK request rate limit (per second, per policy).",
			]
			required: false
		}

		sip_preserve_override: {
			description: [
				"Override i line to preserve original IPS (default| append).",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_provisional_invite_expiry_time: {
			description: [
				"Expiry time for provisional INVITE (10 - 3600 sec).",
			]
			required: false
		}

		sip_publish_rate: {
			description: [
				"PUBLISH request rate limit (per second, per policy).",
			]
			required: false
		}

		sip_refer_rate: {
			description: [
				"REFER request rate limit (per second, per policy).",
			]
			required: false
		}

		sip_register_contact_trace: {
			description: [
				"Enable/disable trace original IP/port within the contact header of REGISTER requests.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_register_rate: {
			description: [
				"REGISTER request rate limit (per second, per policy).",
			]
			required: false
		}

		sip_rfc2543_branch: {
			description: [
				"Enable/disable support via branch compliant with RFC 2543.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_rtp: {
			description: [
				"Enable/disable create pinholes for RTP traffic to traverse firewall.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_ssl_algorithm: {
			description: [
				"Relative strength of encryption algorithms accepted in negotiation.",
				"choice | high | High encryption. Allow only AES and ChaCha.",
				"choice | medium | Medium encryption. Allow AES, ChaCha, 3DES, and RC4.",
				"choice | low | Low encryption. Allow AES, ChaCha, 3DES, RC4, and DES.",
			]
			required: false
			choices: ["high", "medium", "low"]
		}

		sip_ssl_auth_client: {
			description: [
				"Require a client certificate and authenticate it with the peer/peergrp.",
			]
			required: false
		}

		sip_ssl_auth_server: {
			description: [
				"Authenticate the server's certificate with the peer/peergrp.",
			]
			required: false
		}

		sip_ssl_client_certificate: {
			description: [
				"Name of Certificate to offer to server if requested.",
			]
			required: false
		}

		sip_ssl_client_renegotiation: {
			description: [
				"Allow/block client renegotiation by server.",
				"choice | allow | Allow a SSL client to renegotiate.",
				"choice | deny | Abort any SSL connection that attempts to renegotiate.",
				"choice | secure | Reject any SSL connection that does not offer a RFC 5746 Secure Renegotiation Indication.",
			]
			required: false
			choices: ["allow", "deny", "secure"]
		}

		sip_ssl_max_version: {
			description: [
				"Highest SSL/TLS version to negotiate.",
				"choice | ssl-3.0 | SSL 3.0.",
				"choice | tls-1.0 | TLS 1.0.",
				"choice | tls-1.1 | TLS 1.1.",
				"choice | tls-1.2 | TLS 1.2.",
			]
			required: false
			choices: ["ssl-3.0", "tls-1.0", "tls-1.1", "tls-1.2"]
		}

		sip_ssl_min_version: {
			description: [
				"Lowest SSL/TLS version to negotiate.",
				"choice | ssl-3.0 | SSL 3.0.",
				"choice | tls-1.0 | TLS 1.0.",
				"choice | tls-1.1 | TLS 1.1.",
				"choice | tls-1.2 | TLS 1.2.",
			]
			required: false
			choices: ["ssl-3.0", "tls-1.0", "tls-1.1", "tls-1.2"]
		}

		sip_ssl_mode: {
			description: [
				"SSL/TLS mode for encryption &amp; decryption of traffic.",
				"choice | off | No SSL.",
				"choice | full | Client to FortiGate and FortiGate to Server SSL.",
			]
			required: false
			choices: ["off", "full"]
		}

		sip_ssl_pfs: {
			description: [
				"SSL Perfect Forward Secrecy.",
				"choice | require | PFS mandatory.",
				"choice | deny | PFS rejected.",
				"choice | allow | PFS allowed.",
			]
			required: false
			choices: ["require", "deny", "allow"]
		}

		sip_ssl_send_empty_frags: {
			description: [
				"Send empty fragments to avoid attack on CBC IV (SSL 3.0 &amp; TLS 1.0 only).",
				"choice | disable | Do not send empty fragments.",
				"choice | enable | Send empty fragments.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_ssl_server_certificate: {
			description: [
				"Name of Certificate return to the client in every SSL connection.",
			]
			required: false
		}

		sip_status: {
			description: [
				"Enable/disable SIP.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_strict_register: {
			description: [
				"Enable/disable only allow the registrar to connect.",
				"choice | disable | Disable status.",
				"choice | enable | Enable status.",
			]
			required: false
			choices: ["disable", "enable"]
		}

		sip_subscribe_rate: {
			description: [
				"SUBSCRIBE request rate limit (per second, per policy).",
			]
			required: false
		}

		sip_unknown_header: {
			description: [
				"Action for unknown SIP header.",
				"choice | pass | Bypass malformed messages.",
				"choice | discard | Discard malformed messages.",
				"choice | respond | Respond with error code.",
			]
			required: false
			choices: ["pass", "discard", "respond"]
		}

		sip_update_rate: {
			description: [
				"UPDATE request rate limit (per second, per policy).",
			]
			required: false
		}
	}
}
