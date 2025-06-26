https://cloud.google.com/kubernetes-engine/docs/quickstarts/create-cluster-using-terraform?hl=ja

```sh
$ terraform init
$ terraform plan

$ gcloud auth application-default login

$ gcloud container clusters create-auto my-website --region=asia-northeast1
$ gcloud container clusters get-credentials my-website --region=asia-northeast1
```

terraform init

terraform plan

terraform apply
