
# dns登録
resource "google_dns_managed_zone" "arakey_dev" {
  name        = "arakey-dev"
  dns_name    = "arakey.dev."
  description = "My domain"
  project     = var.project
}

# ネームサーバーを出力（レジストラで設定用）
output "name_servers" {
  value       = google_dns_managed_zone.arakey_dev.name_servers
  description = "Configure these at your domain registrar"
}

# 静的IPアドレスを作成
resource "google_compute_global_address" "gateway_ip" {
  name    = "my-website-gateway-ip"
  project = var.project
}

# DNSレコードに設定
resource "google_dns_record_set" "www" {
  name         = "www.arakey.dev."
  type         = "A"
  ttl          = 300
  managed_zone = google_dns_managed_zone.arakey_dev.name
  project      = var.project
  rrdatas      = [google_compute_global_address.gateway_ip.address]
}

