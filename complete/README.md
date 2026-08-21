# Complete example: a small production shape

A NEO Lite Pro VM plus an Object Storage bucket and credential for its data, wrapped in a reusable module. This is the runnable version of the [Capstone tutorial](https://biznetgio.creations.ren/tutorials/production-deployment) on the docs site - read that page for the full reasoning (why this module shape, how it grows into staging/production with CI/CD, how state and secrets fit in).

Uses:

- `biznetgio_neolite_pro_vm`, `biznetgio_neolite_pro_keypair` (app tier)
- `biznetgio_object_storage`, `biznetgio_object_storage_bucket`, `biznetgio_object_storage_credential` (data bucket)
- `biznetgio_neolite_pro_products`, `biznetgio_neolite_pro_os_list` (catalog lookups)

## Cost warning

Real NEO Lite Pro VM plus a real Object Storage subscription. `pay_with_credit_card` defaults to `false`. Read [Billing and orders](https://biznetgio.creations.ren/guides/billing).

## Run it

```bash
export BIZNETGIO_API_KEY="your-token"
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform plan
terraform apply
```

## Where to go from here

Want this same module split across a `staging` and `production` environment, deployed through a GitHub Actions pipeline with a required-reviewer gate? That's exactly what the [tutorial track](https://biznetgio.creations.ren/tutorials/project-structure) builds, starting from this same module.

## Clean up

```bash
terraform destroy
```

---

# Contoh complete: bentuk production yang kecil

VM NEO Lite Pro plus bucket dan credential Object Storage buat data-nya, dibungkus di module yang reusable. Ini versi yang beneran bisa dijalanin dari [tutorial Capstone](https://biznetgio.creations.ren/id/tutorials/production-deployment) di docs site - baca halaman itu buat alasan lengkapnya (kenapa bentuk module ini, gimana dia gede jadi staging/production dengan CI/CD, gimana state dan secret masuk ke sini).

Pake:

- `biznetgio_neolite_pro_vm`, `biznetgio_neolite_pro_keypair` (app tier)
- `biznetgio_object_storage`, `biznetgio_object_storage_bucket`, `biznetgio_object_storage_credential` (bucket data)
- `biznetgio_neolite_pro_products`, `biznetgio_neolite_pro_os_list` (lookup katalog)

## Warning soal biaya

VM NEO Lite Pro beneran plus subscription Object Storage beneran. `pay_with_credit_card` default-nya `false`. Baca [Billing and orders](https://biznetgio.creations.ren/id/guides/billing).

## Cara jalanin

```bash
export BIZNETGIO_API_KEY="token-lu"
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform plan
terraform apply
```

## Lanjut ke mana

Mau module yang sama ini dipecah jadi environment `staging` sama `production`, dideploy lewat pipeline GitHub Actions dengan gate required-reviewer? Itu persis yang [tutorial track](https://biznetgio.creations.ren/id/tutorials/project-structure) bangun, mulai dari module yang sama ini.

## Bersih-bersih

```bash
terraform destroy
```
