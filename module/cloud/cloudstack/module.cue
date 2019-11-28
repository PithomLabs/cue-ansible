package cloudstack

cs_securitygroup_rule :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_securitygroup_rule: {

		// State of the security group rule.

		state?: string

		// Security group this rule is based of.

		user_security_group?: string

		// End port for this rule. Required if I(protocol=tcp) or I(protocol=udp), but I(start_port) will be used if not set.

		end_port?: int

		// Error code for this icmp message. Required if I(protocol=icmp).

		icmp_code?: int

		// Type of the icmp message being sent. Required if I(protocol=icmp).

		icmp_type?: int

		// Poll async jobs until job has finished.

		poll_async?: bool

		// Start port for this rule. Required if I(protocol=tcp) or I(protocol=udp).

		start_port?: int

		// Ingress or egress security group rule.

		type?: string

		// CIDR (full notation) to be used for security group rule.

		cidr?: string

		// Name of the project the security group to be created in.

		project?: string

		// Protocol of the security group rule.

		protocol?: string

		// Name of the security group the rule is related to. The security group must be existing.

		security_group: string
	}
}

cs_loadbalancer_rule_member :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_loadbalancer_rule_member: {

		// List of VMs to assign to or remove from the rule.

		vms: [...]

		// Public IP address from where the network traffic will be load balanced from.
		// Only needed to find the rule if I(name) is not unique.

		ip_address?: string

		// Domain the rule is related to.

		domain?: string

		// The name of the load balancer rule.

		name: string

		// Poll async jobs until job has finished.

		poll_async?: bool

		// Name of the project the firewall rule is related to.

		project?: string

		// Should the VMs be present or absent from the rule.

		state?: string

		// Name of the zone in which the rule should be located.
		// If not set, default zone is used.

		zone?: string

		// Account the rule is related to.

		account?: string
	}
}

cs_physical_network :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_physical_network: {

		// List of Network Service Providers to enable.

		nsps_enabled?: [...]

		// A tag to identify this network.
		// Physical networks support only one tag.
		// To remove an existing tag pass an empty string.

		tags?: string

		// Domain the network is owned by.

		domain?: string

		// Isolation method for the physical network.

		isolation_method?: string

		// Name of the physical network.

		name: string

		// Poll async jobs until job has finished.

		poll_async?: bool

		// State of the physical network.

		state?: string

		// The VLAN/VNI Ranges of the physical network.

		vlan?: string

		// Name of the zone in which the network belongs.
		// If not set, default zone is used.

		zone?: string

		// broadcast domain range for the physical network[Pod or Zone].

		broadcast_domain_range?: string

		// The speed for the physical network.

		network_speed?: string

		// List of Network Service Providers to disable.

		nsps_disabled?: [...]
	}
}

cs_affinitygroup :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_affinitygroup: {

		// Poll async jobs until job has finished.

		poll_async?: bool

		// Name of the project the affinity group is related to.

		project?: string

		// State of the affinity group.

		state?: string

		// Account the affinity group is related to.

		account?: string

		// Type of the affinity group. If not specified, first found affinity type is used.

		affinity_type?: string

		// Description of the affinity group.

		description?: string

		// Domain the affinity group is related to.

		domain?: string

		// Name of the affinity group.

		name: string
	}
}

cs_pod :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_pod: {

		// Gateway for the Pod.
		// Required on I(state=present)

		gateway?: string

		// uuid of the existing pod.

		id?: string

		// Name of the pod.

		name: string

		// Netmask for the Pod.
		// Required on I(state=present)

		netmask?: string

		// Starting IP address for the Pod.
		// Required on I(state=present)

		start_ip?: string

		// State of the pod.

		state?: string

		// Name of the zone in which the pod belongs to.
		// If not set, default zone is used.

		zone?: string

		// Ending IP address for the Pod.

		end_ip?: string
	}
}

cs_vpc_offering :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_vpc_offering: {

		// provider to service mapping. If not specified, the provider for the service will be mapped to the default provider on the physical network

		service_providers?: [...]

		// State of the vpc offering.

		state?: string

		// Services supported by the vpc offering

		supported_services?: [...]

		// Display text of the vpc offerings

		display_text?: string

		// The name of the vpc offering

		name: string

		// Poll async jobs until job has finished.

		poll_async?: bool

		// Desired service capabilities as part of vpc offering.

		service_capabilities?: [...]

		// The name or ID of the service offering for the VPC router appliance.

		service_offering?: string
	}
}

cs_cluster :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_cluster: {

		// Type of virtual switch used for public traffic in the cluster.
		// Allowed values are, vmwaresvs (for VMware standard vSwitch) and vmwaredvs (for VMware distributed vSwitch)

		public_vswitch_type?: string

		// URL for the cluster

		url?: string

		// IP address of the VSM associated with this cluster.

		vms_ip_address?: string

		// Ovm3 native OCFS2 clustering enabled for cluster.

		ovm3_cluster?: string

		// Name the hypervisor to be used.
		// Required if I(state=present).
		// Possible values are C(KVM), C(VMware), C(BareMetal), C(XenServer), C(LXC), C(HyperV), C(UCS), C(OVM), C(Simulator).

		hypervisor?: string

		// Ovm3 native pooling enabled for cluster.

		ovm3_pool?: string

		// Password for the cluster.

		password?: string

		// Name of virtual switch used for guest traffic in the cluster.
		// This would override zone wide traffic label setting.

		guest_vswitch_name?: string

		// Type of virtual switch used for guest traffic in the cluster.
		// Allowed values are, vmwaresvs (for VMware standard vSwitch) and vmwaredvs (for VMware distributed vSwitch)

		guest_vswitch_type?: string

		// name of the cluster.

		name: string

		// Ovm3 vip to use for pool (and cluster).

		ovm3_vip?: string

		// Username for the cluster.

		username?: string

		// Password for the VSM associated with this cluster.

		vms_password?: string

		// Type of the cluster.
		// Required if I(state=present)

		cluster_type?: string

		// Name of virtual switch used for public traffic in the cluster.
		// This would override zone wide traffic label setting.

		public_vswitch_name?: string

		// State of the cluster.

		state?: string

		// Username for the VSM associated with this cluster.

		vms_username?: string

		// Name of the zone in which the cluster belongs to.
		// If not set, default zone is used.

		zone?: string

		// Name of the pod in which the cluster belongs to.

		pod?: string
	}
}

cs_vpn_connection :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_vpn_connection: {

		// Domain the VPN connection is related to.

		domain?: string

		// Name of the project the VPN connection is related to.

		project?: string

		// Name of the zone the VPC is related to.
		// If not set, default zone is used.

		zone?: string

		// Name of the VPC the VPN connection is related to.

		vpc: string

		// Name of the VPN customer gateway.

		vpn_customer_gateway: string

		// Account the VPN connection is related to.

		account?: string

		// Activate the VPN gateway if not already activated on I(state=present).
		// Also see M(cs_vpn_gateway).

		force?: bool

		// State of the VPN connection.
		// Only considered when I(state=present).

		passive?: bool

		// Poll async jobs until job has finished.

		poll_async?: bool

		// State of the VPN connection.

		state?: string
	}
}

