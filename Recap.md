# AWS Provider
Use the **Amazon Web Services (AWS)** [provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) to **interact with the many resources supported by AWS**. You must configure the provider with the proper credentials before you can use it.

There are currently 1270 resources and 520 data sources available in the provider.

### Example Usage
Terraform 0.13 and later:

````sh
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}
````
### Authentication and Configuration
Configuration for the AWS Provider can be derived from several sources, which are applied in the following order:

1. Parameters in the provider configuration
2. Environment variables
3. Shared credentials files
4. Shared configuration files
5. Container credentials
6. Instance profile credentials and region

<!-- 
This order matches the precedence used by the [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html#cli-configure-quickstart-precedence) and the [AWS SDKs](https://aws.amazon.com/tools/).

The AWS Provider supports assuming an IAM role, either in the provider configuration block parameter ``assume_role`` or in a [named profile](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-role.html).

The AWS Provider supports assuming an IAM role using [web identity federation and OpenID Connect (OIDC)](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-role.html#cli-configure-role-oidc). This can be configured either using environment variables or in a named profile.

When using a named profile, the AWS Provider also supports [sourcing credentials from an external process](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-sourcing-external.html). 
-->

### Provider Configuration

> **Warning**:

>> **Hard-coded credentials** are not recommended in any Terraform configuration and risks secret leakage should this file ever be committed to a public version control system.

Credentials can be provided by adding an access_key, secret_key, and optionally token, to the aws provider block.

**Usage**:
````sh
provider "aws" {
  region     = "us-west-2"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}
````
### Environment Variables
Credentials can be provided by using the ``AWS_ACCESS_KEY_ID``, ``AWS_SECRET_ACCESS_KEY``, and optionally ``AWS_SESSION_TOKEN`` environment variables. The region can be set using the ``AWS_REGION`` or ``AWS_DEFAULT_REGION`` environment variables.

For example:
````sh
provider "aws" {}
% export AWS_ACCESS_KEY_ID="anaccesskey"
% export AWS_SECRET_ACCESS_KEY="asecretkey"
% export AWS_REGION="us-west-2"
% terraform plan
````

### Shared Configuration and Credentials Files
The AWS Provider can source credentials and other settings from the shared configuration and credentials files. By default, these files are located at:
* ``$HOME/.aws/config`` and ``$HOME/.aws/credentials`` on Linux and macOS, and
  
* ``"%USERPROFILE%\.aws\config"`` and ``"%USERPROFILE%\.aws\credentials``" on Windows.

If no named profile is specified, the default profile is used. Use the profile parameter or AWS_PROFILE environment variable to specify a named profile.

The locations of the shared configuration and credentials files can be configured using either the parameters shared_config_files and shared_credentials_files or the environment variables AWS_CONFIG_FILE and AWS_SHARED_CREDENTIALS_FILE.

**For example**:
````sh
provider "aws" {
  shared_config_files      = ["/Users/tf_user/.aws/conf"]
  shared_credentials_files = ["/Users/tf_user/.aws/creds"]
  profile                  = "customprofile"
}
````

### Container Credentials
If you're running Terraform on CodeBuild or ECS and have configured an [IAM Task Role](http://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-iam-roles.html), Terraform can use the container's Task Role. This support is based on the underlying ``AWS_CONTAINER_CREDENTIALS_RELATIVE_URI`` and ``AWS_CONTAINER_CREDENTIALS_FULL_URI`` environment variables being automatically set by those services or manually for advanced usage.

If you're running Terraform on EKS and have configured [IAM Roles for Service Accounts (IRSA)](https://docs.aws.amazon.com/eks/latest/userguide/iam-roles-for-service-accounts.html), Terraform can use the pod's role. This support is based on the underlying ``AWS_ROLE_ARN`` and ``AWS_WEB_IDENTITY_TOKEN_FILE`` environment variables being automatically set by Kubernetes or manually for advanced usage.

### AWS Configuration Reference
[AWS Configuration Reference](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#aws-configuration-reference)

[Assume Role Configuration Reference](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#assume-role-configuration-reference)

[Assume Role with Web Identity Configuration Reference](https://registry.terraform.io/providers/hashicorp/aws/latestdocs#assume-role-with-web-identity-configuration-reference)

[Argument Reference](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#argument-reference)