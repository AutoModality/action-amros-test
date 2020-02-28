#!/bin/bash

set -e # fail on error

release_repo_entitlement=$1
launch_file_path=$2
package_file_path=$3

echo $push_api_key | docker login --username cloudsmith-push@automodality.com --password-stdin $docker_server


docker run docker.cloudsmith.io/automodality/release/amros-kinetic:latest /amros-test.sh $launch_file_path $package_file_path
