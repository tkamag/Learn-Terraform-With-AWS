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

# What is Infrastructure as Code with Terraform?
Infrastructure as Code (IaC) tools allow you to manage infrastructure with configuration files rather than through a graphical user interface. IaC allows you to build, change, and manage your infrastructure in a safe, consistent, and repeatable way by defining resource configurations that you can version, reuse, and share.

[https://developer.hashicorp.com/terraform/tutorials/aws-get-started/infrastructure-as-code](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/infrastructure-as-code)

# Install terraform
[Install terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

# Build infrastructure
With Terraform installed, you are ready to create your first infrastructure.

In this tutorial, you will provision an EC2 instance on Amazon Web Services (AWS). EC2 instances are virtual machines running on AWS, and a common component of many infrastructure projects.

### Prerequisites
To follow this tutorial you will need:

* The [Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) (1.2.0+) installed.

* The [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) installed.
[AWS account](https://aws.amazon.com/free) and [associated credentials](https://aws.amazon.com/free) that allow you to create resources.

1. To use your IAM credentials to authenticate the Terraform AWS provider, set the ``AWS_ACCESS_KEY_ID`` environment variable.
````sh
export AWS_ACCESS_KEY_ID=
````
2. Now, set your secret key.
````sh
export AWS_SECRET_ACCESS_KEY=
````
### Write configuration
The set of files used to describe infrastructure in Terraform is known as a **Terraform configuration**. You will write your first configuration to define a single AWS EC2 instance.

> **Each Terraform configuration must be in its own working directory**. 
3. Create a directory for your configuration.
````sh
mkdir learn-terraform-aws-instance
````
4. Change into the directory.
````sh
 cd learn-terraform-aws-instance
 ````

5. Create a file to define your infrastructure.
````sh
 touch main.tf
````
Open ``main.tf`` in your text editor, paste in the configuration below, and save the file.

````sh
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}

````

### Terraform Block
The ``terraform {}`` block **contains Terraform settings, including the required providers Terraform will use to provision your infrastructure**. For each provider: 
* The ``source`` attribute defines an optional hostname, a namespace, and the provider type. 
> Terraform installs providers from the Terraform Registry by default. 

In this example configuration, the aws provider's source is defined as ``hashicorp/aws``, which is **shorthand** for ``registry.terraform.io/hashicorp/aws``.

* You can also set a ``version`` constraint for each provider defined in the ``required_providers`` block. 
> The version attribute is **optional**, but we recommend using it to constrain the provider version so that Terraform does not install a version of the provider that does not work with your configuration. 

> If you do not specify a provider version, Terraform will automatically download the most recent version during initialization.

To learn more, reference the [provider source documentation](https://developer.hashicorp.com/terraform/language/providers/requirements).