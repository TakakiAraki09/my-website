
module "infrastructure" {
  source = "./infrastructure"
}

# ネームサーバーを出力（レジストラで設定用）
output "name_servers" {
  value       = module.infrastructure.name_servers
  description = "Configure these at your domain registrar"
}
