# Upgrading to v12.0

The v12.0 release contains backwards-incompatible changes.

## Use `project_id` instead of `project`

This release renames `project` to `project_id`. The required input variable `project_id` will be used to configure the project for the resource creation.


```diff
module "memorystore" {
  source  = "terraform-google-modules/memorystore/google"
  version = "~> 11.0"

  name           = "memorystore"
-  project        = "memorystore"
+  project_id     = "memorystore"
  memory_size_gb = "1"
  enable_apis    = "true"
}
```

To be backward compatible, user needs to set `project_id` instead of `project` input variable.
