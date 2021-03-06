package ansible

module: sts_session_token: {
	module:            "sts_session_token"
	short_description: "Obtain a session token from the AWS Security Token Service"
	description: [
		"Obtain a session token from the AWS Security Token Service.",
	]
	version_added: "2.2"
	author:        "Victor Costan (@pwnall)"
	options: {
		duration_seconds: {
			description: [
				"The duration, in seconds, of the session token. See U(https://docs.aws.amazon.com/STS/latest/APIReference/API_GetSessionToken.html#API_GetSessionToken_RequestParameters) for acceptable and default values.",
			]

			type: "int"
		}
		mfa_serial_number: {
			description: [
				"The identification number of the MFA device that is associated with the user who is making the GetSessionToken call.",
			]
			type: "str"
		}
		mfa_token: {
			description: [
				"The value provided by the MFA device, if the trust policy of the user requires MFA.",
			]
			type: "str"
		}
	}
	notes: [
		"In order to use the session token in a following playbook task you must pass the I(access_key), I(access_secret) and I(access_token).",
	]
	extends_documentation_fragment: [
		"aws",
		"ec2",
	]
	requirements: [
		"boto3",
		"botocore",
		"python >= 2.6",
	]
}
