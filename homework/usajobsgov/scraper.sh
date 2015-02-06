base_url="https://data.usajobs.gov/api/jobs?NumberOfJobs=250"

d=$(date +%Y-%m-%d-%H00)
dir="data-hold/scrapes/$d"
mkdir -p $dir

series_num=$(cat data-hold/OccupationalSeries.xml | hxselect -c -s'\n' '#OccupationSeriesFamily JobFamily')


for s in $series_num; do 
  
  curl -s "$base_url&series=$s" -o $dir/$s-1.json
  num_pages=$(cat $dir/$s-1.json | jq -r '.Pages')
  
  for p in $(seq 2 $num_pages); do
    echo "Series: $s Page Number: $p"
    curl -s "$base_url&series=$s&Page=$p" -o $dir/$s-$p.json
  done
done
