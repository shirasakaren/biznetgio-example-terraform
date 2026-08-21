# English: Pin the provider so `terraform init` always downloads a version
# that matches what this example was written and tested against.
# Indonesia: Pin provider-nya biar `terraform init` selalu download versi
# yang emang cocok sama contoh yang ditulis dan ditest di sini.
terraform {
  required_version = ">= 1.0"

  required_providers {
    biznetgio = {
      source  = "registry.terraform.io/shirasakaren/biznetgio"
      version = "0.1.0"
    }
  }
}

# English: No arguments needed here - the provider reads BIZNETGIO_API_KEY
# from the environment. See README.md for how to set it.
# Indonesia: Gak butuh argument di sini - provider-nya baca BIZNETGIO_API_KEY
# dari environment. Liat README.md buat cara nyetnya.
provider "biznetgio" {}
