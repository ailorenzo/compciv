cat data-hold/CA.txt | sed 's/HIS/Hispanic1/' | sed 's/WHI/White1/' | sed 's/BLA/Black1/' | sed 's/OTH/Other1/' | grep -oE ' [[:upper:]][[:lower:]]{4,}1' | tr -d '1' | tr -d ' ' | sort
