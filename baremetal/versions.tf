terraform {
  required_version = ">= 1.0"

  required_providers {
    biznetgio = {
      source  = "registry.terraform.io/shirasakaren/biznetgio"
      version = "0.1.0"
    }
  }
}

provider "biznetgio" {}
