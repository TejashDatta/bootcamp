#!/bin/bash

if [[ -z $1 ]]; then
cat << END

使い方：./organise <必修：ディレクトリ>
ディレクトリにあるファイルをファイルタイプによって子ディレクトリに整理します。

END
  exit 1
fi

if [[ ! -d $1 ]]; then
  echo "エラー：$1はディレクトリではありません。"
  exit 2
fi

DIRECTORY=$1
[[ $DIRECTORY != */ ]] && DIRECTORY="${DIRECTORY}/"

for FILE in $DIRECTORY*; do
  if [[ -f $FILE ]]; then 
    FILE_TYPE=$( file -b --mime-type "$FILE" | cut -d "/" -f1)
    mkdir -p "$DIRECTORY$FILE_TYPE"
    mv "$FILE" "$DIRECTORY$FILE_TYPE"
  fi
done