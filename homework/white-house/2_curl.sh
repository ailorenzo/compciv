for url in $(cat allurls)
do
	wholebriefing=$(echo $url | tr '/' '_')

	absolute="http://www.whitehouse.gov$url"

	curl -s $absolute > "wh-briefings/$wholebriefing"
done
