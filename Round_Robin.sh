#!/bin/bash

declare -a arrival_time
declare -a burst_time
declare -a remaining_time
declare -a completion_time
declare -a turnaround_time
declare -a waiting_time

echo "Enter number of processes: "
read n

echo "Enter Time Quantum: "
read tq

for ((i=0; i<n; i++)); do
    echo -n "Enter arrival time of P$((i+1)): "
    read arrival_time[i]
    echo -n "Enter burst time of P$((i+1)): "
    read burst_time[i]
    remaining_time[i]=${burst_time[i]}
done

Round_Robin() {
    local -n arrival_time=$1
    local -n burst_time=$2
    local -n remaining_time=$3
    local -n completion_time=$4
    local -n turnaround_time=$5
    local -n waiting_time=$6
    local n=$7
    local tq=$8

    local time=0
    local completed=0

    while [ $completed -lt $n ]; do
        local executed=0
        for ((i=0; i<n; i++)); do
            if [ ${remaining_time[i]} -gt 0 ] && [ ${arrival_time[i]} -le $time ]; then
                executed=1
                if [ ${remaining_time[i]} -gt $tq ]; then
                    time=$((time + tq))
                    remaining_time[i]=$((remaining_time[i] - tq))
                else
                    time=$((time + remaining_time[i]))
                    remaining_time[i]=0
                    completion_time[i]=$time
                    turnaround_time[i]=$((completion_time[i] - arrival_time[i]))
                    waiting_time[i]=$((turnaround_time[i] - burst_time[i]))
                    ((completed++))
                fi
            fi
        done

        if [ $executed -eq 0 ]; then
            ((time++))
        fi
    done
}

Round_Robin arrival_time burst_time remaining_time completion_time turnaround_time waiting_time $n $tq

echo "PID  AT  BT  CT  TAT  WT"
for ((i=0; i<n; i++)); do
    echo "P$((i+1))   ${arrival_time[i]}   ${burst_time[i]}   ${completion_time[i]}   ${turnaround_time[i]}   ${waiting_time[i]}"
done
