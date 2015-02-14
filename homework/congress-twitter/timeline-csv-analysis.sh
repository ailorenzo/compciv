username=$1
echo "Fetching tweets for $username into ./data-hold/$username-timeline.csv"
t timeline -n 3200 --csv $username > data-hold/$username-timeline.csv
file=data-hold/$username-timeline.csv
count=$(csvfix order -f 1 $file | wc -l)
lastdate=$(csvfix order -fn 'Posted at' $file | tail -n 1)
echo "Analyzing $count tweets by $1 since $lastdate"


hashtags=$(cat $file | grep -oE '#[[:alnum:]]+' | tr '[:upper:]' '[:lower:]' | sort | uniq -c | sort -rn | head -n 10)
echo "Top 10 hashtags by $username
$hashtags"

retweeted=$(cat $file | tr '[:upper:]' '[:lower:]' | grep -oE 'rt @[[:alnum:]_]+' | sort | uniq -c | sort -rn | head -n 10)
echo "Top 10 retweeted users by $username
$retweeted"

mentioned=$(cat $file | grep -v 'RT @' | tr '[:upper:]' '[:lower:]' | grep -oE '@[[:alnum:]_]+' | grep -v '@darrellissa' | sort | uniq -c | sort -rn | head -n 10)
echo "Top 10 mentioned users (not including retweets) by $username
$mentioned"

words=$(cat $file | tr '[:upper:]' '[:lower:]' | grep -oE ' [[:alpha:]]{5,}'| sort | uniq -c | sort -rn | head -n 10) 
echo "Top tweeted 10 words with 5+ letters by $username
$words"