cs_zone_info :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_zone_info: {

		zone?: string

		// Name of the zone.
		// If not specified, all zones are returned
	}
}

cs_traffic_type :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_traffic_type: {

		// The network name of the physical device dedicated to this traffic on an OVM3 host.

		ovm3_networklabel?: string

		// the name of the Physical Network

		physical_network: string

		// Poll async jobs until job has finished.

		poll_async?: bool

		// State of the traffic type

		state?: string

		// The network name label of the physical device dedicated to this traffic on a XenServer host.

		xen_networklabel?: string

		// Name of the zone with the physical network.
		// Default zone will be used if this is empty.

		zone?: string

		// The network name label of the physical device dedicated to this traffic on a HyperV host.

		hyperv_networklabel?: string

		// The network name label of the physical device dedicated to this traffic on a KVM host.

		kvm_networklabel?: string

		// The VLAN id to be used for Management traffic by VMware host.

		vlan?: string

		// The network name label of the physical device dedicated to this traffic on a VMware host.

		vmware_networklabel?: string

		// Use if the physical network has multiple isolation types and traffic type is public.

		isolation_method?: string

		// the trafficType to be added to the physical network.

		traffic_type: string
	}
}

cs_project :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_project: {

		// List of tags. Tags are a list of dictionaries having keys I(key) and I(value).
		// If you want to delete all tags, set a empty list e.g. I(tags: []).

		tags?: [...]

		// Account the project is related to.

		account?: string

		// Display text of the project.
		// If not specified, I(name) will be used as I(display_text).

		display_text?: string

		// Domain the project is related to.

		domain?: string

		// Name of the project.

		name: string

		// Poll async jobs until job has finished.

		poll_async?: bool

		// State of the project.

		state?: string
	}
}

cs_service_offering :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_service_offering: {

		// The number of CPUs of the service offering.

		cpu_number?: int

		// Display text of the service offering.
		// If not set, I(name) will be used as I(display_text) while creating.

		display_text?: string

		// Hypervisor snapshot reserve space as a percent of a volume.
		// Only for managed storage using Xen or VMware.

		hypervisor_snapshot_reserve?: int

		// Provisioning type used to create volumes.

		provisioning_type?: string

		// The storage type of the service offering.

		storage_type?: string

		// The system VM type.
		// Required if I(is_system=yes).

		system_vm_type?: string

		// The CPU speed of the service offering in MHz.

		cpu_speed?: int

		// Max. iops of the compute offering.

		disk_iops_max?: int

		// Whether it is a system VM offering or not.

		is_system?: bool

		// Restrict the CPU usage to committed service offering.

		limit_cpu_usage?: bool

		// Details for planner, used to store specific parameters.
		// A list of dictionaries having keys C(key) and C(value).

		service_offering_details?: [...]

		// Min. iops of the compute offering.

		disk_iops_min?: int

		// The host tags for this service offering.

		host_tags?: [...]

		// State of the service offering.

		state?: string

		// Bytes read rate of the disk offering.

		disk_bytes_read_rate?: int

		// Bytes write rate of the disk offering.

		disk_bytes_write_rate?: int

		// IO requests read rate of the disk offering.

		disk_iops_read_rate?: int

		// Domain the service offering is related to.
		// Public for all domains and subdomains if not set.

		domain?: string

		// Whether the offering is customizable or not.

		is_customized?: bool

		// Name of the service offering.

		name: string

		// Whether HA is set for the service offering.

		offer_ha?: bool

		// The deployment planner heuristics used to deploy a VM of this offering.
		// If not set, the value of global config I(vm.deployment.planner) is used.

		deployment_planner?: string

		// Whether compute offering iops is custom or not.

		is_iops_customized?: bool

		// Data transfer rate in Mb/s allowed.
		// Supported only for non-system offering and system offerings having I(system_vm_type=domainrouter).

		network_rate?: int

		// The storage tags for this service offering.

		storage_tags?: [...]

		// Whether the virtual machine needs to be volatile or not.
		// Every reboot of VM the root disk is detached then destroyed and a fresh root disk is created and attached to VM.

		is_volatile?: bool

		// IO requests write rate of the disk offering.

		disk_iops_write_rate?: int

		// The total memory of the service offering in MB.

		memory?: int
	}
}

cs_staticnat :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_staticnat: {

		// Network the IP address is related to.

		network?: string

		// Poll async jobs until job has finished.

		poll_async?: bool

		// Name of virtual machine which we make the static NAT for.
		// Required if I(state=present).

		vm?: string

		// VM guest NIC secondary IP address for the static NAT.

		vm_guest_ip?: string

		// Account the static NAT is related to.

		account?: string

		// Public IP address the static NAT is assigned to.

		ip_address: string

		// Name of the project the static NAT is related to.

		project?: string

		// State of the static NAT.

		state?: string

		// VPC the network related to.

		vpc?: string

		// Name of the zone in which the virtual machine is in.
		// If not set, default zone is used.

		zone?: string

		// Domain the static NAT is related to.

		domain?: string
	}
}

cs_firewall :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_firewall: {

		// Type of the icmp message being sent.
		// Considered if I(protocol=icmp).

		icmp_type?: int

		// Protocol of the firewall rule.
		// C(all) is only available if I(type=egress).

		protocol?: string

		// Start port for this rule.
		// Considered if I(protocol=tcp) or I(protocol=udp).

		start_port?: int

		// State of the firewall rule.

		state?: string

		// Domain the firewall rule is related to.

		domain?: string

		// End port for this rule. Considered if I(protocol=tcp) or I(protocol=udp).
		// If not specified, equal I(start_port).

		end_port?: int

		// Network the egress rule is related to.
		// Required if I(type=egress).

		network?: string

		// Poll async jobs until job has finished.

		poll_async?: bool

		// Name of the zone in which the virtual machine is in.
		// If not set, default zone is used.

		zone?: string

		// Account the firewall rule is related to.

		account?: string

		// List of CIDRs (full notation) to be used for firewall rule.
		// Since version 2.5, it is a list of CIDR.

		cidrs?: [...]

		// List of tags. Tags are a list of dictionaries having keys I(key) and I(value).
		// To delete all tags, set an empty list e.g. I(tags: []).

		tags?: [...]

		// Type of the firewall rule.

		type?: string

		// Error code for this icmp message.
		// Considered if I(protocol=icmp).

		icmp_code?: int

		// Public IP address the ingress rule is assigned to.
		// Required if I(type=ingress).

		ip_address?: string

		// Name of the project the firewall rule is related to.

		project?: string
	}
}

cs_instancegroup :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_instancegroup: {

		// Project the instance group is related to.

		project?: string

		// State of the instance group.

		state?: string

		// Account the instance group is related to.

		account?: string

		// Domain the instance group is related to.

		domain?: string

		// Name of the instance group.

		name: string
	}
}

cs_region :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_region: {

		// ID of the region.
		// Must be an number (int).

		id: int

		// Name of the region.
		// Required if I(state=present)

		name?: string

		// State of the region.

		state?: string

		// Endpoint URL of the region.
		// Required if I(state=present)

		endpoint?: string
	}
}

