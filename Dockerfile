# 基本イメージとして Google Cloud SDK の公式イメージを使用
FROM google/cloud-sdk:latest

# 必要に応じて追加のパッケージやツールをインストール
# 例: Git, Node.js 等
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    git \
    && rm -rf /var/lib/apt/lists/*

# Google Cloud SDK の設定
# 必要に応じて gcloud コマンドを使用して設定

# 作業ディレクトリの設定
WORKDIR /app

# アプリケーションのソースコードをコピー
COPY . /app

# エントリポイントを設定（任意）
# ENTRYPOINT ["/bin/bash"]