cat data-hold/florida-death-row-roster | pup 'td:nth-of-type(3) text{}' | grep -v 'Race/ Gender'| grep [[:alpha:]] | cut -c1 | sort

cat data-hold/florida-execution-list-1924-1964 | pup 'td:nth-of-type(3) text{}' | cut -c1 | sort

cat data-hold/florida-execution-list-1976-present | pup 'td:nth-of-type(3) text{}' | tr -d ' ' | cut -c1 | sort

