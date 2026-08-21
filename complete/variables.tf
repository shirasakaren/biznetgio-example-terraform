variable "console_password" {
  type      = string
  sensitive = true
}

variable "pay_with_credit_card" {
  type    = bool
  default = false
}
