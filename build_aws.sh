#!/bin/bash -eux
global_start=`date +%s`

# build Virtualbox base image, BASE_AMI_ID
cd ../packer-aws-base
source ./build_packer_aws.sh

# build AWS webapp image, WEBAPP_AMI_ID
cd ../packer-aws-webapp
source ./build_packer_aws.sh

# build AWS java image, JAVA_AMI_ID
cd ../packer-aws-java
source ./build_packer_aws.sh

# build AWS elk image, ELK_AMI_ID
cd ../packer-aws-elk
source ./build_packer_aws.sh


global_end=`date +%s`
secs=$((global_end-global_start))
printf 'runtime = %02dh:%02dm:%02ds\n' $(($secs/3600)) $(($secs%3600/60)) $(($secs%60))
