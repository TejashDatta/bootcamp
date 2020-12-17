## 3 layer architecture

presentation layer (browser & serverで行う), application layer, data layer

## MVC

Model, View, Controller

application層だけに属する

## Framework

Framework の機能を活かしてチーム開発を統一できる。

## Web server

web serverの役割はクライアイントからのリクエストを受け、静的ページまたはAP層による動的ページを送信する。

## Application server

役割：
* server side scriptを実行
* session管理
* transaction管理

## DBMS

冗長化ためデータの同期方法：
* mirroring: mirror serverで同じ変更命令を実行
* replication: slaver serverは変更履歴をmasterから受け、mirroringのように直ちに変更が不要
* shared disk：DBMSサーバーが同じdiskを共有からそれの信頼性が高い必要

## Cache server

Webサーバーにたくさん同じリクエストが来ると負担がかかるからキャッシュサーバーを使えばまずキャッシュが応答しようとする

Content cache server:　静的サイトのデータ

Query cache server:　DBMSに求めた同じクエリ

CDN (Content Delivery Network):　全体が一つとして応答する

## AJAX

AJAX: Asynchronous Javascript And XML

AJAXで非同期通信してサイトの読み込みを早くできる。

## Web API

API を通してプログラム同士がウェブサービスを使える。

## Mashup

複数のAPIサービスを組み合わせて新しいサービス。

## CGI

CGIでweb serverでserver side scriptを実行する仕組みです。

引数方法：
* command line parameters
* path parameters
* GET & POST parameters

## Server 間の連携

クライアイント・サーバー連携であり、プロトコルをHTTPだけでなく自由に他のも使用できる。
