#!/bin/bash


release_repo_entitlement=$1
launch_file_path=$2
package_file_path=$3

if [[ -n $package_file_path ]]; then
    apt install -y $package_file_path
fi

roslaunch $launch_file_path &

sleep 5  # wait for the system to boot

cat ~/.ros/log/latest/rosout.log | grep 'state: READY'