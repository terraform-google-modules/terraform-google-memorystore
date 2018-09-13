module "memorystore" {
  source  = "git::ssh://git@github.com/telus/terraform-google-memorystore"
  name = "memorystore"
  project = "memorystore"
}
