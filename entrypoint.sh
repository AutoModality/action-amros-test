#!/bin/bash

set -e # fail on error

launch_file_path=$1
package_file_path=$2


if [[ -z $launch_file_path ]];then
    echo provide the path, on the container, to the launch file you wish to run
    exit 2
fi

if [[ -n $package_file_path ]]; then
    apt install -y $package_file_path
else
    echo WARNING: no package is being installed to test
fi

source /opt/ros/kinetic/setup.bash

roslaunch $launch_file_path &

sleep 5  # wait for the system to boot

cat ~/.ros/log/latest/rosout.log | grep 'state: READY'