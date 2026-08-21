# English: Thanks for the PR! Fill in what applies, delete the rest.
# Indonesia: Makasih buat PR-nya! Isi yang berlaku, hapus sisanya.

## What changed

<!-- English: Short summary of the change and why. Indonesia: Ringkasan singkat perubahan dan alasannya. -->

## Checklist

- [ ] New or changed code has bilingual comments (English + Bahasa Indonesia)
- [ ] No em dashes or en dashes added
- [ ] `terraform fmt -check`, `terraform init`, and `terraform validate` pass in every folder this PR touches
- [ ] No secrets committed (`terraform.tfvars` is gitignored, use `terraform.tfvars.example` or `TF_VAR_console_password`)
- [ ] `pay_with_credit_card` stays `false` by default
- [ ] New example folders follow the standard layout (`versions.tf`, `variables.tf`, `main.tf`, `outputs.tf`, `README.md`, plus `terraform.tfvars.example` when the folder takes a console password)
- [ ] Folder README and the root README table are updated
- [ ] If the docs site shows affected behavior, the docs pages (English and `id/`) are updated in this PR or a linked one

## Verification

<!-- English: Paste the output of the checks above, or say which CI run to look at. Indonesia: Tempel output cek di atas, atau sebutin run CI mana yang mesti diliat. -->

## Related

<!-- English: Link issues this closes, e.g. Closes #123. Indonesia: Link issue yang ditutup PR ini, contoh Closes #123. -->
