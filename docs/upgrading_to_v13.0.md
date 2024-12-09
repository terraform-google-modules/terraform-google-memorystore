# Upgrading to v13.0

The v13.0 release contains backwards-incompatible changes.

## Replace uses of apphub_service_uri

This release removes apphub_service_uri output. You can replace use of `apphub_service_uri` by forming the desired output as below,

```
{
    service_uri = "//redis.googleapis.com/${module.memorystore.id}"
    service_id  = substr("${<redis-instance-name>}-${md5(${module.memorystore.id})}", 0, 63)
}
```
