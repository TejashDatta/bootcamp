#!/bin/bash

#必修コマンドの利用例

#ps
ps aux --sort=-%mem
ps -ef --forest
ps -a
ps -T
ps -t tty1
ps -u tejash
ps -U root -u root
ps -p 1357
ps -C Xorg

#curl
curl -o vue-v2.6.10.js https://cdn.jsdelivr.net/npm/vue/dist/vue.js
curl -C - -O http://yourdomain.com/yourfile.tar.gz
curl www.google.com 

top
#オプションはプログラムが実行中に入力する。例えばe, m, zなど

#grep
grep string file1 file2
grep -r string directory
grep -w word file
grep -x line file
grep -e string1 -e string2 file1 file2
grep -i string_case_insensitive file
grep -n -C 2 string *
ls | grep file_in_list

#tail
tail +5 file
tail -5 file
tail -c 6 file
tail -q file1 file2 file3
tail -v file
tail -f logfile

#find
find . -type f -name filename
find . -type d -name directory
find ~ -type d -empty
find . -type f ! -empty -user tejash -print -exec cat {} > user_content \;
find ~ -size +50M -size -100M
find -atime 30
find . mmin -60
find . \( -name filename1 -o -name filename2  \) -exec cat {} > concatenated_file \;

#chmod
chmod file 777
chmod file +x
chmod file a=r
chmod file g-w

#chown
chown tejash file 
chown user:group file

#&
ping google.com &

#&&
mkdir temp && cd temp
