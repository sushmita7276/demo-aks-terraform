variable "sql_server_name" {
  type = string
}

variable "sql_database_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "sql_admin_username" {
  type = string
}

variable "sql_admin_password" {
  type      = string
  sensitive = true
}

variable "sku_name" {
  type    = string
  default = "Basic"
}

variable "client_ip" {
  type    = string
  default = ""20.253.204.46""
}
