# NEO Lite Pro example

Covers 4 resources and 5 data sources in the `neolite-pros` API group:

- Resources: `biznetgio_neolite_pro_vm`, `biznetgio_neolite_pro_keypair`, `biznetgio_neolite_pro_disk`, `biznetgio_neolite_pro_snapshot`
- Data sources: `biznetgio_neolite_pro_products`, `biznetgio_neolite_pro_os_list`, `biznetgio_neolite_pro_ip_availability`, `biznetgio_neolite_pro_change_package_options`, `biznetgio_neolite_pro_storage_upgrade_options`

There is no `vm_from_snapshot` equivalent here - see `main.tf` for why.

## Cost warning

Creates a real Pro VM, a real extra disk, and a real snapshot. `pay_with_credit_card` defaults to `false` (real order, unpaid until you pay in the portal). Read [Billing and orders](https://biznetgio.creations.ren/guides/billing) first.

## Run it

```bash
export BIZNETGIO_API_KEY="your-token"
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform plan
terraform apply
```

## Clean up

```bash
terraform destroy
```

---

# Contoh NEO Lite Pro

Cover 4 resource dan 5 data source di API group `neolite-pros`:

- Resource: `biznetgio_neolite_pro_vm`, `biznetgio_neolite_pro_keypair`, `biznetgio_neolite_pro_disk`, `biznetgio_neolite_pro_snapshot`
- Data source: `biznetgio_neolite_pro_products`, `biznetgio_neolite_pro_os_list`, `biznetgio_neolite_pro_ip_availability`, `biznetgio_neolite_pro_change_package_options`, `biznetgio_neolite_pro_storage_upgrade_options`

Gak ada yang setara `vm_from_snapshot` di sini - liat `main.tf` buat alasannya.

## Warning soal biaya

Bikin VM Pro beneran, disk tambahan beneran, dan snapshot beneran. `pay_with_credit_card` default-nya `false` (order beneran, belum dibayar sampe lu bayar di portal). Baca [Billing and orders](https://biznetgio.creations.ren/id/guides/billing) dulu.

## Cara jalanin

```bash
export BIZNETGIO_API_KEY="token-lu"
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform plan
terraform apply
```

## Bersih-bersih

```bash
terraform destroy
```