cs_volume :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_volume: {

		// Account the volume is related to.

		account?: string

		// Whether to display the volume to the end user or not.
		// Allowed to Root Admins only.

		display_volume?: bool

		// Name of the domain the volume to be deployed in.

		domain?: string

		// The format for the volume.
		// Only considered if I(state=uploaded).

		format?: string

		// Max iops

		max_iops?: int

		// Min iops

		min_iops?: int

		// Name of the zone in which the volume should be deployed.
		// If not set, default zone is used.

		zone?: string

		// Custom id to the resource.
		// Allowed to Root Admins only.

		custom_id?: string

		// ID of the device on a VM the volume is attached to.
		// Only considered if I(state) is C(attached).

		device_id?: int

		// Name of the disk offering to be used.
		// Required one of I(disk_offering), I(snapshot) if volume is not already I(state=present).

		disk_offering?: string

		// State of the volume.
		// The choices C(extracted) and C(uploaded) were added in version 2.8.

		state?: string

		// List of tags. Tags are a list of dictionaries having keys I(key) and I(value).
		// To delete all tags, set a empty list e.g. I(tags: []).

		tags?: [...]

		// URL to which the volume would be extracted on I(state=extracted)
		// or the URL where to download the volume on I(state=uploaded).
		// Only considered if I(state) is C(extracted) or C(uploaded).

		url?: string

		// Force removal of volume even it is attached to a VM.
		// Considered on I(state=absent) only.

		force?: bool

		// Mode for the volume extraction.
		// Only considered if I(state=extracted).

		mode?: string

		// The snapshot name for the disk volume.
		// Required one of I(disk_offering), I(snapshot) if volume is not already I(state=present).

		snapshot?: string

		// Name of the volume.
		// I(name) can only contain ASCII letters.

		name: string

		// Poll async jobs until job has finished.

		poll_async?: bool

		// Name of the project the volume to be deployed in.

		project?: string

		// Whether to allow to shrink the volume.

		shrink_ok?: bool

		// Size of disk in GB

		size?: int

		// Name of the virtual machine to attach the volume to.

		vm?: string
	}
}

cs_account :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_account: {

		// Type of the ldap name. GROUP or OU, defaults to GROUP.

		ldap_type?: string

		// Password of the user to be created if account did not exist.
		// Required on I(state=present) if I(ldap_domain) is not set.

		password?: string

		// Type of the account.

		account_type?: string

		// First name of the user to be created if account did not exist.
		// Required on I(state=present) if I(ldap_domain) is not set.

		first_name?: string

		// Last name of the user to be created if account did not exist.
		// Required on I(state=present) if I(ldap_domain) is not set.

		last_name?: string

		// Network domain of the account.

		network_domain?: string

		// Poll async jobs until job has finished.

		poll_async?: bool

		// State of the account.
		// C(unlocked) is an alias for C(enabled).

		state?: string

		// Domain the account is related to.

		domain?: string

		// Email of the user to be created if account did not exist.
		// Required on I(state=present) if I(ldap_domain) is not set.

		email?: string

		// Name of the LDAP group or OU to bind.
		// If set, account will be linked to LDAP.

		ldap_domain?: string

		// Name of account.

		name: string

		// Creates the account under the specified role name or id.

		role?: string

		// Timezone of the user to be created if account did not exist.

		timezone?: string

		// Username of the user to be created if account did not exist.
		// Required on I(state=present).

		username?: string
	}
}

cs_instance_nic_secondaryip :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_instance_nic_secondaryip: {

		// Account the instance is related to.

		account?: string

		// Secondary IP address to be added to the instance nic.
		// If not set, the API always returns a new IP address and idempotency is not given.

		vm_guest_ip?: string

		// Name of the VPC the I(vm) is related to.

		vpc?: string

		// Name of instance.

		vm: string

		// Name of the zone in which the instance is deployed in.
		// If not set, default zone is used.

		zone?: string

		// Domain the instance is related to.

		domain?: string

		// Name of the network.
		// Required to find the NIC if instance has multiple networks assigned.

		network?: string

		// Poll async jobs until job has finished.

		poll_async?: bool

		// Name of the project the instance is deployed in.

		project?: string

		// State of the ipaddress.

		state?: string
	}
}

cs_instance_password_reset :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_instance_password_reset: {

		// Poll async jobs until job has finished.

		poll_async?: bool

		// Name of the project the virtual machine belongs to.

		project?: string

		// Name of the virtual machine to reset the password on.

		vm: string

		// Name of the zone in which the instance is deployed.
		// If not set, the default zone is used.

		zone?: string

		// Account the virtual machine belongs to.

		account?: string

		// Name of the domain the virtual machine belongs to.

		domain?: string
	}
}

cs_storage_pool :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_storage_pool: {

		// Bytes CloudStack can provision from this storage pool.

		capacity_iops?: int

		// Required when creating a zone scoped pool.
		// Possible values are C(KVM), C(VMware), C(BareMetal), C(XenServer), C(LXC), C(HyperV), C(UCS), C(OVM), C(Simulator).

		hypervisor?: string

		// Name of the storage provider e.g. SolidFire, SolidFireShared, DefaultPrimary, CloudByte.

		provider?: string

		// The scope of the storage pool.
		// Defaults to cluster when C(cluster) is provided, otherwise zone.

		scope?: string

		// Tags associated with this storage pool.

		storage_tags?: [...]

		// URL of the storage pool.
		// Required if I(state=present).

		storage_url?: string

		// Name of the cluster.

		cluster?: string

		// Name of the storage pool.

		name: string

		// Name of the pod.

		pod?: string

		// State of the storage pool.

		state?: string

		// Allocation state of the storage pool.

		allocation_state?: string

		// Whether the storage pool should be managed by CloudStack.
		// Only considered on creation.

		managed?: bool

		// Bytes CloudStack can provision from this storage pool.

		capacity_bytes?: int

		// Name of the zone in which the host should be deployed.
		// If not set, default zone is used.

		zone?: string
	}
}

cs_zone_facts :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_zone_facts: {

		zone: string

		// Name of the zone.
	}
}

cs_image_store :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_image_store: {

		// Stage of the Image Store

		state?: string

		// The URL for the Image Store.
		// Required when I(state=present).

		url?: string

		// The Zone name for the Image Store.

		zone: string

		// Set to C(yes) if you're changing an existing Image Store.
		// This will force the recreation of the Image Store.
		// Recreation might fail if there are snapshots present on the Image Store. Delete them before running the recreation.

		force_recreate?: bool

		// The ID of the Image Store. Required when deleting a Image Store.

		name: string

		// The image store provider name. Required when creating a new Image Store

		provider?: string
	}
}

