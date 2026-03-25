variable "project_name" {
  description = "Project name used in resource naming."
  type        = string
}

variable "environment" {
  description = "Environment name, for example dev or prod."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets."
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets."
  type        = list(string)
}

variable "availability_zones" {
  description = "Availability zones for subnets."
  type        = list(string)
}

variable "tags" {
  description = "Additional tags to apply to resources."
  type        = map(string)
  default     = {}
}
