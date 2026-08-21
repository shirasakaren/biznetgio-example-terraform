# ============================================================================
# English: NEO Object Storage walkthrough. S3-compatible storage - the
# cheapest and least risky example in this repo, good place to start if
# you're nervous about the others. Order the subscription, make a
# bucket, make a credential, upload one small file with it.
#
# Indonesia: Jalan-jalan NEO Object Storage. Storage yang S3-compatible -
# contoh paling murah dan paling gak berisiko di repo ini, cocok buat
# mulai kalau lu masih deg-degan sama contoh lain. Order subscription-
# nya, bikin bucket, bikin credential, upload satu file kecil pake itu.
# ============================================================================

# English: The subscription itself (the S3 "tenant"). Quota is grow-only
# after this.
# Indonesia: Subscription-nya sendiri ("tenant" S3-nya). Quota cuma bisa
# naik setelah ini.
resource "biznetgio_object_storage" "main" {
  product_id           = 8
  cycle                = "m"
  label                = "example"
  quota                = 10
  pay_with_credit_card = var.pay_with_credit_card
}

# English: A bucket inside that subscription. Only `acl` can be changed
# after creation.
# Indonesia: Satu bucket di dalem subscription itu. Cuma `acl` yang bisa
# diubah setelah dibuat.
resource "biznetgio_object_storage_bucket" "assets" {
  account_id = biznetgio_object_storage.main.id
  name       = "biznetgio-example-assets"
  acl        = "public-read"
}

# English: An S3 access/secret key pair for that subscription. The
# secret key is shown ONLY in this apply's output - copy it out now, it
# can never be re-fetched later.
# Indonesia: Sepasang access/secret key S3 buat subscription itu. Secret
# key-nya CUMA ditunjukin di output apply ini - copy sekarang, gak bisa
# di-fetch ulang nanti.
resource "biznetgio_object_storage_credential" "main" {
  account_id = biznetgio_object_storage.main.id
  active     = true
}

# English: Uploads this folder's index.html straight through the
# control-plane API. Fine for one small file like this - for anything
# bigger or bulk, use real S3 tooling (aws-cli, rclone) with the
# credential above instead, pointed at nos.<region>.neo.id.
# Indonesia: Upload index.html di folder ini langsung lewat control-
# plane API. Oke buat satu file kecil kayak ini - buat yang lebih besar
# atau bulk, pake tooling S3 beneran (aws-cli, rclone) pake credential di
# atas, diarahin ke nos.<region>.neo.id.
resource "biznetgio_object_storage_object" "index" {
  account_id = biznetgio_object_storage.main.id
  bucket     = biznetgio_object_storage_bucket.assets.name
  key        = "index.html"
  source     = "${path.module}/index.html"
  acl        = "public-read"
}

# --- Read-only catalog lookups --------------------------------------------
# --- Lookup katalog read-only ----------------------------------------------

# English: Every Object Storage instance on the account, filtered to
# just the active ones.
# Indonesia: Semua instance Object Storage di account ini, difilter yang
# statusnya active doang.
data "biznetgio_object_storage_instances" "active" {
  status = "Active"
}

data "biznetgio_object_storage_buckets" "all" {
  account_id = biznetgio_object_storage.main.id
}

data "biznetgio_object_storage_credentials" "all" {
  account_id = biznetgio_object_storage.main.id
}