cs_user :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_user: {

		// Account the user will be created under.
		// Required on I(state=present).

		account?: string

		// Last name of the user.
		// Required on I(state=present).

		last_name?: string

		// Password of the user to be created.
		// Required on I(state=present).
		// Only considered on creation and will not be updated if user exists.

		password?: string

		// Domain the user is related to.

		domain?: string

		// Email of the user.
		// Required on I(state=present).

		email?: string

		// First name of the user.
		// Required on I(state=present).

		first_name?: string

		// If API keys of the user should be generated.
		// Note: Keys can not be removed by the API again.

		keys_registered?: bool

		// Poll async jobs until job has finished.

		poll_async?: bool

		// State of the user.
		// C(unlocked) is an alias for C(enabled).

		state?: string

		// Timezone of the user.

		timezone?: string

		// Username of the user.

		username: string
	}
}

cs_instance :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_instance: {

		// Force stop/start the instance if required to apply changes, otherwise a running instance will not be changed.

		force?: bool

		// List of mappings in the form I({'network': NetworkName, 'ip': 1.2.3.4})
		// Mutually exclusive with I(networks) option.

		ip_to_networks?: [...]

		// IPv6 address for default instance's network.

		ip6_address?: string

		// List of security groups the instance to be applied to.

		security_groups?: [...]

		// Name or id of the service offering of the new instance.
		// If not set, first found service offering is used.

		service_offering?: string

		// The number of CPUs to allocate to the instance, used with custom service offerings

		cpu?: int

		// Domain the instance is related to.

		domain?: string

		// The memory allocated to the instance, used with custom service offerings

		memory?: int

		// List of networks to use for the new instance.

		networks?: [...]

		// Name, display text or id of the template to be used for creating the new instance.
		// Required when using I(state=present).
		// Mutually exclusive with I(iso) option.

		template?: string

		// Optional data (ASCII) that can be sent to the instance upon a successful deployment.
		// The data will be automatically base64 encoded.
		// Consider switching to HTTP_POST by using I(CLOUDSTACK_METHOD=post) to increase the HTTP_GET size limit of 2KB to 32 KB.

		user_data?: string

		// Custom display name of the instances.
		// Display name will be set to I(name) if not specified.
		// Either I(name) or I(display_name) is required.

		display_name?: string

		// Name of the zone in which the instance should be deployed.
		// If not set, default zone is used.

		zone?: string

		// Enables a volume shrinkage when the new size is smaller than the old one.

		allow_root_disk_shrink?: bool

		// State of the instance.

		state?: string

		// List of tags. Tags are a list of dictionaries having keys C(key) and C(value).
		// If you want to delete all tags, set a empty list e.g. I(tags: []).

		tags?: [...]

		// Name of the filter used to search for the template or iso.
		// Used for params I(iso) or I(template) on I(state=present).
		// The filter C(all) was added in 2.6.

		template_filter?: string

		// Poll async jobs until job has finished.

		poll_async?: bool

		// Name of the disk offering to be used.

		disk_offering?: string

		// IPv4 address for default instance's network during creation.

		ip_address?: string

		// Root disk size in GByte required if deploying instance with KVM hypervisor and want resize the root disk size at startup (need CloudStack >= 4.4, cloud-initramfs-growroot installed and enabled in the template)

		root_disk_size?: int

		// The clock speed/shares allocated to the instance, used with custom service offerings

		cpu_speed?: int

		// Affinity groups names to be applied to the new instance.

		affinity_groups?: [...]

		// Map to specify custom parameters.

		details?: {...}

		// Host on which an instance should be deployed or started on.
		// Only considered when I(state=started) or instance is running.
		// Requires root admin privileges.

		host?: string

		// Name the hypervisor to be used for creating the new instance.
		// Relevant when using I(state=present), but only considered if not set on ISO/template.
		// If not set or found on ISO/template, first found hypervisor will be used.
		// Possible values are C(KVM), C(VMware), C(BareMetal), C(XenServer), C(LXC), C(HyperV), C(UCS), C(OVM), C(Simulator).

		hypervisor?: string

		// Keyboard device type for the instance.

		keyboard?: string

		// Host name of the instance. C(name) can only contain ASCII letters.
		// Name will be generated (UUID) by CloudStack if not specified and can not be changed afterwards.
		// Either C(name) or C(display_name) is required.

		name?: string

		// Account the instance is related to.

		account?: string

		// Group in where the new instance should be in.

		group?: string

		// Name or id of the ISO to be used for creating the new instance.
		// Required when using I(state=present).
		// Mutually exclusive with I(template) option.

		iso?: string

		// Name of the project the instance to be deployed in.

		project?: string

		// Name of the SSH key to be deployed on the new instance.

		ssh_key?: string

		// Disk size in GByte required if deploying instance from ISO.

		disk_size?: int
	}
}

cs_instance_facts :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_instance_facts: {

		// Name or display name of the instance.

		name: string

		// Project the instance is related to.

		project?: string

		// Account the instance is related to.

		account?: string

		// Domain the instance is related to.

		domain?: string
	}
}

cs_role :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_role: {

		// Description of the role.

		description?: string

		// Name of the role.

		name: string

		// Type of the role.
		// Only considered for creation.

		role_type?: string

		// State of the role.

		state?: string

		// ID of the role.
		// If provided, I(uuid) is used as key.

		uuid?: string
	}
}

cs_router :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_router: {

		// Account the router is related to.

		account?: string

		// Domain the router is related to.

		domain?: string

		// Name of the router.

		name: string

		// Poll async jobs until job has finished.

		poll_async?: bool

		// Name of the project the router is related to.

		project?: string

		// Name or id of the service offering of the router.

		service_offering?: string

		// State of the router.

		state?: string

		// Name of the zone the router is deployed in.
		// If not set, all zones are used.

		zone?: string
	}
}

cs_snapshot_policy :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_snapshot_policy: {

		// Name of the vpc the instance is deployed in.

		vpc?: string

		// Account the volume is related to.

		account?: string

		// Domain the volume is related to.

		domain?: string

		// Name of the project the volume is related to.

		project?: string

		// Time the snapshot is scheduled. Required if I(state=present).
		// Format for I(interval_type=HOURLY): C(MM)
		// Format for I(interval_type=DAILY): C(MM:HH)
		// Format for I(interval_type=WEEKLY): C(MM:HH:DD (1-7))
		// Format for I(interval_type=MONTHLY): C(MM:HH:DD (1-28))

		schedule?: string

		// State of the snapshot policy.

		state?: string

		// Type of the volume.

		volume_type?: string

		// ID of the device on a VM the volume is attached to.
		// This will only be considered if VM has multiple DATADISK volumes.

		device_id?: int

		// Interval of the snapshot.

		interval_type?: string

		// Max number of snapshots.

		max_snaps?: int

		// Specifies a timezone for this command.

		time_zone?: string

		// Name of the instance to select the volume from.
		// Use I(volume_type) if VM has a DATADISK and ROOT volume.
		// In case of I(volume_type=DATADISK), additionally use I(device_id) if VM has more than one DATADISK volume.
		// Either I(volume) or I(vm) is required.

		vm?: string

		// Name of the volume.
		// Either I(volume) or I(vm) is required.

		volume?: string
	}
}

