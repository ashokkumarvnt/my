resource "aws_security_group" "all" {
  name = "all"
  vpc_id = aws_vpc.muguntha.id

  dynamic "ingress" {
    for_each = var.sg_ports
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    
  }
  
}
  
