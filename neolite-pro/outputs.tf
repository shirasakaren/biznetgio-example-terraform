output "ip_available" {
  value = data.biznetgio_neolite_pro_ip_availability.check.available
}

output "vm_status" {
  value = biznetgio_neolite_pro_vm.main.status
}

output "vm_id" {
  value = biznetgio_neolite_pro_vm.main.id
}

output "keypair_private_key" {
  value     = biznetgio_neolite_pro_keypair.main.private_key
  sensitive = true
}

output "change_package_options_raw" {
  value     = data.biznetgio_neolite_pro_change_package_options.opts.raw
  sensitive = true
}

output "storage_upgrade_options_raw" {
  value     = data.biznetgio_neolite_pro_storage_upgrade_options.storage_opts.raw
  sensitive = true
}
