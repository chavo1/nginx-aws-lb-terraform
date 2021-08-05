output "nlb_dns" {
  description = "This is the DNS name of the NGINX environment"
  value       = aws_lb.nginx-lb.dns_name
}

output "hostname" {
  description = "This is the public domain nginx.chavo.eu of the NGINX environment"
  value       = cloudflare_record.www.hostname
}