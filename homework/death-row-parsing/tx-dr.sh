cat data-hold/texas-list-of-all-offenders-on-death-row-1923-1973 | pup 'td:nth-of-type(4) text{}' | sort | sed 's/Native    American/Native American/'

cat data-hold/texas-offenders-on-death-row | pup 'td:nth-of-type(7) text{}' | sort
