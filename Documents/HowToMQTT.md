
# MQTT

Google Cloud Platform (GCP) で IoT デバイスから MQTT を使用して Pub/Sub にデータを公開するプロセス

2023年8月にGoogle IoT Coreがサービス廃止されており、
clearbladeを代用する


**Google Cloud Pub/Sub の設定**

- GCP プロジェクトの作成: Google Cloud Console にアクセスし、新しいプロジェクトを作成します。
- Pub/Sub API の有効化: 作成したプロジェクトで Pub/Sub API を有効にします。
- トピックの作成: データを公開するトピックを作成します。
- サブスクリプションの作成: トピックからメッセージを受信するサブスクリプションを作成します。

 **IoT Core の設定**

 - IoT Core API の有効化: GCP コンソールで IoT Core API を有効にします。
 - デバイスレジストリの作成: IoT Core でデバイスレジストリを作成し、通信に使用する MQTT プロトコルを指定します。
 - デバイスの登録: デバイスをレジストリに登録し、認証情報を設定します。



### Pub/Sub API の有効化

```bash
gcloud services enable pubsub.googleapis.com
```

### トピックの作成

```bash
gcloud pubsub topics create [YOUR_TOPIC_NAME]
# sample
gcloud pubsub topics create iot_test_data
```

- temperature_data
- iot_test_data

トピックは、メッセージの送信先です。プロデューサーはトピックにメッセージを公開（publish）します。
トピックは、特定のタイプのメッセージやイベントをグルーピングするために使用され、
一つのトピックに対して複数のプロデューサーからメッセージが送信されることがあります。
トピック名は、そのトピックが何についてのものかを示すため、意味のある命名が推奨されます。


### サブスクリプションの作成

```bash
gcloud pubsub subscriptions create [YOUR_SUBSCRIPTION_NAME] --topic=[YOUR_TOPIC_NAME]
# sample
gcloud pubsub subscriptions create test_notification_service --topic=iot_test_data
```

サブスクリプションは、トピックに公開されたメッセージを受信するための仕組みです。
コンシューマーはサブスクリプションを作成し、トピックに公開されたメッセージを受信します。

例えば、トピックからのエラーメッセージを処理するサブスクリプションであれば error_message_processor などが適切です。
サブスクリプションが特定のサービスやアプリケーション専用である場合は、
その名前をサブスクリプション名に含めることで、どのサービスがそのサブスクリプションを使用しているのかを容易に識別できます。
例: user_notification_service

### IoT Core API の有効化

```bash
gcloud services enable cloudiot.googleapis.com
```
