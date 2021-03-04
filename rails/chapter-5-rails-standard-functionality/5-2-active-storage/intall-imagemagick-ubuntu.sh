sudo apt update
sudo apt-get install build-essential

wget https://www.imagemagick.org/download/ImageMagick.tar.gz
tar xvzf ImageMagick.tar.gz

cd ImageMagick-7.0.11-2/
./configure
make
sudo make install
sudo ldconfig /usr/local/lib

magick -version
