variable "region" {
  description = "gcp region to use"
  default     = "us-east1"
}

variable "project" {
  description = "the id of the project in which the resource belongs to"
}

variable "name" {
  description = "name of the memorystore instance"
}

variable "authorized_network" {
  description = "name of the memorystore authorized network"
  default = "default"
}

variable "tier" {
  description = "the service tier of the instance"
  default = "STANDARD_HA"
}

variable "memory_size_gb" {
  description = "memory size in GiB"
  default = 1
}

variable "location_id" {
  description = "The zone where the instance will be provisioned"
  default = "us-east1-b"
}

variable "alternative_location_id" {
  description = "The alternative zone where the instance will be provisioned"
  default = "us-east1-d"
}

variable "redis_version" {
  description = "the version of Redis software"
  default = "REDIS_3_2"
}

variable "display_name" {
  description = "an arbitrary and optional user-provided name for the instance"
  default = ""
}

variable "reserved_ip_range" {
  description = "the CIDR range of internal addresses that are reserved for this instance"
  default = "192.168.0.0/29"
}

variable "labels" {
  description = "resource labels to represent user provided metadata"
  default = {}
}
