# my-website Kubernetes on GCP

このプロジェクトは、Google Cloud Platform (GCP) 上のGoogle Kubernetes Engine (GKE) を使用してWebサイトをデプロイ・管理するためのKubernetesマニフェストファイルを含んでいます。

## 🏗️ アーキテクチャ概要

- **クラウドプロバイダー**: Google Cloud Platform (GCP)
- **コンテナオーケストレーション**: Google Kubernetes Engine (GKE)
- **リージョン**: asia-northeast1
- **クラスタ名**: my-website-gke

## 📋 前提条件

以下のツールがインストールされている必要があります：

- `kubectl` - Kubernetesクラスタを操作するためのCLIツール
- `gcloud` - GCPを操作するためのCLIツール
- `k9s` (オプション) - KubernetesクラスタをTUIで管理するツール

## 🚀 セットアップ手順

### 1. GCPへの認証

```bash
# GCPアカウントにログイン
$ gcloud auth login

# アプリケーションのデフォルト認証情報を設定
$ gcloud auth application-default login
```

### 2. GKEクラスタへの接続

```bash
# kubectlの認証情報を取得
$ gcloud container clusters get-credentials my-website-gke-dev --region=asia-northeast1
```

### 3. Namespaceの作成

```bash
# 新しいnamespaceを作成（例：production）
$ kubectl create namespace production

# 作成されたnamespaceを確認
$ kubectl get namespaces
```

### 4. リソースのデプロイ

```bash
# 特定のマニフェストファイルを適用
$ kubectl apply -f {{target}} -n {{namespace}}

# 例：production namespaceにdeployment.yamlを適用
$ kubectl apply -f deployment.yaml -n production
```

## 📁 ディレクトリ構造

```
k8s/
├── README.md          # このファイル
├── deployments/       # Deploymentマニフェスト
├── services/          # Serviceマニフェスト
├── ingress/          # Ingressマニフェスト
└── configmaps/       # ConfigMapマニフェスト
```

## 🔧 よく使うコマンド

### リソースの確認

```bash
# Podの一覧を表示
$ kubectl get pods -n {{namespace}}

# Serviceの一覧を表示
$ kubectl get services -n {{namespace}}

# すべてのリソースを表示
$ kubectl get all -n {{namespace}}
```

### デバッグ

```bash
# Podのログを確認
$ kubectl logs {{pod-name}} -n {{namespace}}

# Podの詳細情報を確認
$ kubectl describe pod {{pod-name}} -n {{namespace}}

# Podにシェルでアクセス
$ kubectl exec -it {{pod-name}} -n {{namespace}} -- /bin/bash
```

### k9sの使用

```bash
# k9sを起動（TUIでクラスタを管理）
$ k9s
```

## 🛠️ Makeコマンド

このプロジェクトではKustomizeを使用したリソース管理を簡単にするためのMakefileを提供しています。

```bash
# Kustomizeを使用してすべてのマニフェストを適用
$ make apply

# 適用前に差分を確認
$ make diff

# ドライランで適用内容を確認（実際には適用しない）
$ make dry-run

# すべてのリソースを削除
$ make delete
```

### 各コマンドの詳細

- **`make apply`**: `manifests/` ディレクトリ内のKustomization設定に基づいてリソースを作成・更新します
- **`make diff`**: 現在のクラスタの状態と適用予定の設定の差分を表示します
- **`make dry-run`**: 実際に適用せずに、どのようなリソースが作成・更新されるかを確認します
- **`make delete`**: Kustomizationで管理されているすべてのリソースを削除します

## 🔍 トラブルシューティング

### 認証エラーの場合

```bash
# 認証情報をリフレッシュ
$ gcloud auth application-default login
$ gcloud container clusters get-credentials my-website-gke --region=asia-northeast1
```

### Podが起動しない場合

```bash
# Podのイベントを確認
$ kubectl describe pod {{pod-name}} -n {{namespace}}

# Podのログを確認
$ kubectl logs {{pod-name}} -n {{namespace}} --previous
```

## 📝 現在のNamespace

- example
- production (推奨)

## 🔒 セキュリティ考慮事項

- 本番環境では適切なRBACポリシーを設定してください
- Secretsは暗号化して管理してください
- 定期的にクラスタとノードのアップデートを行ってください

## 📚 参考リンク

- [GKE ドキュメント](https://cloud.google.com/kubernetes-engine/docs)
- [Kubernetes ドキュメント](https://kubernetes.io/docs/home/)
- [kubectl リファレンス](https://kubernetes.io/docs/reference/kubectl/)


memo

kubectl create serviceaccount firestore-app

serviceAccountName: demo-app # 作成した ServiceAccout の名前
