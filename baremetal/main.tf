# ============================================================================
# English: NEO Metal walkthrough. Dedicated hardware - this is the most
# expensive product line these providers touch, so read the cost warning
# in README.md before running this for real.
#
# Indonesia: Jalan-jalan NEO Metal. Hardware dedicated - ini lini produk
# yang paling mahal yang disentuh provider ini, jadi baca warning biaya
# di README.md dulu sebelum lu jalanin ini beneran.
# ============================================================================

data "biznetgio_baremetal_products" "all" {}

locals {
  baremetal_product_id = data.biznetgio_baremetal_products.all.products[0].product_id
}

# English: Keypair for the server. Leave `public_key` unset and Biznet
# GIO generates one for you server-side (that's what this example does) -
# or set it to your own public key to import an existing one instead.
# Indonesia: Keypair buat server-nya. Biarin `public_key` gak keisi dan
# Biznet GIO bakal generate sendiri di server (itu yang contoh ini
# lakuin) - atau isi pake public key lu sendiri kalau mau import yang
# udah ada.
resource "biznetgio_baremetal_keypair" "main" {
  name = "baremetal-example-key"
}

# English: The server itself. `public_ip = 1` means one public IP comes
# bundled with the order - see the separate additional-IP resources
# below for a SECOND, independent IP.
# Indonesia: Server-nya sendiri. `public_ip = 1` artinya satu public IP
# ikut dibundling sama order-nya - liat resource additional-IP yang
# terpisah di bawah buat IP KEDUA yang independen.
resource "biznetgio_baremetal" "main" {
  product_id           = local.baremetal_product_id
  cycle                = "m"
  select_os            = "ubuntu-22"
  keypair_id           = biznetgio_baremetal_keypair.main.keypair_id
  label                = "baremetal-example"
  public_ip            = 1
  pay_with_credit_card = var.pay_with_credit_card

  # English: One-shot / declarative actions - commented out on purpose,
  # each is either destructive or a real power action.
  # Indonesia: Aksi one-shot / declarative - sengaja dikomen, masing-
  # masing destruktif atau aksi power beneran.

  # power_state   = "off"          # English: on/off, called only when the value changes. Indonesia: on/off, dipanggil cuma pas value-nya berubah.
  # reset_trigger = "reboot-1"     # English: one-shot reset, change the string to re-fire. Indonesia: reset one-shot, ganti string-nya buat trigger lagi.
  # rebuild_os    = "centos7-base" # English: WIPES THE DISK, reinstalls - valid values from the data source below. Indonesia: NGEHAPUS DISK, install ulang - value valid dari data source di bawah.
}

# English: Valid OS images for rebuilding THIS specific server (depends
# on account_id, so it can only be looked up after the server exists).
# Indonesia: OS image yang valid buat rebuild server INI spesifik
# (depend ke account_id, jadi cuma bisa dilookup setelah server-nya ada).
data "biznetgio_baremetal_rebuild_os_list" "ubuntu" {
  account_id = biznetgio_baremetal.main.id
}

# English: Out-of-band OpenVPN access config - useful if the server's
# normal network path is ever down.
# Indonesia: Config akses OpenVPN out-of-band - kepake kalau jalur
# network normal server-nya lagi down.
data "biznetgio_baremetal_openvpn" "vpn" {}

# --- A second, independent public IP -------------------------------------
# --- Public IP kedua yang independen --------------------------------------

# English: An additional floating IP, ordered on its own (independent of
# any server) and then attached below.
# Indonesia: Additional IP yang mengambang, diorder sendiri (independen
# dari server manapun) terus di-attach di bawah.
resource "biznetgio_baremetal_additional_ip" "extra" {
  product_id           = 10
  cycle                = "m"
  region               = "wjv-1"
  pay_with_credit_card = var.pay_with_credit_card
}

# English: Attaches the additional IP to the server above. Reassigning to
# a different server means destroying and recreating this resource.
# Indonesia: Nempelin additional IP-nya ke server di atas. Kalau mau
# pindah ke server lain, resource ini harus di-destroy dan dibuat ulang.
resource "biznetgio_baremetal_additional_ip_assignment" "main" {
  additional_ip_id = biznetgio_baremetal_additional_ip.extra.id
  metal_account_id = biznetgio_baremetal.main.id
}

# --- Elastic storage volume -----------------------------------------------
# --- Volume elastic storage -----------------------------------------------

# English: An extra storage volume, permanently bound to the server above
# from the moment it's created - there's no re-attach endpoint.
# Indonesia: Volume storage tambahan, keiket permanen ke server di atas
# sejak dibuat - gak ada endpoint buat re-attach.
resource "biznetgio_baremetal_elastic_storage" "main" {
  product_id           = 20
  cycle                = "m"
  storage_name         = "baremetal-example-volume"
  metal_account_id     = biznetgio_baremetal.main.id
  size                 = 100
  pay_with_credit_card = var.pay_with_credit_card
}
