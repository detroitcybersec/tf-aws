#!/bin/bash -eux
global_start=`date +%s`

# build Virtualbox ubuntu image
cd ./packer-ubuntu
source ./build_ubuntu1604-server.sh

# build Virtualbox beats image
cd ../packer-aws-beats
source ./build_packer_virtualbox.sh

# build Virtualbox webapp image
cd ../packer-aws-webapp
source ./build_packer_virtualbox.sh

# build Virtualbox java image
cd ../packer-aws-java
source ./build_packer_virtualbox.sh

# build Virtualbox ELK image
cd ../packer-aws-elk
source ./build_packer_virtualbox.sh

global_end=`date +%s`
secs=$((global_end-global_start))
printf 'runtime = %02dh:%02dm:%02ds\n' $(($secs/3600)) $(($secs%3600/60)) $(($secs%60))
