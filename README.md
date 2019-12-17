# terraform-aws-deploy-user
Create users for AWS with minimal permissions

I often find that I'm creating AWS IAM users for CircleCI deployments.

This module simplifies that process by creating an IAM user with the minimal required permissions to deploy to S3 or Lambda.

## Example usage

```
module circle {
  source       = "github.com/robbytaylor/terraform-aws-deploy-user?ref=v0.1.0"
  username     = "CircleCI"
  s3bucket_arn = module.website.bucket_arn
}

```