variable "project" {
  type = string
}

variable "name" {
  type    = string
  default = "cloud-run-iap"
}

variable "location" {
  type    = string
  default = "us-central1"
}

variable "domain" {
  type = string
}

variable "email" {
  type = string
}

variable "oauth2_client_id" {
  type    = string
  default = ""
}

variable "oauth2_client_secret" {
  type    = string
  default = ""
}

variable "github_repository" {
  type = string
}