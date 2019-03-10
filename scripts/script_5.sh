#!/bin/bash

cat ../books/books_noPunc.txt | tr '[:upper:]' '[:lower:]'  | tr -s '[:blank:]' '\n' | fgrep -vwf stopwords.txt | sort | uniq -c | sort -nr | head  -20 > ../books/freq_noS.txt

echo Frequency Count Finished
