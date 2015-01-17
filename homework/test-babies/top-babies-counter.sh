for list in $(ls data-hold/*.TXT)
do
	cat $list | sort -t "," -k 5 -n -r | head -n 1
done
