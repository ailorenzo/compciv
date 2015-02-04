curl -sSo data-hold/names.zip http://stash.compciv.org/ssa_baby_names/names.zip

unzip -p data-hold/names.zip yob1973.txt yob2013.txt | dos2unix > data-hold/namesample.txt
