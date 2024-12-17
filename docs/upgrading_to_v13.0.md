# Upgrading to v13.0

The v13.0 release contains backwards-incompatible changes.

## Explicitly provide region as input

```diff
module "memorystore" {
  source  = "terraform-google-modules/memorystore/google"
  version = "~> 13.0"

  name           = "memorystore"
  project_id     = "memorystore"
  memory_size_gb = "1"
  enable_apis    = "true"
+ region         = "us-central1"
}

```

## Replace uses of apphub_service_uri

This release removes apphub_service_uri output. You can replace use of `apphub_service_uri` by forming the desired output as below,

```
{
    service_uri = "//redis.googleapis.com/${module.memorystore.id}"
    service_id  = substr("${<redis-instance-name>}-${md5(${module.memorystore.id})}", 0, 63)
}
```
