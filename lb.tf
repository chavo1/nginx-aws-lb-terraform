resource "aws_eip" "nginx-eip" {
  vpc = true
  tags = {
    Name = "nginx-eip"
  }
}

resource "aws_lb" "nginx-lb" {
  name                       = "nginx-lb"
  internal                   = false
  load_balancer_type         = "network"
  enable_deletion_protection = false
  subnet_mapping {
    subnet_id     = aws_subnet.public.id
    allocation_id = aws_eip.nginx-eip.id
  }
  tags = {
    Environment = "nginx_lb"
  }
  depends_on = [aws_internet_gateway.internet_gw]
}

resource "aws_lb_target_group" "http" {
  name     = "tf-example-lb-http"
  port     = 80
  protocol = "TCP"
  vpc_id   = aws_vpc.nginx-vpc.id
  stickiness {
    enabled = false
    type    = "lb_cookie"
  }
}

resource "aws_lb_target_group_attachment" "http" {
  count            = var.server_count
  target_group_arn = aws_lb_target_group.http.arn
  target_id        = aws_instance.nginx[count.index].id
  port             = 80
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.nginx-lb.arn
  port              = "80"
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.http.arn
  }
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.nginx-lb.arn
  port              = "443"
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.https.arn
  }
}

resource "aws_lb_target_group_attachment" "https" {
  count            = var.server_count
  target_group_arn = aws_lb_target_group.https.arn
  target_id        = aws_instance.nginx[count.index].id
  port             = 443
}

resource "aws_lb_target_group" "https" {
  name     = "tf-example-lb-tg-https"
  port     = 443
  protocol = "TCP"
  vpc_id   = aws_vpc.nginx-vpc.id
  stickiness {
    enabled = false
    type    = "lb_cookie"
  }
}

resource "aws_lb_listener" "ssh" {
  load_balancer_arn = aws_lb.nginx-lb.arn
  port              = "22"
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ssh.arn
  }
}

resource "aws_lb_target_group_attachment" "ssh" {
  count            = var.server_count
  target_group_arn = aws_lb_target_group.ssh.arn
  target_id        = aws_instance.nginx[count.index].id
  port             = 22
}

resource "aws_lb_target_group" "ssh" {
  name     = "tf-example-lb-tg-ssh"
  port     = 22
  protocol = "TCP"
  vpc_id   = aws_vpc.nginx-vpc.id
  stickiness {
    enabled = false
    type    = "lb_cookie"
  }
}