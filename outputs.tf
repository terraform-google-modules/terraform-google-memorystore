output "id" {
  description = "The memorystore instance id"
  value = "${google_redis_instance.default.id}"
}

output "host" {
  description = "the ip address of the instance"
  value = "${google_redis_instance.default.host}"
}

output "region" {
  description = "the region the instance lives in"
  value = "${google_redis_instance.default.host}"
}