cs_vpc :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_vpc: {

		// State of the VPC.
		// The state C(present) creates a started VPC.
		// The state C(stopped) is only considered while creating the VPC, added in version 2.6.

		state?: string

		// List of tags. Tags are a list of dictionaries having keys I(key) and I(value).
		// For deleting all tags, set an empty list e.g. I(tags: []).

		tags?: [...]

		// Name of the VPC offering.
		// If not set, default VPC offering is used.

		vpc_offering?: string

		// Name of the zone.
		// If not set, default zone is used.

		zone?: string

		// CIDR of the VPC, e.g. 10.1.0.0/16
		// All VPC guest networks' CIDRs must be within this CIDR.
		// Required on I(state=present).

		cidr?: string

		// Display text of the VPC.
		// If not set, I(name) will be used for creating.

		display_text?: string

		// Poll async jobs until job has finished.

		poll_async?: bool

		// Name of the project the VPC is related to.

		project?: string

		// Network domain for the VPC.
		// All networks inside the VPC will belong to this domain.
		// Only considered while creating the VPC, can not be changed.

		network_domain?: string

		// Account the VPC is related to.

		account?: string

		// Whether to redeploy a VPC router or not when I(state=restarted)

		clean_up?: bool

		// Domain the VPC is related to.

		domain?: string

		// Name of the VPC.

		name: string
	}
}

cs_facts :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_facts: {

		// Host or IP of the meta data API service.
		// If not set, determination by parsing the dhcp lease file.

		meta_data_host?: string

		// Filter for a specific fact.

		filter?: string
	}
}

cs_role_permission :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_role_permission: {

		// The parent role permission uuid. use 0 to move this rule at the top of the list.

		parent?: string

		// The rule permission, allow or deny. Defaulted to deny.

		permission?: string

		// Name or ID of the role.

		role: string

		// State of the role permission.

		state?: string

		// The description of the role permission.

		description?: string

		// The API name of the permission.

		name: string
	}
}

cs_instance_info :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_instance_info: {

		// Account the instance is related to.

		account?: string

		// Domain the instance is related to.

		domain?: string

		// Name or display name of the instance.
		// If not specified, all instances are returned

		name?: string

		// Project the instance is related to.

		project?: string
	}
}

cs_ip_address :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_ip_address: {

		// Public IP address.
		// Required if I(state=absent) and I(tags) is not set.

		ip_address?: string

		// Network the IP address is related to.
		// Mutually exclusive with I(vpc).

		network?: string

		// Name of the project the IP address is related to.

		project?: string

		// VPC the IP address is related to.
		// Mutually exclusive with I(network).

		vpc?: string

		// Name of the zone in which the IP address is in.
		// If not set, default zone is used.

		zone?: string

		// Account the IP address is related to.

		account?: string

		// Domain the IP address is related to.

		domain?: string

		// Poll async jobs until job has finished.

		poll_async?: bool

		// State of the IP address.

		state?: string

		// List of tags. Tags are a list of dictionaries having keys I(key) and I(value).
		// Tags can be used as an unique identifier for the IP Addresses.
		// In this case, at least one of them must be unique to ensure idempotency.

		tags?: [...]
	}
}

cs_network :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_network: {

		// Name (case sensitive) of the network.

		name: string

		// Name of the offering for the network.
		// Required if I(state=present).

		network_offering?: string

		// List of tags. Tags are a list of dictionaries having keys I(key) and I(value).
		// To delete all tags, set a empty list e.g. I(tags: []).

		tags?: [...]

		// Name of the VPC of the network.

		vpc?: string

		// The ending IPv6 address of the network belongs to.
		// If not specified, value of I(start_ipv6) is used.
		// Only considered on create.

		end_ipv6?: string

		// The isolated private VLAN for this network.

		isolated_pvlan?: string

		// The network domain.

		network_domain?: string

		// Name of the project the network to be deployed in.

		project?: string

		// State of the network.

		state?: string

		// The ID or VID of the network.

		vlan?: string

		// Access control type for the network.
		// If not specified, Cloudstack will default to C(account) for isolated networks
		// and C(domain) for shared networks.
		// Only considered on create.

		acl_type?: string

		// Display text of the network.
		// If not specified, I(name) will be used as I(display_text).

		display_text?: string

		// The gateway of the network.
		// Required for shared networks and isolated networks when it belongs to a VPC.
		// Only considered on create.

		gateway?: string

		// The gateway of the IPv6 network.
		// Required for shared networks.
		// Only considered on create.

		gateway_ipv6?: string

		// Poll async jobs until job has finished.

		poll_async?: bool

		// The beginning IPv4 address of the network belongs to.
		// Only considered on create.

		start_ip?: string

		// The beginning IPv6 address of the network belongs to.
		// Only considered on create.

		start_ipv6?: string

		// Name of the zone in which the network should be deployed.
		// If not set, default zone is used.

		zone?: string

		// Domain the network is related to.

		domain?: string

		// The ending IPv4 address of the network belongs to.
		// If not specified, value of I(start_ip) is used.
		// Only considered on create.

		end_ip?: string

		// CIDR of IPv6 network, must be at least /64.
		// Only considered on create.

		cidr_ipv6?: string

		// Cleanup old network elements.
		// Only considered on I(state=restarted).

		clean_up?: bool

		// The netmask of the network.
		// Required for shared networks and isolated networks when it belongs to a VPC.
		// Only considered on create.

		netmask?: string

		// Defines whether to allow subdomains to use networks dedicated to their parent domain(s).
		// Should be used with I(acl_type=domain).
		// Only considered on create.

		subdomain_access?: bool

		// Account the network is related to.

		account?: string

		// The name of the access control list for the VPC network tier.

		acl?: string
	}
}

cs_network_offering :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_network_offering: {

		// The availability of network offering. Default value is Optional

		availability?: string

		// Display text of the network offerings.

		display_text?: string

		// True if network offering supports persistent networks
		// defaulted to false if not specified

		persistent?: bool

		// The traffic type for the network offering.

		traffic_type?: string

		// Whether the network offering has IP conserve mode enabled.

		conserve_mode?: bool

		// Whether the default egress policy is allow or to deny.

		egress_default_policy?: string

		// Data transfer rate in megabits per second allowed.

		network_rate?: int

		// Provider to service mapping.
		// If not specified, the provider for the service will be mapped to the default provider on the physical network.

		service_providers?: [...]

		// State of the network offering.

		state?: string

		// Services supported by the network offering.
		// A list of one or more items from the choice list.

		supported_services?: [...]

		// Guest type of the network offering.

		guest_ip_type?: string

		// Maximum number of concurrent connections supported by the network offering.

		max_connections?: int

		// The name of the network offering.

		name: string

		// Desired service capabilities as part of network offering.

		service_capabilities?: [...]

		// The service offering name or ID used by virtual router provider.

		service_offering?: string

		// Whether the network offering supports specifying IP ranges.
		// Defaulted to C(no) by the API if not specified.

		specify_ip_ranges?: bool

		// Network offering details in key/value pairs.
		// with service provider as a value

		details?: [...]

		// Whether the offering is meant to be used for VPC or not.

		for_vpc?: bool

		// If true keepalive will be turned on in the loadbalancer.
		// At the time of writing this has only an effect on haproxy.
		// the mode http and httpclose options are unset in the haproxy conf file.

		keepalive_enabled?: bool

		// Whether the network offering supports vlans or not.

		specify_vlan?: bool
	}
}

