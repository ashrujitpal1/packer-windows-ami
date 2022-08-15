resource "aws_autoscaling_group" "demo" {
    name = "cma-cgm-ecommerce"
    launch_template = aws_launch_template.demo.name
    vpc_zone_identifier = ["subnet-0820b2d09794f06a9", "subnet-04169f14f7ee86ab3"]

    target_group_arns = [aws_lb_target_group.asg.arn]
    health_check_type = "ELB"

    min_size = 1
    desired_capacity = 1
    max_size = 2

    tag {
      key = "demo"
      value = "webserver-with-asg-lb"
      propagate_at_launch = true
    }
}