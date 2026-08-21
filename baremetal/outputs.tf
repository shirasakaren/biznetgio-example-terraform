output "server_status" {
  value = biznetgio_baremetal.main.status
}

output "server_ip_address" {
  value = biznetgio_baremetal.main.ip_address
}

output "keypair_private_key" {
  value     = biznetgio_baremetal_keypair.main.private_key
  sensitive = true
}

output "valid_rebuild_os_images" {
  description = "OS names you can pass to rebuild_os on this server / Nama OS yang bisa dipake buat rebuild_os di server ini"
  value       = data.biznetgio_baremetal_rebuild_os_list.ubuntu.oss
}

output "additional_ip_address" {
  value = biznetgio_baremetal_additional_ip.extra.ip_address
}

output "elastic_storage_status" {
  value = biznetgio_baremetal_elastic_storage.main.status
}

output "openvpn_config" {
  value     = data.biznetgio_baremetal_openvpn.vpn.config
  sensitive = true
}
