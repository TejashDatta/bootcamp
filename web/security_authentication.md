# Web securityと認証

Password cracking:
* Dictionary attack
* bruteforce

DoS:
* SYN flood attack
* F5 attack

## Web systemの特徴を利用した攻撃

Session hijack: セッションクッキーを盗聴してそれでユーザーのなりすましでログインする。

Directory traversal: 相対パスを利用し、サーバー本体のディレクトリをアクセスしてサーバーのパスワードなどを取得。

## Web applicationの脆弱性を狙う攻撃

* XSS - Cross Site Scripting attack
* CSRF - Cross Site Request Forgery attack
* SQL injection

## Web system の脆弱性

Zero day attack: secuirty holeが修正された前の攻撃。

## Firewall

Packet filter firewall: packetの行先IPアドレスとポート番号によって通信制限する

IDS: Intrusion Detection System: 異常な通信の場合はシステム管理者に通知する
IPS: Intrusion Protection System:　異常な通信の場合には通信遮断する

検知方法：
* Signature型：以前登録していた攻撃パターンとマッチするか確認する
* Anomaly型：普通の通信と大きく違うか確認する

## WAF: Web Application Firewall

Packetの中身は悪意がない確認するfirewall

* Blacklist:　特定のデータを持つ通信を遮断する
* Whitelist: 登録したパータンの通信だけを認める

## 暗号化

暗号化の適用：
* 通信の盗聴を防ぐ
* 侵入したデータを漏れない

ハッシュ化：暗号化と似てるけど異なる点は復号を要らない際に使用する

## 公開鍵証明書

* HTTPS通信に使うための公開鍵の持ち主が誰なのかを証明する
* 公開鍵の持ち主が実在することを証明すること (実在証明)
