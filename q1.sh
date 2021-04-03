#!/bin/bash
filepath=/apps/shell/carta/nginx.log
for i in $(awk '{print $1}' $filepath | uniq)
do 
count=`awk '{print $1}' $filepath | grep $i | wc -l`
echo "Address $i was encountered $count time(s)"
done
echo "--------------------------------------------------"
a=`awk '{print $1}' $filepath | grep 108.162.* | sort | uniq -c | wc -l`
b=`awk '{print $1}' $filepath | grep 212.129.32.223 | sort | uniq -c | wc -l`
c=`awk '{print $1}' $filepath | grep 173.245.56.* | sort | uniq -c | wc -l`
echo "The bucket 108.162.0.0/16 contains $a addresses"
echo "The bucket 212.129.32.223/32 contains $b addresses"
echo "The bucket 173.245.56.0/23 contains $c addresses"
