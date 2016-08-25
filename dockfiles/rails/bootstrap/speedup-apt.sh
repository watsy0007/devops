#!/usr/bin/env bash
set -e

rm  -rf /etc/apt/sources.list /etc/apt/sources.list.d
cp -fb $(dirname $0)/conf/apt-sources.list /etc/apt/sources.list

echo ==updated /etc/apt/sources.list
