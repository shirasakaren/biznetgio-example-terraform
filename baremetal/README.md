# NEO Metal example

Covers all 5 resources and all 3 data sources in the `baremetals` API group:

- Resources: `biznetgio_baremetal`, `biznetgio_baremetal_keypair`, `biznetgio_baremetal_additional_ip`, `biznetgio_baremetal_additional_ip_assignment`, `biznetgio_baremetal_elastic_storage`
- Data sources: `biznetgio_baremetal_products`, `biznetgio_baremetal_rebuild_os_list`, `biznetgio_baremetal_openvpn`

## Cost warning - read this one

NEO Metal is **dedicated physical hardware**, the most expensive product line in this whole repo. This example orders one bare-metal server, one additional floating IP, and one elastic storage volume. `pay_with_credit_card` defaults to `false` so the orders stay unpaid in the portal, but they are still real orders against real hardware inventory. Don't run this against a real account unless you actually intend to rent a bare-metal server. Read [Billing and orders](https://biznetgio.creations.ren/guides/billing) first.

## Run it

```bash
export BIZNETGIO_API_KEY="your-token"
terraform init
terraform plan
terraform apply
```

No `terraform.tfvars` needed here - NEO Metal authenticates with a keypair only, no console password to configure.

## Clean up

```bash
terraform destroy
```

---

# Contoh NEO Metal

Cover semua 5 resource dan semua 3 data source di API group `baremetals`:

- Resource: `biznetgio_baremetal`, `biznetgio_baremetal_keypair`, `biznetgio_baremetal_additional_ip`, `biznetgio_baremetal_additional_ip_assignment`, `biznetgio_baremetal_elastic_storage`
- Data source: `biznetgio_baremetal_products`, `biznetgio_baremetal_rebuild_os_list`, `biznetgio_baremetal_openvpn`

## Warning soal biaya - ini wajib dibaca

NEO Metal itu **hardware fisik dedicated**, lini produk paling mahal di seluruh repo ini. Contoh ini order satu server bare-metal, satu additional floating IP, dan satu volume elastic storage. `pay_with_credit_card` default-nya `false` jadi order-nya kebiarin belum dibayar di portal, tapi tetep order beneran ke inventory hardware yang beneran. Jangan jalanin ini ke akun beneran kecuali lu emang niat sewa server bare-metal. Baca [Billing and orders](https://biznetgio.creations.ren/id/guides/billing) dulu.

## Cara jalanin

```bash
export BIZNETGIO_API_KEY="token-lu"
terraform init
terraform plan
terraform apply
```

Gak butuh `terraform.tfvars` di sini - NEO Metal authenticate cuma pake keypair, gak ada console password buat diconfig.

## Bersih-bersih

```bash
terraform destroy
```
