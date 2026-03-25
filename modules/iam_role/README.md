# IAM Role Terraform Module

## Overview
This module creates a reusable AWS IAM role for application access.

It supports:
- IAM role creation
- assume role policy
- optional inline policy
- optional managed policy attachments
- tags
- reusable naming

## Why IAM roles are better than access keys
IAM roles are safer than long-lived access keys because they provide temporary credentials.
This reduces the risk of credential leakage and avoids hardcoding secrets in applications or infrastructure code.

## Why reusable IAM modules are important in enterprise environments
Reusable IAM modules help standardize security, naming, tagging, and policy attachment patterns.
They reduce duplication, improve maintainability, and make infrastructure easier to audit and scale across teams.

## How least privilege applies in production
Least privilege means giving applications only the permissions they need and nothing more.
In production, this reduces the blast radius of security incidents and helps meet compliance and security best practices.

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|----------|
| project_name | Project name | string | yes |
| environment | Environment name | string | yes |
| name | Role name | string | yes |
| assume_role_policy_json | Assume role policy JSON | string | yes |
| policy_json | Optional inline policy JSON | string | no |
| managed_policy_arns | Optional managed policy ARNs | list(string) | no |
| tags | Additional tags | map(string) | no |

## Outputs

| Name | Description |
|------|-------------|
| role_name | IAM role name |
| role_arn | IAM role ARN |
| role_id | IAM role ID |

## Example usage

```hcl
module "orders_app_role" {
  source = "./modules/iam_role"

  project_name            = "ecommerce"
  environment             = "prod"
  name                    = "orders-app-role"
  assume_role_policy_json = data.aws_iam_policy_document.ec2_assume_role.json

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  ]

  tags = {
    Team = "platform"
    App  = "orders"
  }
}
