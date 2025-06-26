# my-website



```sh

# 現在のプロジェクトを確認
gcloud config get-value project

$ gcloud config set project my-website-464008

# Clusterにアクセスするためのcredentialsも取得します。
$ gcloud container clusters get-credentials my-website --region asia-northeast2

$ kubectl get pod -n argocd

# $ kubectl port-forward argocd-server 11111:443 -n argocd
$ kubectl port-forward svc/argocd-server 8080:443 -n argocd
$ open http://localhost:11111

$ gcloud compute project-info describe --project=my-website-464008

## clean up
$ gcloud container clusters delete argo-demo-cluster --region us-west1


gcloud container node-pools list --cluster=my-website --zone=asia-northeast2
gcloud container clusters describe my-website --zone=asia-northeast2

```

https://zenn.dev/ring_belle/articles/gcp-gke-domain

## gcp

project name: my-website-464008


## urls

- [neondb](https://console.neon.tech/app/projects/gentle-darkness-68702060?branchId=br-raspy-wildflower-a1ylq6i4&database=neondb)

https://console.cloud.google.com/kubernetes/list/overview?hl=ja&inv=1&invt=Ab1Dbw&project=my-website-464008
