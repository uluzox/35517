terraform {
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "17.10.0"
    }
    corefunc = {
      source  = "northwood-labs/corefunc"
      version = "1.5.1"
    }
  }
}

provider "gitlab" {}

provider "corefunc" {}

