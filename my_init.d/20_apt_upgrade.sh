#!/bin/bash

# test if we need to run the update scripts
[ "$ADVANCED_DISABLEUPDATES" ] && exit 0
[ "$BASE_APTLIST" ] && APTLIST="$BASE_APTLIST ""$APTLIST"
[ "$APTLIST" ] || exit 0

# check for and install any updates
echo "We are now refreshing packages from apt repositories, this *may* take a while"
apt-get update -qq
apt-get --only-upgrade install -yqq $APTLIST

