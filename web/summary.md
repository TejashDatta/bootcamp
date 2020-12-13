## Webとは

webpage がhypertextで作られ、hyperlinkで他のwebpageとつながれている。いつも新しいページがつながれているのでweb全体が大きくなるばかり。

## インターネットとWeb

Webは情報をシェアするソフトウェアシステムとして発明された。
インターネットは通信方式として発明された。

## HTMLとWeb browser

WebpageのhypertextはHTMLで記述する。HTMLの要素をタグで記述する。Web browser がHTMLを解釈してweb pageを表示する。

## WebサーバーとHTTP

Web browserがweb serverからコンテンツの要求する際webサーバーがHTTPのルールに従って対応を配信する。

## Web ページの表示される流れ

取得したいページをbrowserに指定する。それにやり取りの手順、サーバーのアドレス、見たいリソースの名前は含まれている。ページをもらってまたページの中に画像のようなコンテンツを要求する。

## 静的ページと動的ページ

静的ページはいつも同じコンテンツを表示する、動的ページは状態によって表示が異なる。

## 動的ページの仕組み

CGI：CGIによってサーバーサイドスクリプトを実行する

## Webの標準化

Webの技術に機能追加には標準規格の必要がある。バラバラ状態だと製作者とウェブブラウザが困難する。標準規格はW3C によって定めらる。

## Webの設計思想

RESTful:このようなAPIはstatelessだから設計しすい。インターフェースも簡単。
Semantic web: ウェブページに登場する情報についてメタデータを用意すればそのページはマシンにも読めるようになる。

## インタネットの標準プロトコル

プロトコルはコンピューター間の通信の決まり。
TCP/IP：インタネットと接続、それに関する機能を提供するプロトコル

## TCP/IP

Application layer: アプリケーションのやり取りを規定したり、転送ためデータの変換と分割したりする。

TCPとUDPの差：TCPは転送後確認する、UDP が確認しない。

## IP Address and Port Number

IP Address: インタネット上コンピューターを識別する番号
ポート番号：IPアドレスであるサービスを指定する

## URL and Domain

URL (Uniform Resourse Locater)：インタネット上取得したいサイトやファイルを指定する文字列

Domain: IP address の代わりに使える文字列

Domain name & host nameの差：ドメイン名はネットワークを指定する、ホストな名はネットワークのコンピューターを指定する

FQDN (Fully Qualified Domain Name): host name + domain name

## DNS

ドメイン名をIPアドレスに変換してだけからサイトをアクセスできる。その変換はDNS (Domain Name Service)が行う。DNSサーバーが階層的に名前解決する。

# HTTPでやり取りする仕組み

サーバーとブラウザはHTTPメッセージを使用して通信します。
メッセージの種類：HTTP request, HTTP response

## Message header

General header field vs entity header field: 一般ヘッダーフィールドはメッセージ全体に関する、entity header field はmessage bodyに関する。

## TCPによるデータ通信

接続確立 3 way handshake:
1. クライアントがSYNパッケージ（接続要求）を送る
2. サーバーがACKパッケージとSYNパッケージを送る
3. クライントがACKパッケージを送る

## HTTP/1.1 のやりとり

HTTP keep-alive: 送信後接続を切断しないので毎度接続確立ことを省く
HTTP pipeline: http requestのレスポンスを待つことなく継続的にリクエストを送る

## HTTP/2のやりとり

仮想的なストリームを通してできるからhttp pipelineのように複数のリクエストが順番通りにレスポンスされるという制限がない。

## HTTP/2の改良点

バイナリ形式：HTTPレスポンスはフレームに分けてバイナリ形式でストリームに送らる

ヘッダー圧縮：毎度ヘッダーにある重複したデータを省いて、差分のみを送る

サーバープッシュ：クラインとが要求する事前、必要だと判断したファイルを送信する

## HTTPSの仕組み

盗聴防止：暗号化通信
改ざん防止：メッセージダイジェストでハッシュを確認
なりすまし防止：SSLサーバー証明書を検証
