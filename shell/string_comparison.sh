#!/bin/bash

#文字列の比較

read -p "一番目の文字列を入力してください： " STRING1
read -p "二番目の文字列を入力してください： " STRING2

if [[ -z $STRING1 || -z $STRING2 ]]
then
  echo "エラー：文字列をちゃんと入力してください。"
  exit
fi

if [[ $STRING1 == $STRING2 ]]
then
  echo "文字列は等しいです。"
else
  echo "文字列が異なる。"
fi
