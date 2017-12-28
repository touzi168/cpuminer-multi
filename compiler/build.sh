#!/bin/bash
piphost=$(cat /etc/hosts | grep pip.ngaf.sangfor.org | awk '{print $2":"$1}')
yumhost=$(cat /etc/hosts | grep yum.ngaf.sangfor.org | awk '{print $2":"$1}')
docker build --add-host=$yumhost --add-host=$piphost -t miner-compiler .
