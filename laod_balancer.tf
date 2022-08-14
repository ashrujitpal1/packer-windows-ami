resource "aws_lb" "demo" {
    name = "demo-alb"
    load_balancer_type = "application"
    subnets = ["subnet-0820b2d09794f06a9", "subnet-04169f14f7ee86ab3"]
    security_groups = [aws_security_group.alb.id]

}


resource "aws_alb_listener" "http" {
    load_balancer_arn = aws_lb.demo.arn
    port = 80
    protocol = "HTTP"
    
    default_action {
      type = "fixed-response"

      fixed_response {
          content_type = "text/plain"
          message_body = "404: page not found"
          status_code = 404
      }
    }
}


resource "aws_lb_target_group" "asg" {
    name = "demo-tg"
    port = 8080
    protocol = "HTTP"
    vpc_id = "vpc-08cfb7245d8b33cfc"

    health_check {
      path = "/"
      protocol = "HTTP"
      matcher = "200"
      interval = "15"
      timeout = 3
      healthy_threshold = 2
      unhealthy_threshold = 2
    }
}

resource "aws_lb_listener_rule" "asg" {
    listener_arn = aws_alb_listener.http.arn
    priority = 100

    condition {
      path_pattern {
          values = ["*"]
      }
    }
    action {
      type = "forward"
      target_group_arn = aws_lb_target_group.asg.arn
    }
}