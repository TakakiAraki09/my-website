variable "project" {
  default = "my-website-464008"
  description = "Project ID"
}
variable "region" {
  default = "asia-northeast1"
  # 用語 https://cloud.google.com/blog/ja/products/containers-kubernetes/choosing-a-regional-vs-zonal-gke-cluster
  # zone https://cloud.google.com/compute/docs/regions-zones?hl=ja
  description = "region setting"
}
