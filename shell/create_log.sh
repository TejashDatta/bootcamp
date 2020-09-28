#!/bin/bash

#Q)今まで勉強した以外の linux command を組み合わせたスクリプトを作成する
#自動的に今日の日にちを名前としてログファルとディレクトリを作るスクリプトです

FOLDER_NAME=$(date +'%Y%m')
FILE_NAME=$(date +'%Y%m%d')

if [[ ! -d $FOLDER_NAME ]]; then
  mkdir $FOLDER_NAME
fi

touch "$FOLDER_NAME/$FILE_NAME.txt"