variable "resource_group_name" {}
variable "location" {}
variable "sql_server_name" {}
variable "sql_database_name" {}
variable "admin_username" {}
variable "admin_password" {
  sensitive = true
}