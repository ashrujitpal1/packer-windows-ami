output "load-balancer-dns-name" {
    value = aws_lb.demo.dns_name
    description = "FQDN for alb"
  
}