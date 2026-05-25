variable "aws_region" {
  description = "Region used to deploy services in"
  type        = string
  default     = "us-east-1"

  validation {
    condition     = can(regex("^[a-z]{2}-[a-z]+-[0-9]$", var.aws_region))
    error_message = "AWS region must be in the format xx_xxxx_x (example: us-east-1)"
  }
}

variable "environment" {
  description = "App environment (Prod, Dev, Staging)"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment name must be dev, staging or prod"
  }
}