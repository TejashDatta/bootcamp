#!/bin/bash

if [[ -d child-directory-a && -d child-directory-b ]]; then
  touch child-directory-a/test.txt
  cd child-directory-a
  mv test.txt ../child-directory-b
  cd ../child-directory-b
  mv test.txt ../
else
  echo "エラー：child-directory-aとchild-directory-bのディレクトリはなければなりません。"
fi