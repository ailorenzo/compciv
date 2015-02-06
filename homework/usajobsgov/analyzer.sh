jobs_paid_annually=$(cat data-hold/scrapes/2015-02-05-1600/*.json | jq '. .JobData[] | select(.SalaryBasis == "Per Year")')
basic_info=$(echo $jobs_paid_annually | jq '. | {JobTitle, SalaryMin, SalaryMax}')


while read line; do
  title=$(echo $line | grep -oE '[[:alpha:]].+')
  filtered_rows=$(echo $basic_info | jq "select(.JobTitle == \"$title\")" )
  min=$(echo $filtered_rows | jq -r '.SalaryMin' | tr -d '$' | tr -d ',' | sort -n | head -n 1)
  max=$(echo $filtered_rows | jq -r '.SalaryMax' | tr -d '$' | tr -d ',' | sort -n | tail -n 1)
 echo "$title|$min|$max"
done < <(echo $jobs_paid_annually | jq -r '.JobTitle'| sort | uniq -c | sort -rn | head -n 25)