cs_portforward :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_portforward: {

		// Public IP address the rule is assigned to.

		ip_address: string

		// Name of the network.

		network?: string

		// End private port for this rule.
		// If not specified equal I(private_port).

		private_end_port?: int

		// Name of the project the I(vm) is located in.

		project?: string

		// Start public port for this rule.

		public_port: int

		// VM guest NIC secondary IP address for the port forwarding rule.

		vm_guest_ip?: string

		// List of tags. Tags are a list of dictionaries having keys I(key) and I(value).
		// To delete all tags, set a empty list e.g. I(tags: []).

		tags?: [...]

		// Start private port for this rule.

		private_port: int

		// Protocol of the port forwarding rule.

		protocol?: string

		// State of the port forwarding rule.

		state?: string

		// Name of the VPC.

		vpc?: string

		// Name of the zone in which the virtual machine is in.
		// If not set, default zone is used.

		zone?: string

		// Account the I(vm) is related to.

		account?: string

		// Domain the I(vm) is related to.

		domain?: string

		// Whether the firewall rule for public port should be created, while creating the new rule.
		// Use M(cs_firewall) for managing firewall rules.

		open_firewall?: bool

		// Poll async jobs until job has finished.

		poll_async?: bool

		// End public port for this rule.
		// If not specified equal I(public_port).

		public_end_port?: int

		// Name of virtual machine which we make the port forwarding rule for.
		// Required if I(state=present).

		vm?: string
	}
}

cs_configuration :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_configuration: {

		// Ensure the value for corresponding account.

		account?: string

		// Ensure the value for corresponding cluster.

		cluster?: string

		// Domain the account is related to.
		// Only considered if I(account) is used.

		domain?: string

		// Name of the configuration.

		name: string

		// Ensure the value for corresponding storage pool.

		storage?: string

		// Value of the configuration.

		value: string

		// Ensure the value for corresponding zone.

		zone?: string
	}
}

cs_sshkeypair :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_sshkeypair: {

		// Account the public key is related to.

		account?: string

		// Domain the public key is related to.

		domain?: string

		// Name of public key.

		name: string

		// Name of the project the public key to be registered in.

		project?: string

		// String of the public key.

		public_key?: string

		// State of the public key.

		state?: string
	}
}

cs_securitygroup :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_securitygroup: {

		// Domain the security group is related to.

		domain?: string

		// Name of the security group.

		name: string

		// Name of the project the security group to be created in.

		project?: string

		// State of the security group.

		state?: string

		// Account the security group is related to.

		account?: string

		// Description of the security group.

		description?: string
	}
}

cs_network_acl :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_network_acl: {

		// Poll async jobs until job has finished.

		poll_async?: bool

		// Name of the project the network ACL is related to.

		project?: string

		// Account the network ACL rule is related to.

		account?: string

		// Domain the network ACL rule is related to.

		domain?: string

		// Name of the network ACL.

		name: string

		// State of the network ACL.

		state?: string

		// VPC the network ACL is related to.

		vpc: string

		// Name of the zone the VPC is related to.
		// If not set, default zone is used.

		zone?: string

		// Description of the network ACL.
		// If not set, identical to I(name).

		description?: string
	}
}

cs_network_acl_rule :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_network_acl_rule: {

		// State of the network ACL rule.

		state?: string

		// Traffic type of the rule.

		traffic_type?: string

		// Action policy of the rule.

		action_policy?: string

		// Domain the VPC is related to.

		domain?: string

		// Name of the network ACL.

		network_acl: string

		// Name of the project the VPC is related to.

		project?: string

		// Protocol number from 1 to 256 required if I(protocol=by_number).

		protocol_number?: int

		// Account the VPC is related to.

		account?: string

		// CIDRs of the rule.

		cidrs?: [...]

		// Type of the icmp message being sent.
		// Considered if I(protocol=icmp).

		icmp_type?: int

		// List of tags. Tags are a list of dictionaries having keys I(key) and I(value).
		// If you want to delete all tags, set a empty list e.g. I(tags: []).

		tags?: [...]

		// Name of the zone the VPC related to.
		// If not set, default zone is used.

		zone?: string

		// Error code for this icmp message.
		// Considered if I(protocol=icmp).

		icmp_code?: int

		// Protocol of the rule

		protocol?: string

		// The position of the network ACL rule.

		rule_position: int

		// VPC the network ACL is related to.

		vpc: string

		// End port for this rule.
		// Considered if I(protocol=tcp) or I(protocol=udp).
		// If not specified, equal I(start_port).

		end_port?: int

		// Poll async jobs until job has finished.

		poll_async?: bool

		// Start port for this rule.
		// Considered if I(protocol=tcp) or I(protocol=udp).

		start_port?: int
	}
}

cs_vpn_gateway :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_vpn_gateway: {

		// Poll async jobs until job has finished.

		poll_async?: bool

		// Name of the project the VPN gateway is related to.

		project?: string

		// State of the VPN gateway.

		state?: string

		// Name of the VPC.

		vpc: string

		// Name of the zone the VPC is related to.
		// If not set, default zone is used.

		zone?: string

		// Account the VPN gateway is related to.

		account?: string

		// Domain the VPN gateway is related to.

		domain?: string
	}
}

cs_instance_nic :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_instance_nic: {

		// Name of the network.

		network: string

		// Name of the zone in which the instance is deployed in.
		// If not set, default zone is used.

		zone?: string

		// Account the instance is related to.

		account?: string

		// Domain the instance is related to.

		domain?: string

		// IP address to be used for the nic.

		ip_address?: string

		// Name of instance.

		vm: string

		// Name of the VPC the I(vm) is related to.

		vpc?: string

		// Poll async jobs until job has finished.

		poll_async?: bool

		// Name of the project the instance is deployed in.

		project?: string

		// State of the nic.

		state?: string
	}
}

cs_domain :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_domain: {

		// Poll async jobs until job has finished.

		poll_async?: bool

		// State of the domain.

		state?: string

		// Clean up all domain resources like child domains and accounts.
		// Considered on I(state=absent).

		clean_up?: bool

		// Network domain for networks in the domain.

		network_domain?: string

		// Path of the domain.
		// Prefix C(ROOT/) or C(/ROOT/) in path is optional.

		path: string
	}
}

cs_host :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_host: {

		// Url of the host used to create a host.
		// If not provided, C(http://) and param I(name) is used as url.
		// Only considered if I(state=present) and host does not yet exist.

		url?: string

		// Name of the zone in which the host should be deployed.
		// If not set, default zone is used.

		zone?: string

		// Allocation state of the host.

		allocation_state?: string

		// Name of the cluster.

		cluster?: string

		// Tags of the host.

		host_tags?: [...]

		// Password for the host.
		// Required if I(state=present) and host does not yet exist.

		password?: string

		// Username for the host.
		// Required if I(state=present) and host does not yet exist.

		username?: string

		// Name of the cluster.
		// Required if I(state=present) and host does not yet exist.
		// Possible values are C(KVM), C(VMware), C(BareMetal), C(XenServer), C(LXC), C(HyperV), C(UCS), C(OVM), C(Simulator).

		hypervisor?: string

		// Name of the host.

		name: string

		// Name of the pod.
		// Required if I(state=present) and host does not yet exist.

		pod?: string

		// State of the host.

		state?: string
	}
}

