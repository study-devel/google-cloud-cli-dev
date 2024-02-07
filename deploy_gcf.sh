#!/bin/bash

GOOGLE_APPLICATION_CREDENTIALS="./gcp_auth.json"

# 認証処理
gcloud auth activate-service-account --key-file=$GOOGLE_APPLICATION_CREDENTIALS

# Google Cloud のプロジェクトIDを設定
PROJECT_ID="gcp-devel-project"

# デプロイする関数の名前
FUNCTION_NAME="hello_world"
# 使用するランタイム（例: python39, nodejs12 など）
RUNTIME="python39"

# トリガーのタイプ（例: --trigger-http, --trigger-topic, --trigger-event など）
TRIGGER="--trigger-http"

# プロジェクトIDをセット
gcloud config set project $PROJECT_ID

# 関数をデプロイ
gcloud functions deploy $FUNCTION_NAME \
    --runtime $RUNTIME $TRIGGER \
    --allow-unauthenticated \
    --region=asia-northeast1 \
    --source=./src

echo "Function deployed successfully"
