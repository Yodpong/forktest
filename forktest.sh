#!/bin/bash
#ulimit -n 8096

echo "forktest pid:$$"
FORKLIMIT=${1:-1000}

dosomething() {
  n=1
  while (($n<2))
  do
    #echo "$n pid: $BASHPID" > /dev/null
    sleep 30
    #echo "$(date) fork $BASHPID" >> /tmp/forktest.log
    n=$(( n+1 ))

  done
}

dofork() {
  count=0
  while (($count<=$FORKLIMIT))
  do
    dosomething &
    count=$((count+1))
    #echo "$(date) fork $count" >> /tmp/forktest.log
    xx=$((count%1000))
    if [ $xx -eq 0 ] ;then
      echo "$(date) fork $count"
    fi
  done

}


dofork
