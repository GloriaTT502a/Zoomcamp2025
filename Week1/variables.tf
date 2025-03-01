variable "credentials" {
  description = "My Credentials"
  default     = "./keys/my-creds.json"
}

variable "region" {
  description = "Region"
  default     = "northamerica-northeast1"
}

variable "project" {
  description = "Project"
  default     = "esoteric-realm-448604-v0"
}

variable "location" {
  description = "Project Location"
  default     = "northamerica-northeast1"
}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  default     = "demo_dataset"
}

variable "gcs_bucket_name" {
  description = "My Storage Bucket Name"
  default     = "esoteric-realm-448604-v0-terra-bucket"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}