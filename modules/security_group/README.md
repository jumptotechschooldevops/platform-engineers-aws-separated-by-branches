# Security Group Module

This module creates a reusable AWS Security Group.

## Features

•⁠  ⁠Creates security group
•⁠  ⁠Supports ingress and egress rules
•⁠  ⁠Uses variables (no hardcoded values)
•⁠  ⁠Supports tags
•⁠  ⁠Reusable naming convention

## Usage

```hcl
module "web_sg" {
  source = "./modules/security_group"

  project_name = "myapp"
  environment  = "dev"
  name         = "web"
  vpc_id       = "vpc-123"

  ingress_rules = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "HTTP"
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      description = "All traffic"
    }
  ]

  tags = {
    Project = "myapp"
  }
}
