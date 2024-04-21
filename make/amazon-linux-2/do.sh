#!/usr/bin/env bash

wget https://ftp.gnu.org/gnu/make/make-4.4.tar.gz
tar xvf make-4.4.tar.gz
cd make-4.4
./configure && make && sudo make install
cd ..
rm -rf make-4.4.tar.gz make-4.4
