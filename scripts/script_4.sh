#!/bin/bash

cat ../books/books_noPunc.txt | tr '[:upper:]' '[:lower:]'  | tr -s '[:blank:]' '\n' | fgrep -vwf stopwords.txt > ../books/books_noPnoS.txt

echo Stop words remove finished
