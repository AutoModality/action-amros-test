#!/bin/bash

set -e # fail on error

launch_file_path=$1
package_file_path=$2

if [[ -z $release_repo_entitlement ]];then
    echo cloudsmith release repo entitlement is required
    exit 1
fi

echo $release_repo_entitlement | docker login --password-stdin --username cloudsmith-read@automodality.com  docker.cloudsmith.io

if [[ -z $launch_file_path ]];then
    echo provide the path, on the container, to the launch file you wish to run
    exit 2
fi

if [[ -n $package_file_path ]]; then
    apt install -y $package_file_path
else
    echo WARNING: no package is being installed to test
fi

roslaunch $launch_file_path &

sleep 5  # wait for the system to boot

cat ~/.ros/log/latest/rosout.log | grep 'state: READY'