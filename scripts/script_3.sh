#!/bin/bash

cat ../books/books_noPunc.txt | tr -c '[:alnum:]' '[\n*]' | tr '[:upper:]' '[:lower:]'  | tr -s '[:blank:]' '\n' |  sort | uniq -c | sort -nr | head  -20 > ../books/freq.txt

echo frequency analysis finished
