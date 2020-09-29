#!/bin/bash

case "$1" in
  ok)
    echo "引数はokでした。" > ok.txt
  ;;
  ng)
    echo "引数はngでした。" 2> ng.txt >&2
  ;;
  *)
    echo "コマンドライン引数が不敵です。"
  ;;
esac