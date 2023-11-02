# A. Manage AWS Services
Use the ``AWS provider`` to manage AWS services with Terraform. 
* Configure IAM policy documents, 
* Deploy serverless functions with Lambda, 
* Use application load balancers to schedule near-zero downtime releases, 
* Manage RDS and more.

### A.1 Create IAM policies
You must assign explicit permissions to IAM identities (users, groups, or roles) to enable their access AWS resources. The associated IAM policy determines the privileges available to an IAM identity. Policies are JSON documents that define explicit allow/deny privileges to specific resources or resource groups.

There are advantages to managing IAM policies in Terraform rather than manually in AWS. With Terraform, you can reuse your policy templates and ensure the principle of least privilege with resource interpolation.

In this tutorial, you will create an IAM user and an S3 bucket. Then, you will map permissions for that bucket with an IAM policy. Finally, you will attach that policy to the new user and learn how to iterate on more complex policies.Gitlens