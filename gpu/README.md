# NEO GPU example

Covers both resources and all 3 data sources in the `neo-gpus` API group:

- Resources: `biznetgio_gpu_instance`, `biznetgio_gpu_keypair`
- Data sources: `biznetgio_gpu_products`, `biznetgio_gpu_console`, `biznetgio_gpu_graph`

## Cost warning - read this one too

NVIDIA H200 instances are not cheap. This example uses **subscription** billing (monthly), which is the safer of the two modes to experiment with since it's a fixed, known cost. The commented-out `on_demand` block in `main.tf` bills **hourly and starts accruing charges the moment the instance exists**, automatically, with no separate "off" state, until you delete the resource. Do not switch to `on_demand` unless you're actively watching the clock. Read [Billing and orders](https://biznetgio.creations.ren/guides/billing) first.

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

On an on-demand instance, destroying it is what stops the hourly charges - there's no separate "stop billing" action.

---

# Contoh NEO GPU

Cover dua resource dan semua 3 data source di API group `neo-gpus`:

- Resource: `biznetgio_gpu_instance`, `biznetgio_gpu_keypair`
- Data source: `biznetgio_gpu_products`, `biznetgio_gpu_console`, `biznetgio_gpu_graph`

## Warning soal biaya - ini juga wajib dibaca

Instance NVIDIA H200 gak murah. Contoh ini pake billing **subscription** (bulanan), yang lebih aman buat eksperimen karena biayanya fixed dan udah jelas dari awal. Block `on_demand` yang dikomen di `main.tf` nagih **per jam dan mulai narik biaya otomatis begitu instance-nya ada**, gak ada status "off" yang beda, sampe lu delete resource-nya. Jangan pindah ke `on_demand` kecuali lu emang lagi mantengin jamnya. Baca [Billing and orders](https://biznetgio.creations.ren/id/guides/billing) dulu.

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

Di instance on-demand, destroy itu yang bikin biaya per jam-nya berhenti - gak ada aksi "stop billing" yang terpisah.
