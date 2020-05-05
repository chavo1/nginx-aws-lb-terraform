domain       = "chavo.eu"
api_key      = "< CloudFlare API Key >"
email        = "< You email >"
name         = "nginx"
zone_id      = "< CloudFlare Zone ID >"
vpc_net      = "172.31.0.0/18"  # VPC cidr block
private_cidr = "172.31.32.0/22" # private subnet
public_cidr  = "172.31.16.0/22" # public subnet
nginx_ami    = "<Your preinstalled Nginx Ami>"
aws_region   = "us-east-1"
server_count = 1



