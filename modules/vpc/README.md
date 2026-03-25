# VPC Module

## What this module creates
This module creates:
- one VPC
- public subnets
- private subnets
- one internet gateway
- one public route table
- route table associations for public subnets

## Why this module is needed in ecommerce platform
This module provides a reusable network foundation for application environments.
Platform teams use modules like this to standardize infrastructure across dev and prod.

## Required variables
- project_name
- environment
- vpc_cidr
- public_subnet_cidrs
- private_subnet_cidrs
- availability_zones
- tags

## Outputs
- vpc_id
- public_subnet_ids
- private_subnet_ids
- internet_gateway_id

## Example usage
```hcl
module "prod_vpc" {
  source               = "./modules/vpc"
  project_name         = "ecommerce"
  environment          = "prod"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24"]
  availability_zones   = ["us-east-2a", "us-east-2b"]

  tags = {
    Team = "platform"
  }
}
