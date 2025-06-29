.PHONY: auth
auth:
	gcloud container clusters get-credentials my-website-gke-dev --region=asia-northeast1
.PHONY: apply
apply:
	kubectl apply -k manifests/

.PHONY: delete
delete:
	kubectl delete -k manifests/

.PHONY: diff
diff:
	kubectl diff -k manifests/

.PHONY: dry-run
dry-run:
	kubectl apply -k manifests/ --dry-run=client
