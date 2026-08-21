output "storage_status" {
  value = biznetgio_object_storage.main.status
}

output "bucket_name" {
  value = biznetgio_object_storage_bucket.assets.name
}

output "access_key" {
  value     = biznetgio_object_storage_credential.main.access_key
  sensitive = true
}

# English: Shown only once, right here, at create time - copy it out and
# store it somewhere safe immediately.
# Indonesia: Cuma ditunjukin sekali, ya di sini, pas create - copy dan
# simpen di tempat aman langsung.
output "secret_key" {
  value     = biznetgio_object_storage_credential.main.secret_key
  sensitive = true
}

output "active_instances" {
  # English: Marked sensitive because each item carries a redacted `raw`
  # JSON field - Terraform treats anything containing a sensitive value
  # as sensitive as a whole.
  # Indonesia: Ditandain sensitive soalnya tiap item bawa field `raw`
  # JSON yang di-redact - Terraform nganggep apapun yang ngandung value
  # sensitive jadi sensitive semuanya.
  value     = data.biznetgio_object_storage_instances.active.instances
  sensitive = true
}
