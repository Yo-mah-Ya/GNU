#!/usr/bin/env bash

mkdir -p ~/tmp/glibc && cd ~/tmp/glibc
wget --no-check-certificate https://ftp.gnu.org/gnu/glibc/glibc-2.33.tar.xz
tar -xvf glibc-2.33.tar.gz
cd glibc-2.33
mkdir build && cd build
../configure --prefix=/usr --disable-profile --enable-add-ons --with-headers=/usr/include --with-binutils=/usr/bin
make && sudo make install


## Tips
## If you face an error that says "Cannot find -lnss_nisplus", then go to below website to get workaround.
# https://www.linuxquestions.org/questions/linux-from-scratch-13/book-8-4-%7C-section-6-9-glibc-2-29-make-error-cannot-find-lnss_nisplus-4175660125/#google_vignette
