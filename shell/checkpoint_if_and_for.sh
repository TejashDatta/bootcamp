#!/bin/bash

#for文とif文を使用して下限と上限の間に数値ごとは偶数か奇数かと示すプログラムです。

echo "下限と上限を入力してください："
read LOWER_LIMIT UPPER_LIMIT

if [[ $LOWER_LIMIT -gt $UPPER_LIMIT ]]
then
  echo "エラー：下限は上限より高いです。"
  exit
fi

#for ((i = $LOWER_LIMIT; i <= $UPPER_LIMIT; i++))
for i in $(seq $LOWER_LIMIT $UPPER_LIMIT)
do
  if ((i % 2 == 0))
  then
    echo "$iは偶数です。"
   else
    echo "$iは奇数です。"
  fi
done

