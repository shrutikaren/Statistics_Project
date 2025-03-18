#!/bin/bash 

echo "Entering into the data source..."
URL="https://www.gutenberg.org/cache/epub/1661/pg1661.txt"

echo "Downloading the data source into text file ..."
curl -s "$URL" -o raw_text.txt

echo "Preprocessing the data source ..."
sed -n '/^\*\*\* START OF/,/^\*\*\* END OF/ p' raw_text.txt > input.txt 

tr '[:upper:]' '[:lower:]' < input.txt | tr -d '[:punct:]' > clean_text.txt

echo "Text fetched and cleaned ..."
