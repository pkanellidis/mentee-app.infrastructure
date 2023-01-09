resource "aws_cloudwatch_log_group" "ecs-organizations" {
  name = "ecs-organizations-${var.environment}"

  retention_in_days = 3

  tags = local.log-tags
}

data "aws_iam_policy_document" "cloudwatch-logs-ecs-organizations-put-log-events" {
  statement {
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = ["${aws_cloudwatch_log_group.ecs-organizations.arn}:*"]
  }
}

locals {
  log-tags = { cluster = "mentee-app-backend-cluster-logs" }
}
