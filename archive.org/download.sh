#!/bin/bash
for i in {1..134}
do
	echo "Welcome $i times"
	flag=""
	flag=$(curl "https://archive.org/details/bstj-archives?&page="$i 2>&1 | grep 'No results matched your criteria')
	if [ -z "$flag" ]; then echo "continue"; else  echo "finish pages"; break;  fi
	curl "https://archive.org/details/bstj-archives?&page="$i 2>&1 | grep -oP '<a href="/details/\K(.*)(?=" title)' > link_list_$i.txt

	while read p; do
	  echo "$p"
	  links=""
	  links=$(curl https://archive.org/details/"$p" 2>&1 | grep -oP 'href="\K(.*)_text.pdf(?=" title)')
	  if [ -z "$links" ]; then echo "there is no *_text.pdf file. trying to download .pdf file"; curl https://archive.org/details/"$p" 2>&1 | grep -oP 'href="\K(.*).pdf(?=" title)' | wget "https://archive.org"{}; else wget "https://archive.org"$links; fi
	done <link_list_$i.txt
done
