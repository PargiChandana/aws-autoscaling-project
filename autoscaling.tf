# Autoscaling Group
resource "aws_autoscaling_group" "web_asg" {
  name                      = "web-asg"
  max_size                  = 2
  min_size                  = 1
  desired_capacity          = 1
  health_check_type         = "ELB"
  health_check_grace_period = 300
  vpc_zone_identifier       = [aws_subnet.public_subnet1.id, aws_subnet.public_subnet2.id]

  launch_template {
    id      = aws_launch_template.web_template.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.web_tg.arn]

  tag {
    key                 = "Name"
    value               = "nginx-web"
    propagate_at_launch = true
  }
}


