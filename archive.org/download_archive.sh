
 
 
 https://archive.org/download/kitab-i-gazat-der-mulk-i-cin-molla-bilal-nazimi/Kit%C3%A2b-%C4%B1%20Gaz%C3%A2t%20der%20M%C3%BClk-i%20%C3%87in.pdf
 
wget "https://archive.org/details/%40hassaan_khan?&sort=-publicdate&page=1" -O 
 
grep -P -o '/details/\K.*(?=" title)' @hassaan_khan


grep -P -o '<td><a href=\K.*(.pdf")' kitab-i-gazat-der-mulk-i-cin-molla-bilal-nazimi


wget  "https://archive.org/download/kitab-i-gazat-der-mulk-i-cin-molla-bilal-nazimi/Kit%C3%A2b-%C4%B1%20Gaz%C3%A2t%20der%20M%C3%BClk-i%20%C3%87in.pdf

COUNTER=0
while [  $COUNTER -lt 50 ]; do
    let COUNTER=COUNTER+1
    wget "https://archive.org/details/%40hassaan_khan?&sort=-publicdate&page=$COUNTER" -O $COUNTER
    grep -P -o '/details/\K.*(?=" title)' $COUNTER > $COUNTER"_filt"
    rm $COUNTER
    while read p; do
        wget "https://archive.org/details/"$p -O $p
        grep -P -o 'href="\K.*(?=.pdf")' $p | sort | uniq > $p"_link"
        rm $p
        while read q; do
            wget "https://archive.org"$q".pdf"
        done <$p"_link"
        rm $p"_link"
    done <$COUNTER"_filt"
    rm $COUNTER"_filt"
done

COUNTER=0
while [  $COUNTER -lt 50 ]; do
    let COUNTER=COUNTER+1
    wget "https://archive.org/details/%40hassaan_khan?&sort=-publicdate&page=$COUNTER" -O $COUNTER
done


COUNTER=0
while [  $COUNTER -lt 50 ]; do
    let COUNTER=COUNTER+1
    grep -P -o '/details/\K.*(?=" title)' $COUNTER > $COUNTER"_filt"
    rm $COUNTER
    while read p; do
        wget "https://archive.org/details/"$p -O $p
        grep -P -o 'href="\K.*(?=.pdf")' $p | sort | uniq > $p"_link"
        rm $p
        while read q; do
            wget "https://archive.org"$q".pdf"
        done <$p"_link"
        rm $p"_link"
    done <$COUNTER"_filt"
    rm $COUNTER"_filt"
done


