# English: One keypair, one VM, one storage subscription, one bucket,
# one credential - all four resources needed for "an app with a
# database-adjacent bucket" bundled into a single reusable shape.
# Indonesia: Satu keypair, satu VM, satu storage subscription, satu
# bucket, satu credential - empat resource yang dibutuhin buat "satu app
# dengan bucket yang setara database" dibungkus jadi satu bentuk yang
# bisa dipake ulang.

resource "biznetgio_neolite_pro_keypair" "this" {
  name = "${var.name}-key"
}

resource "biznetgio_neolite_pro_vm" "this" {
  vm_name              = var.name
  product_id           = var.vm_product_id
  select_os            = var.select_os
  keypair_id           = biznetgio_neolite_pro_keypair.this.keypair_id
  cycle                = var.cycle
  ssh_and_console_user = var.ssh_and_console_user
  console_password     = var.console_password
  pay_with_credit_card = var.pay_with_credit_card
}

resource "biznetgio_object_storage" "this" {
  product_id           = var.storage_product_id
  cycle                = var.cycle
  label                = var.storage_label
  quota                = var.storage_quota
  pay_with_credit_card = var.pay_with_credit_card
}

resource "biznetgio_object_storage_bucket" "this" {
  account_id = biznetgio_object_storage.this.id
  name       = "${var.name}-assets"
  acl        = "private"
}

resource "biznetgio_object_storage_credential" "this" {
  account_id = biznetgio_object_storage.this.id
}
