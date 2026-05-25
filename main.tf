# data sources
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

# random sufffix for resource names
resource "random_id" "suffix" {
    byte_length = 4
}

locals {
    # naming convention
    name_prefix = "${var.project_name}-${var.environment}"
    random_suffix = random_id.suffix.hex

    # S3 bucket names
    content_bucket_name = "${local.name_prefix}-content-${local.random_suffix}"
    approved_bucket_name = "${local.name_prefix}-approved-${local.random_suffix}"
    rejected_bucket_name = "${local.name_prefix}-rejected-${local.random_suffix}"

    # event bridge bus name
    ecustom_bus_name = "${local.name_prefix}-moderation-bus"

    # SNS topic name
    sns_topic_name = "${local.name_prefix}-notifications"
}