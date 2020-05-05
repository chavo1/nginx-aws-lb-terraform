resource "aws_instance" "nginx" {
  ami                         = var.nginx_ami
  instance_type               = "t2.micro"
  count                       = var.server_count
  private_ip                  = "172.31.16.${count.index + 11}"
  subnet_id                   = aws_subnet.private.id
  associate_public_ip_address = false
  vpc_security_group_ids      = [aws_security_group.private.id]
  key_name                    = "chavo"

  tags = {
    Name = "nginx-server0${count.index + 1}"

  }

}
