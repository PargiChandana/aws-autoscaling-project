# CloudWatch Scale Out Policy
resource "aws_autoscaling_policy" "scale_out" {
  name                   = "scale-out"
  adjustment_type         = "ChangeInCapacity"
  autoscaling_group_name  = aws_autoscaling_group.web_asg.name
  scaling_adjustment      = 1
}
resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "High CPU"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 65
  alarm_actions       = [aws_autoscaling_policy.scale_out.arn]
}

# CloudWatch Scale In
resource "aws_autoscaling_policy" "scale_in" {
  name                   = "scale-in"
  adjustment_type         = "ChangeInCapacity"
  autoscaling_group_name  = aws_autoscaling_group.web_asg.name
  scaling_adjustment      = -1
}
resource "aws_cloudwatch_metric_alarm" "low_cpu" {
  alarm_name          = "Low CPU"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 20
  alarm_actions       = [aws_autoscaling_policy.scale_in.arn]
}