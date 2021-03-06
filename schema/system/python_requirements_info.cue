package ansible

module: python_requirements_info: {
	module:            "python_requirements_info"
	short_description: "Show python path and assert dependency versions"
	description: [
		"Get info about available Python requirements on the target host, including listing required libraries and gathering versions.",
		"This module was called C(python_requirements_facts) before Ansible 2.9. The usage did not change.",
	]
	version_added: "2.7"
	options: dependencies: description: """
		A list of version-likes or module names to check for installation. Supported operators: <, >, <=, >=, or ==. The bare module name like I(ansible), the module with a specific version like I(boto3==1.6.1), or a partial version like I(requests>2) are all valid specifications.

		"""

	author: [
		"Will Thames (@willthames)",
		"Ryan Scott Brown (@ryansb)",
	]
}
