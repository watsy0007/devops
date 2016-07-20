#!/bin/bash
apt-get update -y && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y 
curl -sSL https://get.daocloud.io/docker | sh
