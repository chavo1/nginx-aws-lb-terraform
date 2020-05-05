output "nlb_dns" {
  description = "This is the DNS name of the NGINX environment"
  value       = aws_lb.nginx-lb.dns_name
}

output "nlb_public_ip" {
  description = "This is the public ip of the NGINX environment"
  value       = aws_eip.nginx-eip.public_ip
}

output "hostname" {
  description = "This is the public domain nginx.chavo.eu of the NGINX environment"
  value       = cloudflare_record.www.hostname
}