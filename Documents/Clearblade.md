

https://iot.clearblade.com

To create your new IoT Core project, you will need to connect an existing Google Cloud Service account. Learn more


CLEARBLADEを使用するためには、まずGoogle Cloudのプロジェクトを作成する必要があります。そのプロジェクトに関連するGoogle Cloud Serviceアカウントを持っている必要があります。これは、CLEARBLADEプラットフォームがGoogle Cloudのリソースやサービスにアクセスするために使用されるからです。


## Cloud Resource Manager APIを有効にする

```
gcloud services enable cloudresourcemanager.googleapis.com
```

ClearBlade IoT Coreがサービスアカウントが必要とするロールを持っていることを確認するために使用されます。

## Google Cloud サービスのアカウントを作成する

サービスアカウントはGoogle Cloudリソースへのアクセスと操作を行うための特別なアカウントです。
これはClearBladeがGoogle Cloudのリソースを安全に使用できるようにするためのものです。


1. Google Cloud Consoleにログイン: Google Cloud Consoleにアクセスし、ログインします。(https://console.cloud.google.com)
2. Google Cloudプロジェクトを選択します。
3. 「IAMと管理」セクションへ移動し、サービスアカウント」をクリックします。
4. 「サービスアカウントを作成」ボタンをクリックします。
5. サービスアカウントの詳細を入力:
   - サービスアカウント名とサービスアカウントIDを入力します（IDは自動で生成されますが、必要に応じて変更できます）。
   - オプションで、サービスアカウントの説明を追加します。
   - サンプル:clearblade_iot_dev_user (clearbladeとの連携するアカウント)
   - 「作成と続行」をクリック。
6. サービスアカウントにロールを割り当てる
    - Cloud IoT Viewer(Cloud Iot 閲覧者)
      - cloudiot.devices.list
      - cloudiot.registries.get
      - cloudiot.registries.list
    - Pub/Sub Editor(Pub/Sub 編集者)
      - pubsub.topics.list
      - pubsub.topics.publish
    - Logs Writer(ログ書き込み)
      - logging.logEntries.create
    - Monitoring Metric Writer(モニタニング指標の書き込み)
      - monitoring.metricDescriptors.create
      - monitoring.timeSeries.create
    - Monitoring Viewer(モニタニング閲覧者)
      - monitoring.timeSeries.list
7. サービスアカウントのJSONキーをダウンロードする
    -  サービスアカウントの選択
    -  キータブを選択して、キーを追加 >「新しいキーを作成」> JSON
    -  
8. 


コマンドでサービスアカウントを作成する場合

```bash
gcloud iam service-accounts create [SERVICE_ACCOUNT_ID] --description="[DESCRIPTION]" --display-name="[DISPLAY_NAME]"

# gcloud projects add-iam-policy-binding [PROJECT_ID] --member="serviceAccount:[SERVICE_ACCOUNT_ID]@[PROJECT_ID].iam.gserviceaccount.com" --role="[ROLE]"

gcloud projects add-iam-policy-binding [PROJECT_ID] --member="serviceAccount:[SERVICE_ACCOUNT_ID]@[PROJECT_ID].iam.gserviceaccount.com" --role="roles/cloudiot.viewer"
gcloud projects add-iam-policy-binding [PROJECT_ID] --member="serviceAccount:[SERVICE_ACCOUNT_ID]@[PROJECT_ID].iam.gserviceaccount.com" --role="roles/pubsub.editor"
gcloud projects add-iam-policy-binding [PROJECT_ID] --member="serviceAccount:[SERVICE_ACCOUNT_ID]@[PROJECT_ID].iam.gserviceaccount.com" --role="roles/logging.logWriter"
gcloud projects add-iam-policy-binding [PROJECT_ID] --member="serviceAccount:[SERVICE_ACCOUNT_ID]@[PROJECT_ID].iam.gserviceaccount.com" --role="roles/monitoring.metricWriter"
gcloud projects add-iam-policy-binding [PROJECT_ID] --member="serviceAccount:[SERVICE_ACCOUNT_ID]@[PROJECT_ID].iam.gserviceaccount.com" --role="roles/monitoring.viewer"

```

## Registries」（レジストリ）の登録

ClearBlade IoT Coreや他のIoTプラットフォームにおける「Registries」（レジストリ）は、
デバイスやその他のIoTエンティティを管理するための仕組みです。

IoTデバイスのグループを組織化し、それらに共通の設定やポリシーを適用するためのコンテナのようなものと考えることができます。
Registriesを使用することで、複数のデバイスを一元的に管理し、セキュリティポリシーやアクセス権限、デバイス間の通信設定などを効率的に適用することが可能になります。


