package ansible

module: docker_compose: {
	module: "docker_compose"

	short_description: "Manage multi-container Docker applications with Docker Compose."

	version_added: "2.1"

	author: "Chris Houseknecht (@chouseknecht)"

	description: [
		"Uses Docker Compose to start, shutdown and scale services.",
		"Works with compose versions 1 and 2.",
		"Configuration can be read from a C(docker-compose.yml) or C(docker-compose.yaml) file or inline using the I(definition) option.",
		"See the examples for more details.",
		"Supports check mode.",
		"This module was called C(docker_service) before Ansible 2.8. The usage did not change.",
	]

	options: {
		project_src: {
			description: [
				"Path to a directory containing a C(docker-compose.yml) or C(docker-compose.yaml) file.",
				"Mutually exclusive with I(definition).",
				"Required when no I(definition) is provided.",
			]
			type: "path"
		}
		project_name: {
			description: [
				"Provide a project name. If not provided, the project name is taken from the basename of I(project_src).",
				"Required when I(definition) is provided.",
			]
			type: "str"
		}
		files: {
			description: [
				"List of Compose file names relative to I(project_src). Overrides C(docker-compose.yml) or C(docker-compose.yaml).",
				"Files are loaded and merged in the order given.",
			]
			type:     "list"
			elements: "path"
		}
		state: {
			description: [
				"Desired state of the project.",
				"Specifying C(present) is the same as running C(docker-compose up) resp. C(docker-compose stop) (with I(stopped)) resp. C(docker-compose restart) (with I(restarted)).",
				"Specifying C(absent) is the same as running C(docker-compose down).",
			]
			type:    "str"
			default: "present"
			choices: [
				"absent",
				"present",
			]
		}
		services: {
			description: [
				"When I(state) is C(present) run C(docker-compose up) resp. C(docker-compose stop) (with I(stopped)) resp. C(docker-compose restart) (with I(restarted)) on a subset of services.",
				"If empty, which is the default, the operation will be performed on all services defined in the Compose file (or inline I(definition)).",
			]
			type:     "list"
			elements: "str"
		}
		scale: {
			description: [
				"When I(state) is C(present) scale services. Provide a dictionary of key/value pairs where the key is the name of the service and the value is an integer count for the number of containers.",
			]

			type: "dict"
		}
		dependencies: {
			description: [
				"When I(state) is C(present) specify whether or not to include linked services.",
			]
			type:    "bool"
			default: true
		}
		definition: {
			description: [
				"Compose file describing one or more services, networks and volumes.",
				"Mutually exclusive with I(project_src) and I(files).",
			]
			type: "dict"
		}
		hostname_check: {
			description: [
				"Whether or not to check the Docker daemon's hostname against the name provided in the client certificate.",
			]
			type:    "bool"
			default: false
		}
		recreate: {
			description: [
				"By default containers will be recreated when their configuration differs from the service definition.",
				"Setting to C(never) ignores configuration differences and leaves existing containers unchanged.",
				"Setting to C(always) forces recreation of all existing containers.",
			]
			type:    "str"
			default: "smart"
			choices: [
				"always",
				"never",
				"smart",
			]
		}
		build: {
			description: [
				"Use with I(state) C(present) to always build images prior to starting the application.",
				"Same as running C(docker-compose build) with the pull option.",
				"Images will only be rebuilt if Docker detects a change in the Dockerfile or build directory contents.",
				"Use the I(nocache) option to ignore the image cache when performing the build.",
				"If an existing image is replaced, services using the image will be recreated unless I(recreate) is C(never).",
			]
			type:    "bool"
			default: false
		}
		pull: {
			description: [
				"Use with I(state) C(present) to always pull images prior to starting the application.",
				"Same as running C(docker-compose pull).",
				"When a new image is pulled, services using the image will be recreated unless I(recreate) is C(never).",
			]
			type:          "bool"
			default:       false
			version_added: "2.2"
		}
		nocache: {
			description: [
				"Use with the I(build) option to ignore the cache during the image build process.",
			]
			type:          "bool"
			default:       false
			version_added: "2.2"
		}
		remove_images: {
			description: [
				"Use with I(state) C(absent) to remove all images or only local images.",
			]
			type: "str"
			choices: [
				"all",
				"local",
			]
		}
		remove_volumes: {
			description: [
				"Use with I(state) C(absent) to remove data volumes.",
			]
			type:    "bool"
			default: false
		}
		stopped: {
			description: [
				"Use with I(state) C(present) to stop all containers defined in the Compose file.",
				"If I(services) is defined, only the containers listed there will be stopped.",
			]
			type:    "bool"
			default: false
		}
		restarted: {
			description: [
				"Use with I(state) C(present) to restart all containers defined in the Compose file.",
				"If I(services) is defined, only the containers listed there will be restarted.",
			]
			type:    "bool"
			default: false
		}
		remove_orphans: {
			description: [
				"Remove containers for services not defined in the Compose file.",
			]
			type:    "bool"
			default: false
		}
		timeout: {
			description: [
				"timeout in seconds for container shutdown when attached or when containers are already running.",
			]
			type:    "int"
			default: 10
		}
	}

	extends_documentation_fragment: [
		"docker",
		"docker.docker_py_1_documentation",
	]

	requirements: [
		"L(Docker SDK for Python,https://docker-py.readthedocs.io/en/stable/) >= 1.8.0 (use L(docker-py,https://pypi.org/project/docker-py/) for Python 2.6)",
		"docker-compose >= 1.7.0",
		"Docker API >= 1.20",
		"PyYAML >= 3.11",
	]
}
