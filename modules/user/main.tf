variable "firstname" {
  type = string
}

variable "lastname" {
  type = string
}

variable "username_override" {
  type    = string
  default = null
}

variable "name_override" {
  type    = string
  default = null
}

variable "email" {
  type = string
}

terraform {
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "17.11.0"
    }
    corefunc = {
      source  = "northwood-labs/corefunc"
      version = "1.5.1"
    }
  }
}

locals {
  username_from_first_and_last_name = provider::corefunc::str_iterative_replace(
    lower("${var.firstname}.${var.lastname}"),
    [
      { old = "ä", new = "ae" },
      { old = "ö", new = "oe" },
      { old = "ü", new = "ue" },
      { old = "ß", new = "ss" },
    ],
  )
  username = var.username_override == null ? local.username_from_first_and_last_name : var.username_override
}

resource "gitlab_user" "user" {
  name     = var.name_override == null ? "${var.firstname} ${var.lastname}" : var.name_override
  username = local.username
  email    = var.email
}
