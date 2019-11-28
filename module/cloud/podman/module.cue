package podman

podman_image :: {
	name?:     string
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	podman_image: {

		// Arguments that control image build.

		build?: string

		// Whether or not to force push or pull an image. When building, force the build even if the image already exists.

		force?: string

		// Whether an image should be present, absent, or built.

		state?: string

		// Path to file containing authorization credentials to the remote registry

		auth_file?: string

		// Path to directory containing TLS certificates and keys to use

		ca_cert_dir?: string

		// Whether or not to push an image.

		push?: string

		// Whether or not to pull the image.

		pull?: string

		// Name of the image to pull, push, or delete. It may contain a tag using the format C(image:tag).

		name: string

		// Password to use when authenticating to remote registries.

		password?: string

		// Path to directory containing the build file.

		path?: string

		// username to use when authenticating to remote registries.

		username?: string

		// Require HTTPS and validate certificates when pulling or pushing. Also used during build if a pull or push is necessary.

		validate_certs?: string

		// Path to C(podman) executable if it is not in the C($PATH) on the machine running C(podman)

		executable?: string

		// Arguments that control pushing images.

		push_args?: string

		// Tag of the image to pull, push, or delete.

		tag?: string
	}
}

podman_image_info :: {
	name?:     string
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	podman_image_info: {

		// Path to C(podman) executable if it is not in the C($PATH) on the machine running C(podman)

		executable?: string

		// List of tags or UID to gather info about. If no name is given return info about all images.

		name?: string
	}
}

podman_volume_info :: {
	name?:     string
	register?: string
	vars?: {...}
	when?: string
	tags?: [...string]
	notify?: string | [...string]
	podman_volume_info: {

		// Name of the volume

		name?: string

		// Path to C(podman) executable if it is not in the C($PATH) on the machine running C(podman)

		executable?: string
	}
}
