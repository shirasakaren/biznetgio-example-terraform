# Object Storage example

Covers all 4 resources and all 3 data sources in the `object-storages` API group:

- Resources: `biznetgio_object_storage`, `biznetgio_object_storage_bucket`, `biznetgio_object_storage_credential`, `biznetgio_object_storage_object`
- Data sources: `biznetgio_object_storage_instances`, `biznetgio_object_storage_buckets`, `biznetgio_object_storage_credentials`

This is the cheapest and safest example in the repo - a good first one to try.

## Cost note

Creates a real 10 GB Object Storage subscription. `pay_with_credit_card` defaults to `false` (real order, unpaid until you pay in the portal). Read [Billing and orders](https://biznetgio.creations.ren/guides/billing).

## Run it

```bash
export BIZNETGIO_API_KEY="your-token"
terraform init
terraform plan
terraform apply
```

No `terraform.tfvars` needed - this service doesn't use a console password.

## Clean up

```bash
terraform destroy
```

---

# Contoh Object Storage

Cover semua 4 resource dan semua 3 data source di API group `object-storages`:

- Resource: `biznetgio_object_storage`, `biznetgio_object_storage_bucket`, `biznetgio_object_storage_credential`, `biznetgio_object_storage_object`
- Data source: `biznetgio_object_storage_instances`, `biznetgio_object_storage_buckets`, `biznetgio_object_storage_credentials`

Ini contoh paling murah dan paling aman di repo ini - bagus buat dicoba duluan.

## Catatan biaya

Bikin subscription Object Storage 10 GB beneran. `pay_with_credit_card` default-nya `false` (order beneran, belum dibayar sampe lu bayar di portal). Baca [Billing and orders](https://biznetgio.creations.ren/id/guides/billing).

## Cara jalanin

```bash
export BIZNETGIO_API_KEY="token-lu"
terraform init
terraform plan
terraform apply
```

Gak butuh `terraform.tfvars` - service ini gak pake console password.

## Bersih-bersih

```bash
terraform destroy
```
