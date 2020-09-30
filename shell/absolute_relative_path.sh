#!/bin/bash

#コマンドライン引数にパスをとる

# if [[ ${1:0:1} == '/' ]]; then
FILE_PATH="$1"
if [[ $FILE_PATH == /* ]]; then
  echo "絶対パスです。"
else
  echo "相対パスです。"
fi