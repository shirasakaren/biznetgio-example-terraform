<p align="center">
  <a href="https://biznetgio.creations.ren"><img src="https://img.shields.io/badge/%F0%9F%8C%90%20docs-biznetgio.creations.ren-008541?style=for-the-badge" alt="Documentation site"></a>
</p>

<h1 align="center">biznetgio-example-terraform</h1>

<p align="center">
  Runnable, beginner-friendly Terraform examples for every resource the <a href="https://github.com/shirasakaren/terraform-provider-biznetgio">Biznet GIO Terraform provider</a> exposes.
</p>

Six self-contained examples, one per Biznet GIO product line, plus one "complete" example that combines two of them into a small real production shape. Every `.tf` file is commented in both English and Bahasa Indonesia, line by line, so you can actually follow what's happening instead of just copy-pasting blindly.

This is a companion to the [documentation site](https://biznetgio.creations.ren) - especially the [tutorials track](https://biznetgio.creations.ren/tutorials/project-structure), which explains the *why* behind the patterns used here (project layout, environments, state, CI/CD, modules). Read the docs to understand; clone this repo to actually run something.

## What's here

| Folder | Covers | Resources | Data sources |
| --- | --- | --- | --- |
| [`neolite/`](./neolite) | NEO Lite VPS | all 5 | all 5 |
| [`neolite-pro/`](./neolite-pro) | NEO Lite Pro VPS | all 4 | all 5 |
| [`baremetal/`](./baremetal) | NEO Metal bare-metal | all 5 | all 3 |
| [`gpu/`](./gpu) | NEO GPU | all 2 | all 3 |
| [`object-storage/`](./object-storage) | NEO Object Storage | all 4 | all 3 |
| [`complete/`](./complete) | NEO Lite Pro + Object Storage together, as one reusable module | 5 (via module) | 2 |

Every resource and data source documented on the [reference pages](https://biznetgio.creations.ren/terraform/resources/neolite) is used somewhere in this repo - 20 resources, 19 data sources, all of them.

## Before you run anything

Every create/upgrade call in these examples places a **real order** against your Biznet GIO account. Each example defaults `pay_with_credit_card` to `false`, which still creates the real thing, it just leaves the invoice unpaid in the portal instead of charging your card - this is the safe way to rehearse the whole flow. `baremetal/` and `gpu/` carry an extra warning in their own README because they're the most expensive product lines. Read [Billing and orders](https://biznetgio.creations.ren/guides/billing) once before you start.

You'll also need:

- [Terraform](https://developer.hashicorp.com/terraform/install) >= 1.0
- A Biznet GIO API token - see [Authentication](https://biznetgio.creations.ren/authentication)

## Quickstart

```bash
git clone https://github.com/shirasakaren/biznetgio-example-terraform.git
cd biznetgio-example-terraform/object-storage   # cheapest, safest one to start with

export BIZNETGIO_API_KEY="your-token"
terraform init
terraform plan
terraform apply
```

Each folder is independent - `cd` into the one you want and run Terraform from there. Nothing in one folder's state affects another's.

## Using this as a template for your own project

This repo is meant to be copied, not just read:

1. Pick the example closest to what you're building (or start from `complete/` if you want the module pattern).
2. Copy that folder into your own repository.
3. Rename resources, adjust product IDs, and delete whatever you don't need.
4. Follow the [tutorials track](https://biznetgio.creations.ren/tutorials/project-structure) to add environments, remote state, and CI/CD on top of it.

## CI/CD

`.github/workflows/ci.yml` runs on manual dispatch only - it never triggers on push. Go to the **Actions** tab, run the workflow, and pick:

- **example**: which folder to run, or `all`
- **action**: `validate` (default, no credentials needed), `plan`, `apply`, or `destroy` (the last three need a `BIZNETGIO_API_KEY` repo secret, and `apply`/`destroy` place real orders)

If any example needs a console password (`neolite`, `neolite-pro`, `gpu`, `complete`), also set an `EXAMPLE_CONSOLE_PASSWORD` repo secret before running `plan`/`apply`.

## License

[MIT](LICENSE)

---

<p align="center">
  <a href="https://biznetgio.creations.ren"><img src="https://img.shields.io/badge/%F0%9F%8C%90%20docs-biznetgio.creations.ren-008541?style=for-the-badge" alt="Situs dokumentasi"></a>
</p>

# biznetgio-example-terraform (Bahasa Indonesia)

Enam contoh Terraform yang bisa dijalanin beneran, buat pemula, satu contoh per lini produk Biznet GIO, plus satu contoh "complete" yang gabungin dua lini produk jadi satu bentuk production kecil yang beneran. Tiap file `.tf` dikomen dalam Bahasa Inggris dan Bahasa Indonesia, baris per baris, biar lu beneran ngerti apa yang kejadian, bukan cuma copy-paste doang.

Ini pendamping [docs site](https://biznetgio.creations.ren) - terutama [tutorial track](https://biznetgio.creations.ren/id/tutorials/project-structure), yang jelasin *kenapa* di balik pattern yang dipake di sini (layout project, environment, state, CI/CD, module). Baca docs buat ngerti; clone repo ini buat beneran jalanin sesuatu.

## Yang ada di sini

| Folder | Cover | Resource | Data source |
| --- | --- | --- | --- |
| [`neolite/`](./neolite) | VPS NEO Lite | semua 5 | semua 5 |
| [`neolite-pro/`](./neolite-pro) | VPS NEO Lite Pro | semua 4 | semua 5 |
| [`baremetal/`](./baremetal) | Bare-metal NEO Metal | semua 5 | semua 3 |
| [`gpu/`](./gpu) | NEO GPU | semua 2 | semua 3 |
| [`object-storage/`](./object-storage) | NEO Object Storage | semua 4 | semua 3 |
| [`complete/`](./complete) | NEO Lite Pro + Object Storage digabung jadi satu module reusable | 5 (lewat module) | 2 |

Semua resource dan data source yang didokumentasiin di [halaman reference](https://biznetgio.creations.ren/id/terraform/resources/neolite) dipake di suatu tempat di repo ini - 20 resource, 19 data source, semuanya.

## Sebelum lu jalanin apa-apa

Tiap panggilan create/upgrade di contoh-contoh ini bikin **order beneran** ke account Biznet GIO lu. Tiap contoh default-in `pay_with_credit_card` ke `false`, yang tetep bikin resource-nya beneran, cuma invoice-nya dibiarin belum dibayar di portal daripada langsung nge-charge kartu lu - ini cara aman buat gladi resik seluruh flow-nya. `baremetal/` dan `gpu/` punya warning ekstra di README masing-masing soalnya itu lini produk paling mahal. Baca [Billing and orders](https://biznetgio.creations.ren/id/guides/billing) dulu sebelum mulai.

Lu juga butuh:

- [Terraform](https://developer.hashicorp.com/terraform/install) >= 1.0
- API token Biznet GIO - liat [Authentication](https://biznetgio.creations.ren/id/authentication)

## Quickstart

```bash
git clone https://github.com/shirasakaren/biznetgio-example-terraform.git
cd biznetgio-example-terraform/object-storage   # paling murah, paling aman buat mulai

export BIZNETGIO_API_KEY="token-lu"
terraform init
terraform plan
terraform apply
```

Tiap folder independen - `cd` ke yang lu mau terus jalanin Terraform dari situ. Gak ada state di satu folder yang mempengaruhi folder lain.

## Pake ini sebagai template buat project lu sendiri

Repo ini emang dibuat buat dicopy, bukan cuma dibaca:

1. Pilih contoh yang paling mendekati apa yang lu bangun (atau mulai dari `complete/` kalau mau pattern module-nya).
2. Copy folder itu ke repository lu sendiri.
3. Rename resource-nya, sesuaiin product ID, hapus yang gak kepake.
4. Ikutin [tutorial track](https://biznetgio.creations.ren/id/tutorials/project-structure) buat nambahin environment, remote state, dan CI/CD di atasnya.

## CI/CD

`.github/workflows/ci.yml` jalan manual doang - gak pernah trigger pas push. Buka tab **Actions**, jalanin workflow-nya, pilih:

- **example**: folder mana yang mau dijalanin, atau `all`
- **action**: `validate` (default, gak butuh credential), `plan`, `apply`, atau `destroy` (tiga terakhir butuh secret `BIZNETGIO_API_KEY` di repo, dan `apply`/`destroy` bikin order beneran)

Kalau contohnya butuh console password (`neolite`, `neolite-pro`, `gpu`, `complete`), set juga secret `EXAMPLE_CONSOLE_PASSWORD` di repo sebelum jalanin `plan`/`apply`.

## Lisensi

[MIT](LICENSE)
