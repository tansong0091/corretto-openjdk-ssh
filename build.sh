#!/bin/bash

application_path=.
application_name=amazoncorretto-openjdk-ssh
application_version=$1
dockerfile_path=$PWD/Dockerfile
AWSACCOUNT=tansong0091
#export AWS_PROFILE=890961259456:user/Tansong

# validation
if [ -z "$application_version" ]; then
    echo 'A version is required.  Execute as build.sh <version>'
    exit 1
fi



#  execute build
docker build \
    --build-arg app_version=${application_version} \
    --file ${dockerfile_path} \
    --build-arg HTTP_PROXY="http://PITC-Zscaler-Americas-Cincinnati3PR.proxy.corporate.ge.com:80" \
    --build-arg HTTPS_PROXY="http://PITC-Zscaler-Americas-Cincinnati3PR.proxy.corporate.ge.com:80" \
    --tag ${application_name}:${application_version} \
    --tag ${AWSACCOUNT}/${application_name}:${application_version} \
    --tag ${application_name}:latest \
    --tag ${AWSACCOUNT}/${application_name}:latest \
    ${application_path} 

docker push ${AWSACCOUNT}/${application_name}:${application_version}
docker push ${AWSACCOUNT}/${application_name}:latest
