variable "project_name" {
  description = "Project name used for resource naming."
  type        = string
}

variable "environment" {
  description = "Environment name such as dev, stage, or prod."
  type        = string
}

variable "name" {
  description = "IAM role logical name."
  type        = string
}

variable "assume_role_policy_json" {
  description = "JSON policy document that defines who can assume this role."
  type        = string
}

variable "policy_json" {
  description = "Optional inline IAM policy JSON."
  type        = string
  default     = null
}

variable "managed_policy_arns" {
  description = "Optional list of managed policy ARNs to attach."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Additional tags to apply to the IAM role."
  type        = map(string)
  default     = {}
}
