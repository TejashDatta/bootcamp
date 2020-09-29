#!/bin/bash

if [[ ! ( -d child-directory-a && -d child-directory-b ) ]]; then
  echo "エラー：child-directory-aとchild-directory-bのディレクトリはなければなりません。"
  exit 1
fi

touch child-directory-a/test.txt
cd child-directory-a
mv test.txt ../child-directory-b
cd ../child-directory-b
mv test.txt ../