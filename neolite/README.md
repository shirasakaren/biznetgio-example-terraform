# NEO Lite example

Covers all 5 resources and all 5 data sources in the `neolites` API group:

- Resources: `biznetgio_neolite_vm`, `biznetgio_neolite_keypair`, `biznetgio_neolite_disk`, `biznetgio_neolite_snapshot`, `biznetgio_neolite_vm_from_snapshot`
- Data sources: `biznetgio_neolite_products`, `biznetgio_neolite_os_list`, `biznetgio_neolite_ip_availability`, `biznetgio_neolite_change_package_options`, `biznetgio_neolite_storage_upgrade_options`

## Cost warning

This creates a real VM, a real extra disk, a real snapshot, and restores that snapshot into a **second** real VM (so two VMs total by the end). `pay_with_credit_card` defaults to `false`, which still places real orders, they just stay `Pending` (unpaid) in the portal instead of charging your card. Read [Billing and orders](https://biznetgio.creations.ren/guides/billing) before you flip that to `true`.

## Run it

```bash
export BIZNETGIO_API_KEY="your-token"
cp terraform.tfvars.example terraform.tfvars   # edit the password inside
terraform init
terraform plan
terraform apply
```

## Clean up

```bash
terraform destroy
```

This deletes both VMs, the disk, and the snapshot. It does not touch anything outside this folder's state.

---

# Contoh NEO Lite

Cover semua 5 resource dan semua 5 data source di API group `neolites`:

- Resource: `biznetgio_neolite_vm`, `biznetgio_neolite_keypair`, `biznetgio_neolite_disk`, `biznetgio_neolite_snapshot`, `biznetgio_neolite_vm_from_snapshot`
- Data source: `biznetgio_neolite_products`, `biznetgio_neolite_os_list`, `biznetgio_neolite_ip_availability`, `biznetgio_neolite_change_package_options`, `biznetgio_neolite_storage_upgrade_options`

## Warning soal biaya

Ini bikin VM beneran, disk tambahan beneran, snapshot beneran, dan restore snapshot itu jadi VM KEDUA yang juga beneran (jadi total dua VM di akhir). `pay_with_credit_card` default-nya `false`, yang tetep bikin order beneran, cuma statusnya `Pending` (belum dibayar) di portal daripada langsung nge-charge kartu lu. Baca [Billing and orders](https://biznetgio.creations.ren/id/guides/billing) dulu sebelum lu ganti itu ke `true`.

## Cara jalanin

```bash
export BIZNETGIO_API_KEY="token-lu"
cp terraform.tfvars.example terraform.tfvars   # edit password-nya di dalem
terraform init
terraform plan
terraform apply
```

## Bersih-bersih

```bash
terraform destroy
```

Ini ngehapus dua VM-nya, disk-nya, sama snapshot-nya. Gak bakal nyentuh apa-apa di luar state folder ini.