cs_template :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_template: {

		// Whether the template requires HVM or not.
		// Only considered while creating the template.

		requires_hvm?: bool

		// Name of the snapshot, created from the VM ROOT volume, the template will be created from.
		// I(vm) is required together with this argument.

		snapshot?: string

		// The tag for this template.

		template_tag?: string

		// Display text of the template.

		display_text?: string

		// Mode for the template extraction.
		// Only used if I(state=extracted).

		mode?: string

		// OS type that best represents the OS of this template.

		os_type?: string

		// The MD5 checksum value of this template.
		// If set, we search by checksum instead of name.

		checksum?: string

		// Options to find a template uniquely.
		// More than one allowed.

		template_find_options?: [...]

		// Allows the template or its derivatives to be extractable.

		is_extractable?: bool

		// Enable template password reset support.

		password_enabled?: bool

		// True if the template supports the sshkey upload feature.
		// Only considered if I(url) is used (API limitation).

		sshkey_enabled?: bool

		// Register the template to be featured.
		// Only used if I(state) is C(present).

		is_featured?: bool

		// Register the template to be publicly available to all users.
		// Only used if I(state) is C(present).

		is_public?: bool

		// Note: this flag was not implemented and therefore marked as deprecated.
		// Deprecated, will be removed in version 2.11.

		is_ready?: bool

		// State of the template.

		state?: string

		// URL of where the template is hosted on I(state=present).
		// URL to which the template would be extracted on I(state=extracted).
		// Mutually exclusive with I(vm).

		url?: string

		// Whether the template should be synced or removed across zones.
		// Only used if I(state) is C(present) or C(absent).

		cross_zones?: bool

		// Template details in key/value pairs.

		details?: string

		// The format for the template.
		// Only considered if I(state=present).

		format?: string

		// Domain the template, snapshot or VM is related to.

		domain?: string

		// Name of the project the template to be registered in.

		project?: string

		// Name of the zone you wish the template to be registered or deleted from.
		// If not specified, first found zone will be used.

		zone?: string

		// Name of the filter used to search for the template.
		// The filter C(all) was added in 2.7.

		template_filter?: string

		// 32 or 64 bits support.

		bits?: int

		// Register the template having XS/VMware tools installed in order to support dynamic scaling of VM CPU/memory.
		// Only used if I(state) is C(present).

		is_dynamically_scalable?: bool

		// Sets the template type to routing, i.e. if template is used to deploy routers.
		// Only considered if I(url) is used.

		is_routing?: bool

		// Name of the template.

		name: string

		// List of tags. Tags are a list of dictionaries having keys I(key) and I(value).
		// To delete all tags, set a empty list e.g. I(tags: []).

		tags?: [...]

		// VM name the template will be created from its volume or alternatively from a snapshot.
		// VM must be in stopped state if created from its volume.
		// Mutually exclusive with I(url).

		vm?: string

		// Account the template, snapshot or VM is related to.

		account?: string

		// Name the hypervisor to be used for creating the new template.
		// Relevant when using I(state=present).
		// Possible values are C(KVM), C(VMware), C(BareMetal), C(XenServer), C(LXC), C(HyperV), C(UCS), C(OVM), C(Simulator).

		hypervisor?: string

		// Poll async jobs until job has finished.

		poll_async?: bool
	}
}

cs_vlan_ip_range :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_vlan_ip_range: {

		// C(yes) if VLAN is of Virtual type, C(no) if Direct.
		// If set to C(yes) but neither I(physical_network) or I(network) is set CloudStack will try to add the VLAN range to the Physical Network with a Public traffic type.

		for_virtual_network?: bool

		// The network name or id.
		// Required if I(for_virtual_network) and I(physical_network) are not set.

		network?: string

		// The gateway of the VLAN IP range.
		// Required if I(state=present).

		gateway?: string

		// The netmask of the VLAN IP range.
		// Required if I(state=present).

		netmask?: string

		// The beginning IPv4 address in the VLAN IP range.
		// Only considered on create.

		start_ip: string

		// The CIDR of IPv6 network, must be at least /64.

		cidr_ipv6?: string

		// The ending IPv4 address in the VLAN IP range.
		// If not specified, value of I(start_ip) is used.
		// Only considered on create.

		end_ip?: string

		// The ending IPv6 address in the IPv6 network range.
		// If not specified, value of I(start_ipv6) is used.
		// Only considered on create.

		end_ipv6?: string

		// The physical network name or id.

		physical_network?: string

		// The beginning IPv6 address in the IPv6 network range.
		// Only considered on create.

		start_ipv6?: string

		// State of the network ip range.

		state?: string

		// The ID or VID of the network.
		// If not specified, will be defaulted to the vlan of the network.

		vlan?: string

		// The Zone ID of the VLAN IP range.
		// If not set, default zone is used.

		zone?: string

		// Account who owns the VLAN.
		// Mutually exclusive with I(project).

		account?: string

		// Domain of the account owning the VLAN.

		domain?: string

		// The gateway of the IPv6 network.
		// Only considered on create.

		gateway_ipv6?: string

		// Project who owns the VLAN.
		// Mutually exclusive with I(account).

		project?: string
	}
}

cs_vpn_customer_gateway :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_vpn_customer_gateway: {

		// Force encapsulation for NAT traversal.
		// Disabled per default by the API on creation if not set.

		force_encap?: bool

		// IPsec Preshared-Key.
		// Cannot contain newline or double quotes.
		// Required if I(state=present).

		ipsec_psk?: string

		// State of the VPN customer gateway.

		state?: string

		// Account the VPN customer gateway is related to.

		account?: string

		// Lifetime in seconds of phase 2 VPN connection.
		// Defaulted to 3600 by the API on creation if not set.

		esp_lifetime?: int

		// Name of the project the VPN gateway is related to.

		project?: string

		// Public IP address of the gateway.
		// Required if I(state=present).

		gateway?: string

		// Name of the gateway.

		name: string

		// Domain the VPN customer gateway is related to.

		domain?: string

		// ESP policy in the format e.g. C(aes256-sha1;modp1536).
		// Required if I(state=present).

		esp_policy?: string

		// Lifetime in seconds of phase 1 VPN connection.
		// Defaulted to 86400 by the API on creation if not set.

		ike_lifetime?: int

		// IKE policy in the format e.g. C(aes256-sha1;modp1536).
		// Required if I(state=present).

		ike_policy?: string

		// Poll async jobs until job has finished.

		poll_async?: bool

		// List of guest CIDRs behind the gateway.
		// Required if I(state=present).

		cidrs?: [...]

		// Enable Dead Peer Detection.
		// Disabled per default by the API on creation if not set.

		dpd?: bool
	}
}

