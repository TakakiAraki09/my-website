# my-website Repository Documentation

本リポジトリは、GCP上でのWebサイト運用を目的としたモノレポ構成のプロジェクトです。

## 🏗️ アーキテクチャ概要

- **Cloud Platform**: Google Cloud Platform (GCP)
- **Container Orchestration**: Google Kubernetes Engine (GKE)
- **Database**: NeonDB
- **Infrastructure as Code**: Terraform
- **Workspace Management**: pnpm + Turbo

## 📁 ディレクトリ構造

```
my-website/
├── applications/          # フロントエンド・Webアプリケーション層
├── packages/             # 共有ライブラリ・ユーティリティ
├── services/             # バックエンドサービス・API層
├── k8s/                  # Kubernetes デプロイメント設定
├── terraform/            # インフラストラクチャ管理
├── saas/                 # 外部SaaSサービス設定
└── ルート設定ファイル
```

## 🎯 各層の概念

### Applications Layer (`applications/`)
- Webアプリケーション
- フロントエンドコンポーネント
- ユーザーインターフェース

### Packages Layer (`packages/`)
- 共有ライブラリ
- ユーティリティ関数
- 型定義
- 設計システムコンポーネント

### Services Layer (`services/`)
- REST API
- GraphQL API
- バックエンドビジネスロジック
- データアクセス層

### Infrastructure Layer (`terraform/`)
- GKEクラスター定義
- ネットワーク設定
- DNS管理
- セキュリティ設定

### Deployment Layer (`k8s/`)
- Kubernetesマニフェスト
- サービス定義
- Ingress設定
- ConfigMap/Secret管理

### SaaS Integration (`saas/`)
- 外部サービス連携設定
- データベース設定（NeonDB）

## 🚀 開発環境セットアップ

### 前提条件
- Node.js 18+
- pnpm 10.9.0+
- Google Cloud CLI
- kubectl
- Terraform

### セットアップ手順

1. **依存関係のインストール**
   ```bash
   pnpm install
   ```

2. **GCP認証設定**
   ```bash
   gcloud auth login
   gcloud config set project my-website-464008
   ```

3. **インフラストラクチャのデプロイ**
   ```bash
   cd terraform
   terraform init
   terraform apply
   ```

4. **Kubernetesクラスター接続**
   ```bash
   gcloud container clusters get-credentials my-website-gke --region=asia-northeast1
   ```

## 🛠️ 開発コマンド

### Turbo使用コマンド
- `pnpm build` - 全プロジェクトのビルド
- `pnpm dev` - 開発サーバー起動
- `pnpm test` - テスト実行
- `pnpm lint` - コード品質チェック
- `pnpm typecheck` - 型チェック

### インフラ管理コマンド
- `terraform plan` - インフラ変更プレビュー
- `terraform apply` - インフラ適用
- `kubectl apply -f k8s/manifests/` - Kubernetesリソース適用

## 🌐 環境・リソース情報

### GCP Project
- **Project ID**: my-website-464008
- **Region**: asia-northeast1
- **Cluster**: my-website-gke

### Database
- **Provider**: NeonDB
- **Console**: https://console.neon.tech/app/projects/gentle-darkness-68702060

### Domain
- **Primary**: arakey.dev
- **Subdomain**: www.arakey.dev

## 📚 詳細ドキュメント

- [Kubernetes Configuration](./k8s/README.md)
- [Infrastructure Management](./terraform/README.md)
