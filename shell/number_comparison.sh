#!/bin/bash

#数値の比較

echo "2つの数値を入力してください："
read NUMBER1 NUMBER2

#比較の演算子： -gt -ge -lt -le -eq -ne
if [[ $NUMBER1 -gt $NUMBER2 ]]
then
  echo "$NUMBER1は$NUMBER2より大きいです。"
#数値の比較の別の方法の試し
elif (( $NUMBER1 < $NUMBER2 ))
then
  echo "$NUMBER2は$NUMBER1より大きいです。"
else
  echo "両方は等しいです。"
fi
