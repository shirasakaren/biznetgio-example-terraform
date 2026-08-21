# English: This module bundles "one app" worth of infrastructure: a NEO
# Lite Pro VM plus an Object Storage bucket and credential for its data.
# It mirrors the module built step by step in the "Capstone" tutorial on
# the docs site - see
# https://biznetgio.creations.ren/tutorials/production-deployment
#
# Indonesia: Module ini bungkus infrastruktur buat "satu app": VM NEO
# Lite Pro plus bucket dan credential Object Storage buat data-nya.
# Bentuknya sama kayak module yang dibangun langkah demi langkah di
# tutorial "Capstone" di docs site - liat
# https://biznetgio.creations.ren/id/tutorials/production-deployment

# English: Child modules that use a non-default-namespace provider need
# their own required_providers block too, matching the root's source -
# otherwise Terraform assumes the wrong (hashicorp/*) namespace and
# fails with "missing required provider".
# Indonesia: Module anak yang pake provider di namespace non-default
# juga butuh required_providers block sendiri, sama sumbernya kayak
# root - kalau enggak, Terraform bakal nganggep namespace yang salah
# (hashicorp/*) dan gagal dengan error "missing required provider".
terraform {
  required_providers {
    biznetgio = {
      source = "registry.terraform.io/shirasakaren/biznetgio"
    }
  }
}

variable "name" {
  type        = string
  description = "Used as the VM name and as a prefix for the bucket/credential names. 6-16 chars for the VM name to be valid."
}

variable "storage_label" {
  type        = string
  description = "Separate from `name` on purpose - biznetgio_object_storage's label field has its own 6-16 char limit."
}

variable "vm_product_id" {
  type = number
}

variable "select_os" {
  type = string
}

variable "storage_product_id" {
  type = number
}

variable "cycle" {
  type    = string
  default = "m"
}

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

variable "storage_quota" {
  type    = number
  default = 10
}
