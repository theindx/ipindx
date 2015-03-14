tmp=$(mktemp -d)
wget $1 -O $tmp/log.txt
cat $tmp/log.txt | grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | uniq >> $tmp/ips.txt
while read ip; do
    con="$(grep $ip $tmp/log.txt)"
    IP=$ip CONTENTS="$con" erb ips.erb >> ips.cson
done <$tmp/ips.txt

