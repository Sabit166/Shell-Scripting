#!/bin/bash

declare -a arrival_time
declare -a burst_time
declare -a completion_time
declare -a turnaround_time
declare -a waiting_time
declare -a done

echo "Enter number of processes: "
read n

for ((i=0; i<n; i++)); do
    echo -n "Enter arrival time of P$((i+1)): "
    read arrival_time[i]
    echo -n "Enter burst time of P$((i+1)): "
    read burst_time[i]
    done[i]=0
done

time=0
for ((count=0; count<n; count++)); do
    min_bt=9999
    idx=-1
    for ((i=0; i<n; i++)); do
        if (( done[i]==0 && arrival_time[i]<=time && burst_time[i]<min_bt )); then
            min_bt=${burst_time[i]}
            idx=$i
        fi
    done

    if (( idx==-1 )); then
        ((time++))
        ((count--))
        continue
    fi

    time=$((time + burst_time[idx]))
    completion_time[idx]=$time
    turnaround_time[idx]=$((completion_time[idx]-arrival_time[idx]))
    waiting_time[idx]=$((turnaround_time[idx]-burst_time[idx]))
    done[idx]=1
done

echo "PID AT BT CT TAT WT"
for ((i=0; i<n; i++)); do
    echo "P$((i+1)) ${arrival_time[i]} ${burst_time[i]} ${completion_time[i]} ${turnaround_time[i]} ${waiting_time[i]}"
done
