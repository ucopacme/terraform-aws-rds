variable "copy_tags_to_snapshot" {
  description = "On delete, copy all Instance tags to the final snapshot"
  type        = bool
  default     = true
}
variable "secret_id" {
  description = "secret id"
  type        = string
  default     = ""
}
variable "enabled_cloudwatch_logs_exports" {
  description = "List of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine): alert, audit, error, general, listener, slowquery, trace, postgresql (PostgreSQL), upgrade (PostgreSQL)."
  type        = list(string)
  default     = []
}
variable "vpc_security_group_ids" {
  description = "List of VPC security groups to associate"
  type        = list(string)
  default     = []
}

variable "enabled" {
  default     = true
  description = "Set to `false` to prevent the module from creating any resources"
  type        = bool
}
variable "blue_green_update" {
  default     = false
  description = "Enables Low-Downtime Updates when true"
  type        = bool
}
variable "skip_final_snapshot" {
  default     = true
  description = "Set to `false` to skip_final_snapshot"
  type        = bool
}
variable "storage_encrypted" {
  default     = true
  description = "Set to `false` to not encrypt the storage"
  type        = bool
}
variable "storage_type" {
  default     = "gp2"
  description = "gp2, gp3, or io1. Historical default is gp2."
  type        = string
}
variable "multi_az" {
  default     = false
  description = "Specifies if the RDS instance is multi-AZ"
  type        = bool
}
variable "publicly_accessible" {
  default     = false
  description = "Set to `false` to prevent Database accessibility"
  type        = bool
}

variable "parameter_group_name" {
  default = "default.mysql8.0"
}
variable "option_group_name" {
  default = ""
}
variable "deletion_protection" {
  default     = true
  description = "Set to `false` to prevent database from deletation"
  type        = bool
}

variable "apply_immediately" {
  default     = true
  description = "Set to `false` to prevent immediate changes"
  type        = bool
}
variable "allocated_storage" {
  default     = ""
  description = "Allocate storage size"
  type        = string
}

variable "backup_retention_period" {
  default     = 14
  description = "enable auto backup and retention"
  type        = number
}
variable "engine" {
  default     = ""
  description = "Specify engine name"
  type        = string
}
variable "identifier" {
  default     = ""
  description = "Specify DB name"
  type        = string
}

variable "engine_version" {
  default     = ""
  description = "Specify DB version"
  type        = string
}
variable "instance_class" {
  default     = ""
  description = "Specify instance type"
  type        = string
}

variable "tags" {
  default     = {}
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnets"
  default     = []
}

variable "secret_manager_name" {
  type = string
  description = " secret manager name"
  default = ""
}

 variable "max_allocated_storage" {
  type = string
  description = "Max allocate storage"
  default = null
}
variable "snapshot_identifier" {
  type = string
  description = "snapshot_identifier id"
  default = null
}
