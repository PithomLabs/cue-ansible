package ansible

module: composer: {
	module: "composer"
	author: [
		"Dimitrios Tydeas Mengidis (@dmtrs)",
		"René Moser (@resmo)",
	]
	short_description: "Dependency Manager for PHP"
	version_added:     "1.6"
	description: [
		"""
		Composer is a tool for dependency management in PHP. It allows you to declare the dependent libraries your project needs and it will install them in your project for you.

		""",
	]

	options: {
		command: {
			version_added: "1.8"
			description: ["Composer command like \"install\", \"update\" and so on."]
			default: "install"
		}
		arguments: {
			version_added: "2.0"
			description: ["Composer arguments like required package, version and so on."]
		}
		executable: {
			version_added: "2.4"
			description: ["Path to PHP Executable on the remote host, if PHP is not in PATH."]
			aliases: ["php_path"]
		}
		working_dir: {
			description: [
				"Directory of your project (see --working-dir). This is required when the command is not run globally.",
				"Will be ignored if C(global_command=true).",
			]
			aliases: ["working-dir"]
		}
		global_command: {
			version_added: "2.4"
			description: ["Runs the specified command globally."]
			type:    "bool"
			default: false
			aliases: ["global-command"]
		}
		prefer_source: {
			description: ["Forces installation from package sources when possible (see --prefer-source)."]
			default: false
			type:    "bool"
			aliases: ["prefer-source"]
		}
		prefer_dist: {
			description: ["Forces installation from package dist even for dev versions (see --prefer-dist)."]
			default: false
			type:    "bool"
			aliases: ["prefer-dist"]
		}
		no_dev: {
			description: ["Disables installation of require-dev packages (see --no-dev)."]
			default: true
			type:    "bool"
			aliases: ["no-dev"]
		}
		no_scripts: {
			description: ["Skips the execution of all scripts defined in composer.json (see --no-scripts)."]
			default: false
			type:    "bool"
			aliases: ["no-scripts"]
		}
		no_plugins: {
			description: ["Disables all plugins ( see --no-plugins )."]
			default: false
			type:    "bool"
			aliases: ["no-plugins"]
		}
		optimize_autoloader: {
			description: [
				"Optimize autoloader during autoloader dump (see --optimize-autoloader).",
				"Convert PSR-0/4 autoloading to classmap to get a faster autoloader.",
				"Recommended especially for production, but can take a bit of time to run.",
			]
			default: true
			type:    "bool"
			aliases: ["optimize-autoloader"]
		}
		classmap_authoritative: {
			version_added: "2.7"
			description: [
				"Autoload classes from classmap only.",
				"Implicitely enable optimize_autoloader.",
				"Recommended especially for production, but can take a bit of time to run.",
			]
			default: false
			type:    "bool"
			aliases: ["classmap-authoritative"]
		}
		apcu_autoloader: {
			version_added: "2.7"
			description: ["Uses APCu to cache found/not-found classes"]
			default: false
			type:    "bool"
			aliases: ["apcu-autoloader"]
		}
		ignore_platform_reqs: {
			version_added: "2.0"
			description: ["Ignore php, hhvm, lib-* and ext-* requirements and force the installation even if the local machine does not fulfill these."]
			default: false
			type:    "bool"
			aliases: ["ignore-platform-reqs"]
		}
	}
	requirements: [
		"php",
		"composer installed in bin path (recommended /usr/local/bin)",
	]
	notes: [
		"Default options that are always appended in each execution are --no-ansi, --no-interaction and --no-progress if available.",
		"We received reports about issues on macOS if composer was installed by Homebrew. Please use the official install method to avoid issues.",
	]
}
