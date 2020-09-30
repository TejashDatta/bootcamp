#!/bin/bash

if [[ $1 == 0 || ! $1 =~ ^[0-9]+$ ]]; then
  echo "0以上の整数だけを入力してください。"
  exit 1
fi

mkdir out
for i in $(seq $1); do
  mkdir "out/dir-$i"
  for j in $(seq $i); do
    touch "out/dir-$i/file-$j"
  done
done