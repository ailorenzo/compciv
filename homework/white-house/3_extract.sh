cat wh-briefings/* | grep -oE '>[^<]+' | tr '[:upper:]' '[:lower:]' | grep -oE '[[:alpha:]]{7,}' | sort | uniq -c | sort -r | head -n 10
