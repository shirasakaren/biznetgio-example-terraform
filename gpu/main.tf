# ============================================================================
# English: NEO GPU walkthrough. NVIDIA H200 instances, billed either as a
# subscription (monthly/annual, like the VPS products) or on-demand
# (hourly, accrues charges automatically until you delete it). This
# example uses subscription mode - see the commented-out block near the
# bottom for how on-demand looks instead, and read the cost warning in
# README.md before ever using on-demand for real.
#
# Indonesia: Jalan-jalan NEO GPU. Instance NVIDIA H200, ditagih pake
# subscription (bulanan/tahunan, kayak produk VPS) atau on-demand
# (per jam, nagih otomatis sampe lu delete). Contoh ini pake mode
# subscription - liat block yang dikomen di bawah buat liat gimana
# on-demand, dan baca warning biaya di README.md dulu sebelum beneran
# pake on-demand.
# ============================================================================

data "biznetgio_gpu_products" "all" {}

locals {
  gpu_product_id = data.biznetgio_gpu_products.all.products[0].product_id
}

resource "biznetgio_gpu_keypair" "main" {
  name = "gpu-example-key"
}

# English: Unlike the other keypair resources in this repo,
# biznetgio_gpu_keypair does not export a separate `keypair_id`
# attribute - only `id` (which already IS the keypair id), `public_key`,
# and `private_key`. Reference `.id` here, not `.keypair_id`.
# Indonesia: Beda dari resource keypair lain di repo ini,
# biznetgio_gpu_keypair gak nge-export attribute `keypair_id` yang
# terpisah - cuma `id` (yang emang UDAH jadi keypair id-nya), `public_key`,
# dan `private_key`. Reference `.id` di sini, jangan `.keypair_id`.

# English: Exactly one of `subscription` or `on_demand` must be set -
# Terraform rejects a plan with neither or both.
# Indonesia: Wajib pilih SATU dari `subscription` atau `on_demand` -
# Terraform bakal reject plan-nya kalau gak ada atau dua-duanya keisi.
resource "biznetgio_gpu_instance" "main" {
  product_id           = local.gpu_product_id
  select_os            = "ubuntu-22"
  keypair_id           = biznetgio_gpu_keypair.main.id
  service_name         = "gpu-example"
  ssh_and_console_user = var.ssh_and_console_user
  console_password     = var.console_password
  pay_with_credit_card = var.pay_with_credit_card

  # English: `subscription` and `on_demand` are object-typed ATTRIBUTES,
  # not nested blocks - assign them with `=`, like any other attribute.
  # Indonesia: `subscription` sama `on_demand` itu attribute yang
  # bertype object, bukan nested block - assign pake `=`, kayak
  # attribute lain biasanya.
  subscription = {
    cycle = "m"
  }

  # English: Swap the attribute above for this one to bill hourly
  # instead - remove `subscription` if you do, only one is allowed.
  # `additional_hours` reserves extra hours on top of the default
  # balance.
  # Indonesia: Ganti attribute di atas jadi ini buat nagih per jam -
  # hapus `subscription` kalau ganti, cuma boleh satu.
  # `additional_hours` reserve jam tambahan di atas balance default.
  #
  # on_demand = {
  #   additional_hours = 0
  # }

  # English: One-shot triggers, commented out on purpose.
  # Indonesia: Trigger one-shot, sengaja dikomen.
  # rebuild_trigger                  = "rebuild-1"  # English: WIPES THE DISK. Indonesia: NGEHAPUS DISK.
  # reserve_additional_hours_trigger = "reserve-1"  # English: reserves more on-demand hours. Indonesia: reserve jam on-demand tambahan.
}

# English: SIDE-EFFECTING - every time you read this data source it mints
# a brand-new one-time console session. Fine to look at with
# `terraform output`, but never reference it from something evaluated
# during plan diffing.
# Indonesia: SIDE-EFFECTING - tiap kali data source ini dibaca, dia
# ngebuat session console one-time yang baru. Aman diliat lewat
# `terraform output`, tapi jangan pernah direference dari sesuatu yang
# dievaluasi pas plan diffing.
data "biznetgio_gpu_console" "console" {
  account_id = biznetgio_gpu_instance.main.id
}

data "biznetgio_gpu_graph" "graph" {
  account_id = biznetgio_gpu_instance.main.id
  timeframe  = "hour"
}
