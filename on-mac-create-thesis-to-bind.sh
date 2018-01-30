#!/bin/sh

set -x

# Building final IITB PhD pdf
rm -rf thesis-for-bind.pdf separated-title-page.pdf tmp

num_pages=$(pdfinfo thesis.pdf | grep Pages | awk '{print $2}')
pdfseparate thesis.pdf -f 1 -l 1 separated-title-page.pdf
mkdir tmp
pdfseparate thesis.pdf -f 3 -l $num_pages tmp/separated-abstract-onwards%03d.pdf
cd tmp ; pdfunite `ls | sort` separated-abstract-onwards.pdf ; cd ..

pdfunite separated-title-page.pdf sujesha-thesis-blank-page.pdf sujesha-thesis-dedication.pdf sujesha-thesis-blank-page.pdf sujesha-thesis-approval-signed-dated.pdf sujesha-thesis-blank-page.pdf sujesha-thesis-declaration-signed-dated.pdf sujesha-thesis-blank-page.pdf tmp/separated-abstract-onwards.pdf thesis-to-bind.pdf
