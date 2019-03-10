#!/bin/bash

for i in $@; do
	cat ../books/$i | tr -d '[:punct:]' >> ../books/books_noPunc.txt
done

echo Remove Punctuation finished
