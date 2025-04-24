variable "name" {
  type = string
}

variable "path" {
  type = string
}

variable "description" {
  type    = string
  default = null
}

terraform {
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "17.11.0"
    }
  }
}

resource "gitlab_project" "repo" {
  name                                             = var.name
  path                                             = var.path
  description                                      = var.description
  visibility_level                                 = "private"
}
