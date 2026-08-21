output "vm_status" {
  value = biznetgio_neolite_pro_vm.this.status
}

output "bucket_name" {
  value = biznetgio_object_storage_bucket.this.name
}

# English: Shown only once, at create time - the caller of this module
# is responsible for saving these somewhere safe.
# Indonesia: Cuma ditunjukin sekali, pas create - yang pake module ini
# tanggung jawab buat nyimpen ini di tempat aman.
output "access_key" {
  value     = biznetgio_object_storage_credential.this.access_key
  sensitive = true
}

output "secret_key" {
  value     = biznetgio_object_storage_credential.this.secret_key
  sensitive = true
}

output "keypair_private_key" {
  value     = biznetgio_neolite_pro_keypair.this.private_key
  sensitive = true
}
