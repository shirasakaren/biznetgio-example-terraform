# ============================================================================
# English: NEO Lite Pro walkthrough. Same idea as the plain NEO Lite
# example, dedicated-resource tier instead of entry-level. Notably no
# `vm_from_snapshot` here - Pro has no such resource; a snapshot restores
# only into a fresh NEO Lite Pro VM through the portal today, not through
# this provider. (Migrating a NEO Lite VM UP into Pro is `migrate_to_pro`
# on the NEO Lite side - see the neolite/ example.)
#
# Indonesia: Jalan-jalan NEO Lite Pro. Konsepnya sama kayak contoh NEO
# Lite biasa, cuma tier-nya dedicated-resource, bukan entry-level. Yang
# beda, di sini gak ada `vm_from_snapshot` - Pro emang gak punya resource
# itu; restore snapshot ke VM Pro baru masih lewat portal, belum lewat
# provider ini. (Migrasi VM NEO Lite ke Pro itu `migrate_to_pro` di sisi
# NEO Lite - liat contoh neolite/.)
# ============================================================================

data "biznetgio_neolite_pro_products" "all" {}

locals {
  neolite_pro_product_id = data.biznetgio_neolite_pro_products.all.products[0].product_id
}

data "biznetgio_neolite_pro_os_list" "ubuntu" {
  product_id = local.neolite_pro_product_id
}

data "biznetgio_neolite_pro_ip_availability" "check" {
  product_id = local.neolite_pro_product_id
}

# English: Keypair, generated on the server - private key comes back only
# once, at create time.
# Indonesia: Keypair, digenerate di server - private key-nya cuma
# dibalikin sekali, pas create.
resource "biznetgio_neolite_pro_keypair" "main" {
  name = "neolite-pro-example-key"
}

# English: The Pro VM order. Real order, unpaid by default (see
# variables.tf) until you flip pay_with_credit_card to true.
# Indonesia: Order VM Pro-nya. Order beneran, belum dibayar secara
# default (liat variables.tf) sampe lu ganti pay_with_credit_card ke
# true.
resource "biznetgio_neolite_pro_vm" "main" {
  ssh_and_console_user = var.ssh_and_console_user
  console_password     = var.console_password
  vm_name              = "pro-example"
  product_id           = local.neolite_pro_product_id
  select_os            = data.biznetgio_neolite_pro_os_list.ubuntu.oss[0].name
  keypair_id           = biznetgio_neolite_pro_keypair.main.keypair_id
  cycle                = "m"
  pay_with_credit_card = var.pay_with_credit_card

  # English: Same trigger pattern as NEO Lite - fires only when the value
  # changes, commented out on purpose.
  # Indonesia: Pattern trigger yang sama kayak NEO Lite - jalan cuma pas
  # value-nya berubah, sengaja dikomen.

  # power_state = "stop"
  # rebuild_os  = "ubuntu-22"   # English: WIPES THE DISK. Indonesia: NGEHAPUS DISK.
  # disk_size   = 100            # English: grow-only. Indonesia: cuma bisa naik.
}

# English: Extra disk for the Pro VM - 30 GB minimum here, vs 60 GB for
# plain NEO Lite.
# Indonesia: Disk tambahan buat VM Pro - minimal 30 GB di sini, beda dari
# NEO Lite biasa yang 60 GB.
resource "biznetgio_neolite_pro_disk" "extra" {
  product_id           = 60
  cycle                = "m"
  neolite_account_id   = biznetgio_neolite_pro_vm.main.id
  service_name         = "pro-extra-disk"
  size                 = 30
  pay_with_credit_card = var.pay_with_credit_card
}

# English: A paid snapshot of the Pro VM.
# Indonesia: Snapshot berbayar dari VM Pro-nya.
resource "biznetgio_neolite_pro_snapshot" "main" {
  neolite_account_id   = biznetgio_neolite_pro_vm.main.id
  name                 = "example-snap"
  cycle                = "m"
  pay_with_credit_card = var.pay_with_credit_card
}

# English: Informational-only raw JSON lookups, same shape as NEO Lite.
# Indonesia: Lookup JSON mentah buat informasi doang, bentuknya sama
# kayak NEO Lite.
data "biznetgio_neolite_pro_change_package_options" "opts" {
  account_id = biznetgio_neolite_pro_vm.main.id
}

data "biznetgio_neolite_pro_storage_upgrade_options" "storage_opts" {
  account_id = biznetgio_neolite_pro_vm.main.id
}
