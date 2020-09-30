#!/bin/bash

#必修コマンドの利用例

#ps
ps aux --sort=-%mem
ps -ef --forest
ps -axf
ps -T
ps -u tejash
ps -U root -u root
ps -p 1357
ps -C xorg

#curl
curl -o vue-v2.6.10.js https://cdn.jsdelivr.net/npm/vue/dist/vue.js
curl -C - -O http://yourdomain.com/yourfile.tar.gz
curl www.google.com 

top
#オプションはプログラムが実行中入力する

#grep
grep string file1 file2
grep -r string *
grep -w word file1
grep -e string1 string2 file1 file2
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
find / -empty
find / -user tejash -print -exec echo {} >> user_files \;
find / -size +50M -size -100M
find /home/tejash/ -atime 30
find . mmin -60
find . \( -name filename1 -o -name filename2  \)

#chmod
chmod file 777
chmod file +x
chmod file a=r

#chown
chown tejash file 
chown user:group file

#&
ping google.com

#&&
mkdir temp && cd temp 