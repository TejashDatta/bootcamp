# Web applicationの基本

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
