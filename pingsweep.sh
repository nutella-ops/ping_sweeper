echo "" > /tmp/down_hosts /tmp/up_hosts
touch /tmp/down_hosts /tmp/up_hosts
echo "#### Down Hosts ####" > /dev/null > /tmp/down_hosts
echo "#### Up Hosts ####" > /dev/null > /tmp/up_hosts

echo "which subnet to scan?: "
read sub

for ip in $(seq 1 255); 

do echo "Scanning $sub.$ip/24...";

ping -c 1 $sub.$ip | egrep "1 received" -B1 | egrep -o "(([0-9]{3})\.([0-9]{3})\.([0-9])\.([0-9]{1,3}))" && echo "$sub.$ip is UP" > /dev/null >> /tmp/up_hosts || echo "$sub.$ip is DOWN :(" > /dev/null >> /tmp/down_hosts; 

done

cat /tmp/down_hosts /tmp/up_hosts
