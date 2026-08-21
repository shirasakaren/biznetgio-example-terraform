output "vm_status" {
  value = module.app.vm_status
}

output "bucket_name" {
  value = module.app.bucket_name
}

output "access_key" {
  value     = module.app.access_key
  sensitive = true
}

output "secret_key" {
  value     = module.app.secret_key
  sensitive = true
}

output "keypair_private_key" {
  value     = module.app.keypair_private_key
  sensitive = true
}
