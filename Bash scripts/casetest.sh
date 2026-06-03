#! /bin/bash

echo "vælg et nummer"
echo "1) grøn"
echo "2) blå"
echo "3) gul"
echo "4) sort"
echo "s) vil du stoppe scripttet"
read farve
case $farve in 
1) echo "Du har valgt grøn" ;;
2) echo "Du har valgt blå" ;;
3) echo "Du har valgt gul" ;;
4) echo "Du har valgt sort" ;;
s) exit ;; 
*) echo "forkert" ;; 
esac 
echo
./casetest.sh
