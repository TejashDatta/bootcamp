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

## SSL/TLS Handshake

1. 暗号方式の決定
2. 通信相手の証明（SSLサーバーから証明書を確認）
3. 鍵の交換
4. 暗号方式の確認

## Stateful and Stateless

HTTPはstateless。事前の状態を覚えていない。
Statefulの場合はクライアントの状態を保持するのは便利ですがサーバーは多対1で複数のクライアントの状態を覚えるのは負担です。

HTTPの処理に状態保持が必要とすれば補助的な技術は使用される。

## Cookie

Cookieはクライアントの状態を保持し管理することで使用される。例えばブラウザを識別するクッキー。

## Session

一連の処理に保持した状態を使いたい場合にセッションを使用する。セッションIDでクライアントを識別し、セッションデータを参照できる。

## URI

URI: Uniform Resource Indentifier

URL: Uniform Resource Locator

URN: Uniform Resource Name

Percent encoding: 非予約文字でないと予約文字がpercent encodingに変換される。
