# English: Whether a public IP is available for the chosen product.
# Indonesia: Apakah public IP available buat product yang dipilih.
output "ip_available" {
  value = data.biznetgio_neolite_ip_availability.check.available
}

# English: Current status of the main VM (Active / Pending / Suspended /
# Terminated).
# Indonesia: Status VM utama sekarang (Active / Pending / Suspended /
# Terminated).
output "vm_status" {
  value = biznetgio_neolite_vm.main.status
}

# English: The VM's account id - useful if you ever need
# `terraform import biznetgio_neolite_vm.main <id>` on a fresh checkout.
# Indonesia: Account id VM-nya - kepake kalau suatu saat lu butuh
# `terraform import biznetgio_neolite_vm.main <id>` di checkout yang baru.
output "vm_id" {
  value = biznetgio_neolite_vm.main.id
}

# English: SSH private key. Only ever shown once, right here - copy it
# out and save it now.
# Indonesia: Private key SSH. Cuma ditunjukin sekali, ya di sini - copy
# dan simpen sekarang.
output "keypair_private_key" {
  value     = biznetgio_neolite_keypair.main.private_key
  sensitive = true
}

# English: Status of the restored (second) VM.
# Indonesia: Status VM hasil restore (yang kedua).
output "restored_vm_status" {
  value = biznetgio_neolite_vm_from_snapshot.restored.status
}

# English: Raw change-package pricing options for the main VM - run
# `terraform output -json change_package_options_raw` to actually read it.
# Indonesia: Raw pricing options buat change-package VM utama - jalanin
# `terraform output -json change_package_options_raw` buat beneran
# baca isinya.
output "change_package_options_raw" {
  value     = data.biznetgio_neolite_change_package_options.opts.raw
  sensitive = true
}

# English: Raw storage-upgrade pricing options for the main VM.
# Indonesia: Raw pricing options buat upgrade storage VM utama.
output "storage_upgrade_options_raw" {
  value     = data.biznetgio_neolite_storage_upgrade_options.storage_opts.raw
  sensitive = true
}
