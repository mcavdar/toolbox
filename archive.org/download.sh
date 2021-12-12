# it downloads only first page, need to expand with page numbers
curl https://archive.org/details/bstj-archives 2>&1 | grep -oP '<a href="/details/\K(.*)(?=" title)' > link_list.txt

while read p; do
  echo "$p"
  links=""
  links=$(curl https://archive.org/details/"$p" 2>&1 | grep -oP 'href="\K(.*)_text.pdf(?=" title)')
  if [ -z "$links" ]; then echo "there is no *_text.pdf file. trying to download .pdf file"; curl https://archive.org/details/"$p" 2>&1 | grep -oP 'href="\K(.*).pdf(?=" title)' | wget "https://archive.org"{}; else wget "https://archive.org"$links; fi
done <link_list.txt
