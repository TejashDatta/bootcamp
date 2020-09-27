#!/bin/bash

for i in {1..10}
do
  if ((i % 2 == 0))
  then
    echo "$i is even"
   else
    echo "$i is odd"
  fi
done

#出力
: '
1 is odd
2 is even
3 is odd
4 is even
5 is odd
6 is even
7 is odd
8 is even
9 is odd
10 is even
'
