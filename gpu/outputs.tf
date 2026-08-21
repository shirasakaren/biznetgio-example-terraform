output "gpu_status" {
  value = biznetgio_gpu_instance.main.status
}

output "keypair_private_key" {
  value     = biznetgio_gpu_keypair.main.private_key
  sensitive = true
}

# English: A fresh one-time console URL, minted the moment this was last
# applied/refreshed.
# Indonesia: URL console one-time yang baru, dibuat pas terakhir kali ini
# di-apply/refresh.
output "console_url" {
  value     = data.biznetgio_gpu_console.console.url
  sensitive = true
}

output "monitoring_graph" {
  value = data.biznetgio_gpu_graph.graph.graph
}
