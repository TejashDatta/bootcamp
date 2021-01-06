# -r copy directory recursively

scp -r ~/Desktop/bootcamp/jquery/ajax tejash@192.168.29.133:/var/www/html/

# -v view detailed process information

scp -v ~/eg.txt tejash@192.168.29.133:~/Documents

# -C compress

scp -Cr ~/Desktop/bootcamp/jquery/ajax tejash@192.168.29.133:/var/www/html/

# -q quiet

scp -q ~/eg.txt tejash@192.168.29.133:~/Documents

# -l limit bandwidth in kilobits/s

scp -l 400 ~/eg.txt tejash@192.168.29.133:~/Documents

# preserve modification times, access times, and modes from original files

scp -p ~/eg.txt tejash@192.168.29.133:~/Documents
