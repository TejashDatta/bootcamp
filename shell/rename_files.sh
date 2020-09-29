#!/bin/bash

#Q) 今まで勉強した linux command を組み合わせたスクリプトを作成する（これまで勉強したものを組み合わせて）
#現在いるディレクトリのすべてのファイルの名前の前に順番に数をつけるスクリプトです

i=1
for FILE_NAME in *; do 
  if [[ -f $FILE_NAME ]]; then
    mv "$FILE_NAME" "$i-$FILE_NAME"
    i=$((i+1))
  fi
done