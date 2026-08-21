variable "ssh_and_console_user" {
  type    = string
  default = "root"
}

variable "console_password" {
  type      = string
  sensitive = true
}

variable "pay_with_credit_card" {
  type    = bool
  default = false
}
