# English: The username you'll actually SSH in with. Biznet GIO requires
# 6-32 chars, letters/numbers/dash/dot only.
# Indonesia: Username yang beneran lu pake buat SSH nanti. Biznet GIO minta
# 6-32 karakter, cuma huruf/angka/dash/titik.
variable "ssh_and_console_user" {
  type    = string
  default = "adminuser"
}

# English: Console/SSH password. No default on purpose - never hardcode a
# real password in a file that gets committed. Pass it via
# `TF_VAR_console_password` or a gitignored terraform.tfvars (see
# terraform.tfvars.example). Must be >= 8 chars with upper+lower+digit.
# Indonesia: Password console/SSH. Sengaja gak dikasih default - jangan
# pernah hardcode password beneran di file yang ke-commit. Kirim lewat
# `TF_VAR_console_password` atau terraform.tfvars yang di-gitignore (liat
# terraform.tfvars.example). Minimal 8 karakter, ada upper+lower+digit.
variable "console_password" {
  type      = string
  sensitive = true
}

# English: Keep this false while you're learning. `false` still creates the
# real resource, but leaves the invoice unpaid in the portal so nothing is
# actually charged until you pay it yourself. Flip to true only when you
# mean it. See https://biznetgio.creations.ren/guides/billing
# Indonesia: Biarin false selagi lu masih belajar. `false` masih bikin
# resource-nya beneran, tapi invoice-nya dibiarin belum dibayar di portal
# jadi belum ada yang kena charge sampe lu bayar sendiri. Ganti ke true
# cuma kalau lu emang serius. Liat https://biznetgio.creations.ren/id/guides/billing
variable "pay_with_credit_card" {
  type    = bool
  default = false
}
