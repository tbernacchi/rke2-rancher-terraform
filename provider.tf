terraform {
  required_providers {
    rancher2 = {
      source  = "rancher/rancher2"
      version = ">= 1.25.0"
    }
  }
  required_version = ">= 1.3.6"
}

provider "rancher2" {
  api_url   = var.rancher_url
  token_key = var.rancher2_token_key
  bootstrap = false
}

