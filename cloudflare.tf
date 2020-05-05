# Configure the Cloudflare provider
provider "cloudflare" {
  email   = var.email
  api_key = var.api_key
}
# Create a record
resource "cloudflare_record" "www" {
  zone_id = var.zone_id
  name    = var.name
  value   = aws_eip.nginx-eip.public_ip
  type    = "A"
  proxied = true
}
