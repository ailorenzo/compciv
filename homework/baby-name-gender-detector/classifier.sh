if [[ $# -eq 0 ]]; then
	echo "Please pass in at least one name"
fi

for name in "$@"; do
datafile='data-hold/namesample.txt'
name_matches=$(cat $datafile | grep "$name,")
m_count=0
f_count=0
	for row in $name_matches; do
		babies=$(echo $row | cut -d ',' -f '3')
		if [[ $row =~ 'M,' ]];
		then
			m_count=$((m_count + babies))
		else
		  	f_count=$((f_count + babies))
		fi
	done


	total_babies=$((f_count + m_count))

	if [[ $total_babies -le 0 ]]; then
	  gender_and_pct="NA,0"
        else
  	  pct_female=$((100 * f_count / total_babies))
	  pct_male=$((100 * m_count / total_babies))
	
    	   if [[ $pct_female -ge 50 ]]; then
		gender_and_pct="F,$pct_female"
	   elif [[ $pct_male -gt 50 ]]; then
		gender_and_pct="M,$pct_male"
	   fi
        fi

	echo "$name,$gender_and_pct,$total_babies"
done
