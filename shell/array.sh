#!/bin/bash

#配列の機能と演算を実践

FRUITS=('リンゴ' 'バナナ' '桃')

for FRUIT in "${FRUITS[@]}"; do
  echo "$FRUIT"
done

FRUITS[0]="ザクロ"
echo "${FRUITS[0]}"
echo "${#FRUITS[0]}"

#プシュ
FRUITS+=("スイカ")
FRUITS=("${FRUITS[@]}" "イチゴ")

echo "${FRUITS[-1]}"

echo "${FRUITS[@]}"
echo "${#FRUITS[@]}"

echo "${FRUITS[@]:2:3}"

unset FRUITS[1]
echo "${FRUITS[@]}"
echo "${!FRUITS[@]}"
echo "${#FRUITS[@]}"
echo "${FRUITS[1]}"




