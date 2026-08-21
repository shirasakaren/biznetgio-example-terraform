# ============================================================================
# English: NEO Lite walkthrough. Every resource and data source this
# service has, wired together in the order you'd actually use them: look
# up a product, pick an OS, make a keypair, create a VM, add a disk,
# snapshot it, then restore that snapshot into a second VM.
#
# Indonesia: Jalan-jalan NEO Lite. Semua resource dan data source yang
# service ini punya, disambung sesuai urutan yang beneran lu pake: cari
# product, pilih OS, bikin keypair, bikin VM, tambah disk, snapshot, terus
# restore snapshot itu ke VM kedua.
# ============================================================================

# --- Catalog lookups ---------------------------------------------------
# --- Lookup katalog ------------------------------------------------------

# English: Read every NEO Lite package Biznet GIO sells right now.
# Indonesia: Baca semua paket NEO Lite yang Biznet GIO jual sekarang.
data "biznetgio_neolite_products" "all" {}

locals {
  # English: Pick the first product for this example - good enough for a
  # demo. In a real project, filter by name/specs instead of trusting
  # whatever comes back first.
  # Indonesia: Pilih product pertama buat contoh ini - cukup buat demo. Di
  # project beneran, filter pake name/spec, jangan asal percaya yang
  # keluar duluan.
  neolite_product_id = data.biznetgio_neolite_products.all.products[0].product_id
}

# English: Available OS images for that product - `select_os` below comes
# from here.
# Indonesia: OS image yang tersedia buat product itu - `select_os` di
# bawah datengnya dari sini.
data "biznetgio_neolite_os_list" "ubuntu" {
  product_id = local.neolite_product_id
}

# English: Is a public IP even available for this product right now? Nice
# to check before you commit to an order.
# Indonesia: Public IP buat product ini masih available gak sekarang?
# Enak dicek dulu sebelum commit order.
data "biznetgio_neolite_ip_availability" "check" {
  product_id = local.neolite_product_id
}

# --- Keypair -------------------------------------------------------------

# English: SSH keypair, generated on the server. The private key is only
# ever returned once - right here, at create time. See the
# `keypair_private_key` output and save it somewhere safe immediately.
# Indonesia: Keypair SSH, digenerate di server. Private key-nya cuma
# dibalikin sekali - pas create ini. Liat output `keypair_private_key`
# dan simpen baik-baik langsung.
resource "biznetgio_neolite_keypair" "main" {
  name = "neolite-example-key"
}

# --- The VM itself ---------------------------------------------------
# --- VM-nya sendiri --------------------------------------------------

# English: The actual VM order. `pay_with_credit_card` defaults to false
# (see variables.tf) so this is a real order that stays unpaid in the
# portal while you're learning - flip it to true only when you mean it.
# Indonesia: Order VM-nya beneran. `pay_with_credit_card` default-nya
# false (liat variables.tf) jadi ini order beneran yang dibiarin belum
# dibayar di portal selagi lu belajar - ganti ke true cuma kalau emang
# serius.
resource "biznetgio_neolite_vm" "main" {
  ssh_and_console_user = var.ssh_and_console_user
  console_password     = var.console_password
  vm_name              = "neolite-example"
  product_id           = local.neolite_product_id
  select_os            = data.biznetgio_neolite_os_list.ubuntu.oss[0].name
  keypair_id           = biznetgio_neolite_keypair.main.keypair_id
  cycle                = "m"
  pay_with_credit_card = var.pay_with_credit_card

  # English: Every line below fires only when its value CHANGES, and each
  # one is destructive or costs money in its own way. Left commented out
  # on purpose so this example never surprises you on the first apply -
  # uncomment one at a time if you want to try it.
  # Indonesia: Tiap baris di bawah cuma jalan pas value-nya BERUBAH, dan
  # masing-masing destruktif atau bikin keluar duit dengan caranya
  # sendiri. Sengaja dikomen biar contoh ini gak ngejutin lu pas apply
  # pertama - uncomment satu-satu kalau mau nyoba.

  # power_state    = "stop"        # start/stop/suspend/resume/shutdown
  # rebuild_os     = "ubuntu-22"   # English: WIPES THE DISK, reinstalls. Indonesia: NGEHAPUS DISK, install ulang.
  # migrate_to_pro = "12345"       # English: one-way move to a NEO Lite Pro product id. Indonesia: pindah satu arah ke product id NEO Lite Pro.
  # disk_size      = 100           # English: grow-only, absolute GB target. Indonesia: cuma bisa naik, target GB absolut.
}

# --- Extra disk ------------------------------------------------------
# --- Disk tambahan ----------------------------------------------------

# English: An additional disk attached to the VM above. 60 GB minimum,
# grow-only from here on.
# Indonesia: Disk tambahan yang nempel ke VM di atas. Minimal 60 GB, dari
# sini cuma bisa naik.
resource "biznetgio_neolite_disk" "extra" {
  product_id           = 60
  cycle                = "m"
  neolite_account_id   = biznetgio_neolite_vm.main.id
  service_name         = "extra-disk"
  size                 = 60
  pay_with_credit_card = var.pay_with_credit_card
}

# --- Snapshot + restore ------------------------------------------------
# --- Snapshot + restore -------------------------------------------------

# English: A paid snapshot of the VM - think backup you restore from, not
# a free/instant local feature.
# Indonesia: Snapshot berbayar dari VM-nya - anggep kayak backup yang bisa
# lu restore, bukan fitur gratis/instan yang lokal.
resource "biznetgio_neolite_snapshot" "main" {
  neolite_account_id   = biznetgio_neolite_vm.main.id
  name                 = "example-snap"
  description          = "Snapshot taken by the biznetgio-example-terraform repo"
  cycle                = "m"
  pay_with_credit_card = var.pay_with_credit_card
}

# English: Restores the snapshot into a brand-new SECOND VM - a separate
# bill from the original. Deleting this resource only deletes the
# restored VM, never the snapshot it came from.
# Indonesia: Restore snapshot-nya jadi VM KEDUA yang baru - billing-nya
# beda dari VM aslinya. Delete resource ini cuma ngehapus VM hasil
# restore-nya, gak pernah ngehapus snapshot asalnya.
resource "biznetgio_neolite_vm_from_snapshot" "restored" {
  snapshot_id          = biznetgio_neolite_snapshot.main.id
  product_id           = local.neolite_product_id
  cycle                = "m"
  keypair_id           = biznetgio_neolite_keypair.main.keypair_id
  name                 = "example-restored"
  ssh_and_console_user = var.ssh_and_console_user
  console_password     = var.console_password
  pay_with_credit_card = var.pay_with_credit_card
}

# --- Informational-only lookups -----------------------------------------
# --- Lookup buat informasi doang -----------------------------------------

# English: These two return raw, unmodeled JSON straight from the
# upstream API - there's no fixed schema Terraform can type-check, so
# they come back as `raw` and are mostly useful for poking around from
# the CLI (see outputs.tf).
# Indonesia: Dua ini balikin JSON mentah yang gak dimodelin dari API
# upstream - gak ada schema pasti yang bisa dicek Terraform, jadi
# balikinnya sebagai `raw` dan paling kepake buat eksplorasi dari CLI
# (liat outputs.tf).
data "biznetgio_neolite_change_package_options" "opts" {
  account_id = biznetgio_neolite_vm.main.id
}

data "biznetgio_neolite_storage_upgrade_options" "storage_opts" {
  account_id = biznetgio_neolite_vm.main.id
}
