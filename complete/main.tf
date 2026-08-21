# ============================================================================
# English: The "complete" example - a small but real production shape:
# an app tier (NEO Lite Pro VM) plus its data bucket (Object Storage),
# wrapped in the reusable `app-stack` module under modules/. This is the
# same shape the docs site's "Capstone" tutorial builds step by step -
# read that tutorial for the reasoning behind every choice here:
# https://biznetgio.creations.ren/tutorials/production-deployment
#
# If you followed the tutorial track and want the multi-environment
# (staging/production) version with CI/CD, that tutorial's code is a
# direct extension of this file - swap `var.pay_with_credit_card` for
# `terraform.workspace == "production"` and you're most of the way there.
#
# Indonesia: Contoh "complete" - bentuk production kecil tapi beneran:
# app tier (VM NEO Lite Pro) plus bucket data-nya (Object Storage),
# dibungkus di module `app-stack` yang reusable di bawah modules/.
# Bentuknya sama kayak yang dibangun langkah demi langkah di tutorial
# "Capstone" di docs site - baca tutorial itu buat alasan di balik tiap
# pilihan di sini:
# https://biznetgio.creations.ren/id/tutorials/production-deployment
#
# Kalau lu ngikutin tutorial track-nya dan mau versi multi-environment
# (staging/production) dengan CI/CD, kode di tutorial itu perpanjangan
# langsung dari file ini - ganti `var.pay_with_credit_card` jadi
# `terraform.workspace == "production"` dan lu udah sampe di sana.
# ============================================================================

data "biznetgio_neolite_pro_products" "all" {}

data "biznetgio_neolite_pro_os_list" "ubuntu" {
  product_id = data.biznetgio_neolite_pro_products.all.products[0].product_id
}

module "app" {
  source               = "./modules/app-stack"
  name                 = "example-app"
  storage_label        = "example-app"
  vm_product_id        = data.biznetgio_neolite_pro_products.all.products[0].product_id
  select_os            = data.biznetgio_neolite_pro_os_list.ubuntu.oss[0].name
  storage_product_id   = 8
  cycle                = "m"
  ssh_and_console_user = "adminuser"
  console_password     = var.console_password
  pay_with_credit_card = var.pay_with_credit_card
}
