# google-cloud-cli-dev

Google Cloud 学習用

## Repository

- https://github.com/study-devel/google-cloud-cli-dev
- https://appj.pglikers.com/gitbucket/git/develop/google-cloud-cli-dev.git


## Build


```bash
docker exec -it gcp-sdk bash
```


```bash
gcloud --version
```
---

Google Cloud SDKの初期設定

```bash
gcloud init
```

Google Cloud SDKの初期設定を行います。プロジェクトの選択、認証情報の設定などを行うことができます。

- dev.p.ry.yamafuji@gmail.com
- projectname:gcp-devel-project

--- 

 ブラウザを使用してGoogleアカウントでログインし、認証情報を設定します。

```bash
# ログインする
gcloud auth login
# 現在のユーザー情報を表示
gcloud auth list
```

--- 

デフォルトのプロジェクトを設定します。

```bash
gcloud config set project [PROJECT_ID]
# 現在の設定されているプロジェクトを取得する
gcloud config list project
```

--- 

設定値を確認する

```bash
gcloud config list
```

--- 


Compute Engineのインスタンスをリスト

```bash
gcloud compute instances list
```

エラーが表示される場合

```
API [compute.googleapis.com] not enabled on project [gcp-devel-project]. Would you like to enable and retry (this will take a few minutes)? (y/N)?  y
```

APIが有効化されていないので表示されるので有効化する必要があります。
請求情報が紐づいていないと利用できません(WEBブラウザから設定する必要があります)

(https://console.cloud.google.com/)


## 料金を表示する方法

Cloud Billing APIを利用する


## Google Cloud Functions (GCF) を作成する

gcloud functions deploy FUNCTION_NAME --runtime RUNTIME --trigger-http --allow-unauthenticated

FUNCTION_NAME: 関数の名前。
RUNTIME: 使用するランタイムの指定（例: nodejs10, python3.7 など）。
--trigger-http: HTTP トリガーを使用して関数を呼び出すことを指定します。
--allow-unauthenticated: 認証されていない（匿名の）リクエストによる関数の呼び出しを許可します。

```bash
gcloud functions deploy hello_world     --runtime python39     --trigger-http     --allow-unauthenticated     --region=asia-northeast1 
```

gcloud services enable cloudfunctions.googleapis.com --project=gcp-devel-project

```
gcloud functions deploy hello_world \
    --runtime python39 \
    --trigger-http \
    --allow-unauthenticated \
    --region=asia-northeast1 


gcloud functions deploy hello_world \
    --runtime python39 \
    --trigger-http \
    --allow-unauthenticated \
    --region=us-central1

gcloud functions deploy hello_world \
    --runtime python39 \
    --trigger-http \
    --allow-unauthenticated \
    --region=asia-northeast1 \
    --source=./path/to/your/function/folder
```

---

## サービス

### Cloud Run

Cloud Runは、完全にマネージドされたプラットフォームで、ステートレスコンテナをデプロイし、実行することができます。イベント駆動型アプリケーションやWebサービスに適しており、使用した分だけの課金が特徴です。コードをコンテナ化し、Cloud Runにデプロイすることで、自動的にスケーリングし、HTTPSエンドポイントを通じてアクセスできます。

## Git Action

### ユーザーの権限が必要

「Personal access tokens」に進んで、新しいトークンを生成するか、既存のトークンを編集します。
「Select scopes」セクションで、workflowスコープのチェックボックス

on: 、ワークフローをトリガーするイベントを指定します

 - workflow_dispatch: GUIから手動でワークフローをトリガーしたい場合
 - push: リポジトリにプッシュされたときにワークフローをトリガーします。
 - pull_request: プルリクエストが作成、更新、閉じられたとき、または特定のアクションが行われたときにトリガーします。
 - schedule: CRONスケジュールに基づいてワークフローを定期的にトリガーします。
 - repository_dispatch: 外部イベントに基づいてワークフローをトリガーするために使用します。

runs-on:

 - ubuntu-latest
 - ubuntu-20.04
 - windows-latest
 - windows-2019
 - macos-latest

ワークフローのジョブが実行されるランナーの種類を指定します。
GitHubは複数の仮想環境を提供しており、ubuntu-latestの他にも、WindowsやmacOSなど、さまざまなオペレーティングシステムのバージョンがサポートされています。

### Run actions/checkout@v2

GitHub Actionsのワークフロー内で使用されるアクションの一つで、
GitHubリポジトリのコードをチェックアウト（つまり、ワークフローが実行される仮想環境にコピー）するためのものです。
このアクションを使用することで、
ワークフローがリポジトリ内のコードにアクセスし、ビルド、テスト、デプロイメントなどのさまざまな操作を実行できるようになります。