for x in $(bash tx-dr.sh)
do
	echo TX,$x
done


for x in $(bash fl-dr.sh | sed 's/W/White/' | sed 's/B/Black/' | sed 's/H/Hispanic/' | sed 's/O/Other/')
do
	echo FL,$x
done

 
for x in $(bash ca-dr.sh)
do
	echo CA,$x
done
