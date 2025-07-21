#!/bin/bash

declare -a arrival_time
declare -a burst_time
declare -a completion_time

# Read array elements
echo "Enter number of processes: "
read n

echo "Enter arrival times and burst times: "
for ((i=0; i<n; i++)); do
    echo -n "Enter element $((i+1)) of arrival time: "
    read arrival_time[i]

    echo -n "Enter element $((i+1)) of burst time: "
    read burst_time[i]
done


# Bubble sort function
bubble_sort() {
    local -n arr1=$1  # arrival_time array
    local -n arr2=$2  # burst_time array
    local n=${#arr1[@]}  # Get array length

    for ((i=0; i<n-1; i++)); do
        for ((j=0; j<n-i-1; j++)); do
            if (( arr1[j] > arr1[j+1] )); then
                # Swap elements of arrival time
                temp=${arr1[j]}
                arr1[j]=${arr1[j+1]}
                arr1[j+1]=$temp

                # Swap elements of burst time
                temp=${arr2[j]}
                arr2[j]=${arr2[j+1]}
                arr2[j+1]=$temp
            fi
        done
    done
}
# Call sorting function
bubble_sort arrival_time burst_time
#bubble_sort arrival_time

completion_time[0]=$((arrival_time[0] + burst_time[0]))

for ((i=1; i<n; i++)); do
    if (( arrival_time[i] > completion_time[i-1] )); then
        completion_time[i]=$((arrival_time[i] + burst_time[i]))
    else
        completion_time[i]=$((completion_time[i-1] + burst_time[i]))
    fi
done


# Output the sorted array
echo "Required Completion time: "
for ((i=0; i<n; i++)); do
    echo -n "${completion_time[i]} "
done
echo
