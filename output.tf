output "all_alarm_arns" {
  description = "ARNs de todas las alarmas EC2 creadas"
  value = concat(
    [for a in aws_cloudwatch_metric_alarm.ec2_cpu_utilization_high : a.arn],
    [for a in aws_cloudwatch_metric_alarm.ec2_memory_utilization_high : a.arn],
    [for a in aws_cloudwatch_metric_alarm.ec2_disk_utilization_high : a.arn]
  )
}