cs_iso :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_iso: {

		// Register the ISO having XS/VMware tools installed inorder to support dynamic scaling of VM cpu/memory. Only used if I(state) is present.

		is_dynamically_scalable?: bool

		// This flag is used for searching existing ISOs. If set to C(yes), it will only list ISO ready for deployment e.g. successfully downloaded and installed. Recommended to set it to C(no).

		is_ready?: bool

		// Name of the ISO.

		name: string

		// List of tags. Tags are a list of dictionaries having keys I(key) and I(value).
		// To delete all tags, set a empty list e.g. I(tags: []).

		tags?: [...]

		// Domain the ISO is related to.

		domain?: string

		// Register the ISO to be publicly available to all users. Only used if I(state) is present.

		is_public?: bool

		// Name of the filter used to search for the ISO.

		iso_filter?: string

		// URL where the ISO can be downloaded from. Required if I(state) is present.

		url?: string

		// Name of the zone you wish the ISO to be registered or deleted from.
		// If not specified, first zone found will be used.

		zone?: string

		// The MD5 checksum value of this ISO. If set, we search by checksum instead of name.

		checksum?: string

		// Register the ISO to be bootable. Only used if I(state) is present.

		bootable?: bool

		// Name of the OS that best represents the OS of this ISO. If the iso is bootable this parameter needs to be passed. Required if I(state) is present.

		os_type?: string

		// Account the ISO is related to.

		account?: string

		// Display text of the ISO.
		// If not specified, I(name) will be used.

		display_text?: string

		// Register the ISO to be featured. Only used if I(state) is present.

		is_featured?: bool

		// Poll async jobs until job has finished.

		poll_async?: bool

		// Name of the project the ISO to be registered in.

		project?: string

		// State of the ISO.

		state?: string

		// Whether the ISO should be synced or removed across zones.
		// Mutually exclusive with I(zone).

		cross_zones?: bool
	}
}

cs_loadbalancer_rule :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_loadbalancer_rule: {

		// Account the rule is related to.

		account?: string

		// State of the rule.

		state?: string

		// List of tags. Tags are a list of dictionaries having keys I(key) and I(value).
		// To delete all tags, set a empty list e.g. I(tags: []).

		tags?: [...]

		// Load balancer algorithm
		// Required when using I(state=present).

		algorithm?: string

		// The description of the load balancer rule.

		description?: string

		// The name of the load balancer rule.

		name: string

		// Whether the firewall rule for public port should be created, while creating the new rule.
		// Use M(cs_firewall) for managing firewall rules.

		open_firewall?: bool

		// Poll async jobs until job has finished.

		poll_async?: bool

		// The protocol to be used on the load balancer

		protocol?: string

		// CIDR (full notation) to be used for firewall rule if required.

		cidr?: string

		// Domain the rule is related to.

		domain?: string

		// Name of the network.

		network?: string

		// Name of the zone in which the rule should be created.
		// If not set, default zone is used.

		zone?: string

		// Public IP address from where the network traffic will be load balanced from.

		ip_address: string

		// The private port of the private ip address/virtual machine where the network traffic will be load balanced to.
		// Required when using I(state=present).
		// Can not be changed once the rule exists due API limitation.

		private_port?: int

		// Name of the project the load balancer IP address is related to.

		project?: string

		// The public port from where the network traffic will be load balanced from.
		// Required when using I(state=present).
		// Can not be changed once the rule exists due API limitation.

		public_port: int

		// Name of the VPC.

		vpc?: string
	}
}

cs_resourcelimit :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_resourcelimit: {

		// Account the resource is related to.

		account?: string

		// Domain the resource is related to.

		domain?: string

		// Maximum number of the resource.
		// Default is unlimited C(-1).

		limit?: int

		// Name of the project the resource is related to.

		project?: string

		// Type of the resource.

		resource_type: string
	}
}

cs_vmsnapshot :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_vmsnapshot: {

		// Unique Name of the snapshot. In CloudStack terms display name.

		name: string

		// Name of the project the VM is assigned to.

		project?: string

		// State of the snapshot.

		state?: string

		// List of tags. Tags are a list of dictionaries having keys I(key) and I(value).
		// To delete all tags, set a empty list e.g. I(tags: []).

		tags?: [...]

		// Name of the zone in which the VM is in. If not set, default zone is used.

		zone?: string

		// Description of the snapshot.

		description?: string

		// Domain the VM snapshot is related to.

		domain?: string

		// Snapshot memory if set to true.

		snapshot_memory?: bool

		// Name of the virtual machine.

		vm: string

		// Account the VM snapshot is related to.

		account?: string

		// Poll async jobs until job has finished.

		poll_async?: bool
	}
}

cs_zone :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_zone: {

		// DHCP provider for the Zone.

		dhcp_provider?: string

		// Guest CIDR address for the zone.

		guest_cidr_address?: string

		// Network domain for the zone.

		network_domain?: string

		// Whether the zone is security group enabled or not.

		securitygroups_enabled?: bool

		// uuid of the existing zone.

		id?: string

		// First DNS for the zone.
		// Required if I(state=present)

		dns1?: string

		// Second DNS for the zone.

		dns2?: string

		// Second DNS for IPv6 for the zone.

		dns2_ipv6?: string

		// First internal DNS for the zone.
		// If not set I(dns1) will be used on I(state=present).

		internal_dns1?: string

		// Name of the zone.

		name: string

		// Network type of the zone.

		network_type?: string

		// State of the zone.

		state?: string

		// First DNS for IPv6 for the zone.

		dns1_ipv6?: string

		// Domain the zone is related to.
		// Zone is a public zone if not set.

		domain?: string

		// Second internal DNS for the zone.

		internal_dns2?: string

		// Whether to enable local storage for the zone or not..

		local_storage_enabled?: bool
	}
}

cs_disk_offering :: {
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	name?:   string
	cs_disk_offering: {

		// Name of the disk offering.

		name: string

		// The storage tags for this disk offering.

		storage_tags?: [...]

		// Bytes write rate of the disk offering.

		bytes_write_rate?: int

		// Size of the disk offering in GB (1GB = 1,073,741,824 bytes).

		disk_size?: int

		// An optional field, whether to display the offering to the end user or not.

		display_offering?: bool

		// Display text of the disk offering.
		// If not set, C(name) will be used as C(display_text) while creating.

		display_text?: string

		// IO requests write rate of the disk offering.

		iops_write_rate?: int

		// Bytes read rate of the disk offering.

		bytes_read_rate?: int

		// Whether disk offering iops is custom or not.

		customized?: bool

		// Max. iops of the disk offering.

		iops_max?: int

		// Min. iops of the disk offering.

		iops_min?: int

		// Provisioning type used to create volumes.

		provisioning_type?: string

		// State of the disk offering.

		state?: string

		// Domain the disk offering is related to.
		// Public for all domains and subdomains if not set.

		domain?: string

		// Hypervisor snapshot reserve space as a percent of a volume.
		// Only for managed storage using Xen or VMware.

		hypervisor_snapshot_reserve?: int

		// IO requests read rate of the disk offering.

		iops_read_rate?: int

		// The storage type of the disk offering.

		storage_type?: string
	}
}
