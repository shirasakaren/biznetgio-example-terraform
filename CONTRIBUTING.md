<p align="center">
  <a href="https://biznetgio.creations.ren/contribute/introduction"><img src="https://img.shields.io/badge/%F0%9F%A4%9D%20contribute-guide-008541?style=for-the-badge" alt="Contribution guide"></a>
</p>

# Contributing

Thanks for wanting to help! This repo is built to be a template, so anything you contribute here teaches the next person. Keep it beginner friendly, keep it bilingual, and keep it safe to run.

The full contribution guide lives on the docs site under the **Contribute** tab:

- [Contribute home](https://biznetgio.creations.ren/contribute/introduction)
- [How the repos are organized](https://biznetgio.creations.ren/contribute/repositories)
- [Local setup](https://biznetgio.creations.ren/contribute/setup)
- [Conventions](https://biznetgio.creations.ren/contribute/conventions)
- [Commits and PRs](https://biznetgio.creations.ren/contribute/commits-and-prs)
- [Issues](https://biznetgio.creations.ren/contribute/issues)
- [CODEOWNERS and reviews](https://biznetgio.creations.ren/contribute/codeowners)
- [Pipelines](https://biznetgio.creations.ren/contribute/pipelines)
- [Terraform repo guide](https://biznetgio.creations.ren/contribute/terraform-guide)

## The short version

1. Fork the repo, branch from `main`, and open a PR back to `main`. That's the whole workflow, it's [GitHub Flow](https://docs.github.com/en/get-started/using-github/github-flow).
2. Every new code file gets bilingual comments (English + Bahasa Indonesia). Copy the banner and section style from any existing `.tf` file.
3. No em dashes or en dashes anywhere in text or comments. Hyphens only.
4. Never commit secrets. `terraform.tfvars` is gitignored; copy `terraform.tfvars.example` instead, or pass `TF_VAR_console_password`.
5. `pay_with_credit_card` defaults to `false`. Always.
6. Run `terraform fmt -check`, `terraform init`, and `terraform validate` in every folder you touched before opening the PR.
7. Commit messages follow [Conventional Commits](https://www.conventionalcommits.org), for example `fix(gpu): use keypair id for the GPU instance`.
8. If the docs site shows something your change affects, update those pages too, in English and in `id/`.
9. CI runs on manual dispatch only. The maintainer triggers it after review, since `apply` and `destroy` place real orders.

## License

By contributing, you agree that your contributions are licensed under the [MIT License](LICENSE) of this repo.

---

<p align="center">
  <a href="https://biznetgio.creations.ren/id/contribute/introduction"><img src="https://img.shields.io/badge/%F0%9F%A4%9D%20panduan-kontribusi-008541?style=for-the-badge" alt="Panduan kontribusi"></a>
</p>

# Berkontribusi (Bahasa Indonesia)

Makasih udah mau bantu! Repo ini emang dibuat buat jadi template, jadi apapun yang lu kontribusiin di sini ngajarin orang berikutnya. Tetep ramah pemula, tetep dwibahasa, dan tetep aman buat dijalanin.

Panduan kontribusi lengkapnya ada di docs site di tab **Contribute**:

- [Beranda Contribute](https://biznetgio.creations.ren/id/contribute/introduction)
- [Susunan repo](https://biznetgio.creations.ren/id/contribute/repositories)
- [Setup lokal](https://biznetgio.creations.ren/id/contribute/setup)
- [Konvensi](https://biznetgio.creations.ren/id/contribute/conventions)
- [Commit dan PR](https://biznetgio.creations.ren/id/contribute/commits-and-prs)
- [Issue](https://biznetgio.creations.ren/id/contribute/issues)
- [CODEOWNERS dan review](https://biznetgio.creations.ren/id/contribute/codeowners)
- [Pipeline](https://biznetgio.creations.ren/id/contribute/pipelines)
- [Panduan repo Terraform](https://biznetgio.creations.ren/id/contribute/terraform-guide)

## Versi singkatnya

1. Fork repo ini, branch dari `main`, terus buka PR balik ke `main`. Itu aja alurnya, namanya [GitHub Flow](https://docs.github.com/en/get-started/using-github/github-flow).
2. Tiap file kode baru dikomen dwibahasa (Bahasa Inggris + Bahasa Indonesia). Copy gaya banner dan section dari file `.tf` mana pun yang udah ada.
3. Gak ada em dash atau en dash di mana pun, di teks atau komen. Pake hyphen aja.
4. Jangan pernah commit secret. `terraform.tfvars` di-gitignore; copy `terraform.tfvars.example` aja, atau kirim lewat `TF_VAR_console_password`.
5. `pay_with_credit_card` default-nya `false`. Selalu.
6. Jalanin `terraform fmt -check`, `terraform init`, dan `terraform validate` di tiap folder yang lu sentuh sebelum buka PR.
7. Pesan commit pake [Conventional Commits](https://www.conventionalcommits.org), contohnya `fix(gpu): use keypair id for the GPU instance`.
8. Kalau perubahan lu ngaruh ke sesuatu yang ditunjukin docs site, update halaman itu juga, dalam Bahasa Inggris dan `id/`.
9. CI jalan manual doang. Maintainer yang trigger setelah review, soalnya `apply` dan `destroy` bikin order beneran.

## Lisensi

Dengan berkontribusi, lu setuju kontribusi lu dilisensikan di bawah [Lisensi MIT](LICENSE) repo ini.
