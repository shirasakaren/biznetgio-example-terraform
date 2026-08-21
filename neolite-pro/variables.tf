# English: See neolite/variables.tf for the full explanation of each of
# these - NEO Lite Pro uses the exact same three inputs.
# Indonesia: Liat neolite/variables.tf buat penjelasan lengkap tiap
# variable ini - NEO Lite Pro pake tiga input yang sama persis.

variable "ssh_and_console_user" {
  type    = string
  default = "admin"
}

variable "console_password" {
  type      = string
  sensitive = true
}

variable "pay_with_credit_card" {
  type    = bool
  default = false
}
