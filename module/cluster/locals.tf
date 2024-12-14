
locals {
  execute_command_configuration = {
    logging = "OVERRIDE"
    log_configuration = {
      cloud_watch_log_group_name = try(aws_cloudwatch_log_group.log[0].name, null)
    }
  }

  default_capacity_providers = merge(
    { for k, v in var.fargate_capacity_providers : k => v if var.default_capacity_provider_use_fargate },
    { for k, v in var.autoscaling_capacity_providers : k => v if !var.default_capacity_provider_use_fargate }
  )

  task_exec_iam_role_name = try(coalesce(var.task_exec_iam_role_name, var.cluster_name), "")

  create_task_exec_iam_role = var.create && var.create_task_exec_iam_role
  create_task_exec_policy   = local.create_task_exec_iam_role && var.create_task_exec_policy

  tags = merge(var.tags, { "ManagedBy" = "Terraform" })
} 