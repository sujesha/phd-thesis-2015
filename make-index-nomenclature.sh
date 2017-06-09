#!/bin/sh

if [ $# -ne 1 ]
then
	echo "Usage: $0 <thesis|synopsis>"
	exit
fi

if [ "$1" != "thesis" -a "$1" != "synopsis" ]
then
	echo "Usage: $0 <thesis|synopsis>"
	exit
fi

name=$1


makeindex "$name"
makeindex "$name".nlo  -s nomencl.ist -o "$name".nls
bibtex "$name"
makeindex "$name"
makeindex "$name".nlo  -s nomencl.ist -o "$name".nls
bibtex "$name"
bibtex "$name"
xelatex "$name".tex

makeindex "$name"
makeindex "$name".nlo  -s nomencl.ist -o "$name".nls
bibtex "$name"
makeindex "$name"
makeindex "$name".nlo  -s nomencl.ist -o "$name".nls
bibtex "$name"
bibtex "$name"
xelatex "$name".tex
