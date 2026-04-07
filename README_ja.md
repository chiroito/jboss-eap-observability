# JBoss EAP Observability Demo

このデモは、JBoss EAP 8.1 を使って Observability を確認するためのサンプルです。  
JBoss EAP 単体の構成と、JBoss EAP 8.1 に XP 6.0 を組み合わせた構成の両方を用意しています。

JBoss EAP 単体の構成では、アプリケーションサーバが標準で提供する Observability 情報を確認できます。  
JBoss EAP 8.1 + XP 6.0 の構成では、それに加えて、アプリケーション開発者がメトリクスやスパンを追加した場合の動作も確認できます。

このデモは、ローカル環境では Podman Compose を使って起動でき、OpenShift へデプロイして実行することもできます。


<img src="img/trace.png" width="600">
<img src="img/log.png" width="600">
<img src="img/metrics.png" width="600">
<img src="img/profiling.png" width="600">

## 想定している使い方

このデモは、次のような目的で利用できます。

* JBoss EAP における Observability の基本動作を確認する
* JBoss EAP 単体構成と XP 追加構成の違いを比較する
* アプリケーションサーバが提供する情報と、アプリケーション開発者が追加する情報の違いを確認する
* Podman Compose 上で手元ですばやく動作確認する
* OpenShift 上で動作確認する

## このデモで確認できること

このデモでは、以下の Observability 機能を扱います。

- Health Check
- Metrics
- Tracing
- Log
- Profiling

各機能の実装方針は次のとおりです。

- **Health Check**  
  Eclipse MicroProfile Health を利用します。

- **Metrics**  
  JBoss EAP 単体の構成では Eclipse MicroProfile Metrics を利用します。  
  JBoss EAP 8.1 + XP 6.0 の構成では Micrometer を利用します。

- **Tracing**  
  OpenTelemetry を利用します。  
  JBoss EAP 単体の構成では Java Agent として OpenTelemetry を追加します。  
  JBoss EAP 8.1 + XP 6.0 の構成では、XP が提供する機能を利用します。

- **Log**  
  Unified JVM Logging により GC ログを取得します。

- **Profiling**  
  JDK Flight Recorder を利用します。

## 構成の違い

### JBoss EAP 8.1 単体
この構成では、主にアプリケーションサーバ自身が提供する情報を確認できます。  
追加のアプリケーション実装なしで、サーバ側の Health Check、Metrics、Tracing、Log、Profiling を観察するための構成です。

### JBoss EAP 8.1 + XP 6.0
この構成では、アプリケーションサーバが提供する情報に加えて、開発者がアプリケーションコードからメトリクスやスパンを追加できます。  
そのため、サーバ観点だけでなく、アプリケーション観点の Observability を確認したい場合に適しています。

## デプロイ方法

このデモは、以下の方法で実行できます。

- Podman Compose
- OpenShift

## Podman Compose で実行する

### JBoss EAP 8.1 on Podman Compose

JBoss EAP 単体の構成を起動する場合は、以下を実行します。

```shell
podman compose up -d
````

停止する場合は以下を実行します。

```shell
podman compose down
```

### JBoss EAP 8.1 + XP 6.0 on Podman Compose

JBoss EAP 8.1 + XP 6.0 の構成を起動する場合は、以下を実行します。

```shell
podman compose -f docker-compose-xp.yaml up -d
```

停止する場合は以下を実行します。

```shell
podman compose -f docker-compose-xp.yaml down
```

## アクセス先

Podman Compose でデプロイした場合、アプリケーションには以下の URL でアクセスできます。

* [http://localhost:8080](http://localhost:8080)

## OpenShift で実行する（未実装）

このデモは OpenShift にデプロイして実行することもできます。
OpenShift 環境では、Route や公開 URL は環境に応じて異なります。
具体的なデプロイ手順やアクセス方法は、OpenShift 向けのマニフェストや手順書を参照してください。



## 補足

JBoss EAP 単体構成と XP 追加構成では、利用する仕様や実装方法が一部異なります。
特に Metrics と Tracing は構成によって使用技術が異なるため、どの構成で何を確認したいのかを意識して使い分けてください。
