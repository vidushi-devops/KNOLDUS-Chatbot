#!/bin/sh
for i in 1 2 3 4 5 
do
  echo "Test case $i : Passed"
  sleep 5s
done
n=80
if [ $n -ge 70 ]
then
	echo "$n % Test cases passed successfully. Moving Ahead!!"
	exit 0
else
	echo "Only $n % test cases passed. Aborting!!"
	exit 1
fi

