#!/bin/bash

declare -a arrival_time
declare -a burst_time
declare -a remaining_time
declare -a completion_time
declare -a turnaround_time
declare -a waiting_time

echo "Enter number of processes: "
read n

for ((i=0; i<n; i++)); do
    echo -n "Enter arrival time of P$((i+1)): "
    read arrival_time[i]
    echo -n "Enter burst time of P$((i+1)): "
    read burst_time[i]
    remaining_time[i]=${burst_time[i]}
done

time=0
completed=0
while ((completed < n)); do
    min_rt=9999
    idx=-1
    for ((i=0; i<n; i++)); do
        if (( arrival_time[i]<=time && remaining_time[i]>0 && remaining_time[i]<min_rt )); then
            min_rt=${remaining_time[i]}
            idx=$i
        fi
    done

    if (( idx==-1 )); then
        ((time++))
        continue
    fi

    ((remaining_time[idx]--))
    ((time++))

    if (( remaining_time[idx]==0 )); then
        completion_time[idx]=$time
        turnaround_time[idx]=$((completion_time[idx]-arrival_time[idx]))
        waiting_time[idx]=$((turnaround_time[idx]-burst_time[idx]))
        ((completed++))
    fi
done

echo "PID AT BT CT TAT WT"
for ((i=0; i<n; i++)); do
    echo "P$((i+1)) ${arrival_time[i]} ${burst_time[i]} ${completion_time[i]} ${turnaround_time[i]} ${waiting_time[i]}"
done
