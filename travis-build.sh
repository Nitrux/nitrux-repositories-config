#!/bin/bash

apt -qq update
apt -qq -yy install equivs curl git

### Install Dependencies
apt-get -qq --yes update
apt-get -qq --yes dist-upgrade
apt-get -qq --yes install devscripts lintian build-essential automake autotools-dev
mk-build-deps -i -t "apt-get --yes" -r

### Build Deb
mkdir source
mv ./* source/ # Hack for debuild
cd source
debuild -b -uc -us