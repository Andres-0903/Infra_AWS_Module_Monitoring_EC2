output "ec2_metrics" {
  value = {
    for key in keys(var.ec2_instances) : key => {
      cpu_alarm_arn    = aws_cloudwatch_metric_alarm.ec2_cpu_utilization_high[key].arn
      memory_alarm_arn = aws_cloudwatch_metric_alarm.ec2_memory_utilization_high[key].arn
      disk_alarm_arn   = aws_cloudwatch_metric_alarm.ec2_disk_utilization_high[key].arn
    }
  }
  description = "ARNs of CloudWatch Alarms for EC2 instances"

}
