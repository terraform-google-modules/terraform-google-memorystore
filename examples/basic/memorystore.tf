module "memorystore" {
  source  = "git::ssh://git@github.com/terraform-google-modules/terraform-google-memorystore"
  name = "memorystore"
  project = "memorystore"
}
