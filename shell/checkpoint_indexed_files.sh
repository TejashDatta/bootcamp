#!/bin/bash

NUMBER=$1

if [[ $1 == 0 || ! $1 =~ ^[0-9]+$ ]]; then
  echo "0以上の整数だけを入力してください。"
  exit 1
fi

mkdir out
cd out
for i in $(seq "$NUMBER"); do
  NEW_DIRECTORY=dir-$i
  mkdir "$NEW_DIRECTORY"
  cd "$NEW_DIRECTORY"
  for j in $(seq $i); do
    touch "file-$j"
  done
  cd ..
done