resource "aws_ecs_cluster" "mentee-app-backend" {
  name = "mentee-app-backend-${var.environment}"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = local.cluster-tags
}

locals {
  cluster-tags = { cluster = "mentee-app-backend-cluster" }
}
