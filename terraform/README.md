# Infrastructure Layer - Terraform Configuration

このディレクトリにはWebサイトのインフラストラクチャを管理するTerraform設定が含まれています。

## アーキテクチャ概要

このインフラストラクチャは以下のGoogle Cloudリソースを作成・管理します：

- **Network Infrastructure**
  - VPC ネットワーク (`my-website-network`)
  - サブネット (`my-website-subnetwork`) - IPv4/IPv6デュアルスタック対応
  - セカンダリIPレンジ（Pods用、Services用）

- **DNS Management**
  - DNS管理ゾーン (`arakey.dev`)
  - DNSレコード (`www.arakey.dev`)

- **Kubernetes Cluster**
  - GKE Autopilotクラスター (`my-website-gke`)
  - asia-northeast1リージョンにデプロイ

## 前提条件

### 必要なツール
- [Terraform](https://www.terraform.io/downloads.html) v1.0以上
- [Google Cloud CLI](https://cloud.google.com/sdk/docs/install)
- 有効なGoogle Cloudプロジェクト

### 必要なAPI
以下のGoogle Cloud APIを有効化してください：
```bash
gcloud services enable compute.googleapis.com
gcloud services enable container.googleapis.com
gcloud services enable dns.googleapis.com
```

## セットアップ手順

### 1. 認証設定

Google Cloudアカウントにログインし、アプリケーションデフォルト認証を設定：

```bash
gcloud auth login
gcloud auth application-default login
```

### 2. プロジェクト設定

デフォルトプロジェクトを設定：

```bash
gcloud config set project my-website-464008
```

### 3. Terraform初期化

```bash
terraform init
```

### 4. プランの確認

インフラストラクチャの変更内容を確認：

```bash
terraform plan
```

### 5. インフラストラクチャのデプロイ

```bash
terraform apply
```

実行後、DNSネームサーバーの情報が出力されます。この情報をドメインレジストラで設定してください。

## 設定のカスタマイズ

### 変数設定

`infrastructure/variables.tf`で以下の変数をカスタマイズできます：

- `project`: Google CloudプロジェクトID（デフォルト: `my-website-464008`）
- `region`: デプロイ先リージョン（デフォルト: `asia-northeast1`）

### カスタム設定例

変数を上書きする場合は、`terraform.tfvars`ファイルを作成：

```hcl
project = "your-project-id"
region  = "us-central1"
```

## GKEクラスターへの接続

インフラストラクチャのデプロイ後、kubectlでクラスターに接続：

```bash
gcloud container clusters get-credentials my-website-gke --region=asia-northeast1
```

## DNSの設定

1. `terraform apply`実行後に出力されるネームサーバー情報を確認
2. ドメインレジストラ（arakey.devの管理画面）でネームサーバーを設定
3. DNS伝播を待機（最大48時間）

## ネットワーク構成

### IPアドレス範囲
- **プライマリサブネット**: `10.0.0.0/16`
- **Servicesセカンダリレンジ**: `192.168.0.0/24`
- **Podsセカンダリレンジ**: `192.168.1.0/24`

### IPv6サポート
- 外部IPv6アクセスが有効
- デュアルスタック構成

## モニタリングとメンテナンス

### リソースの確認
```bash
# クラスターの状態確認
gcloud container clusters describe my-website-gke --region=asia-northeast1

# DNSゾーンの確認
gcloud dns managed-zones describe arakey-dev

# ネットワークの確認
gcloud compute networks describe my-website-network
```

### コスト管理
- GKE Autopilotは使用したリソース分のみ課金
- 不要な場合は`terraform destroy`でリソースを削除

## トラブルシューティング

### よくある問題

**1. 認証エラー**
```bash
gcloud auth application-default login
```

**2. API未有効エラー**
```bash
gcloud services enable compute.googleapis.com container.googleapis.com dns.googleapis.com
```

**3. 権限エラー**
- Google CloudコンソールでIAM権限を確認
- Editor以上の権限が必要

**4. DNS伝播の遅延**
- DNS設定後、伝播に時間がかかる場合があります
- `dig www.arakey.dev`で確認

## クリーンアップ

インフラストラクチャを削除する場合：

```bash
terraform destroy
```

**注意**: この操作は取り消せません。実行前に重要なデータのバックアップを確認してください。

## 参考資料

- [GKE Terraform クイックスタート](https://cloud.google.com/kubernetes-engine/docs/quickstarts/create-cluster-using-terraform?hl=ja)
- [Terraform Google Provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs)
- [GKE Autopilot](https://cloud.google.com/kubernetes-engine/docs/concepts/autopilot-overview)
