#!/bin/bash

# This purpose of this script is to create easy access
# to Firefox iOS databases so they can be pre-populated 
# with dummy data for testing

# Does the following:

# 1. Look for a "Booted" iOS simulator device
# 2. Identify the Firefox iOS DB paths
# #. Open a Finder window to each

DEVICE_ID="$(xcrun simctl list | grep Booted | awk -F '[()]' '{print $4}')";

echo
echo
if [ -z "$DEVICE_ID" ]; then
    echo "-------------------------------"
    echo "ERROR"
    echo "-------------------------------"
    echo "No booted device found. Aborting!"
    echo
    echo
    exit 0
fi

DEVICE_PATH=~/Library/Developer/CoreSimulator/Devices/${DEVICE_ID}/data/Containers/

PATH_PROFILE_DB=$(find ${DEVICE_PATH} . -type d -name "profile.profile")
PATH_TEST_PROFILE_DB=$(find ${DEVICE_PATH} . -type d -name "profile.testProfile")
PATH_TEST_FIXTURES_DB=$(find ${DEVICE_PATH} . -type d -name "test-fixtures")


echo
echo "-------------------------------"
echo "PATH_PROFILE_DB"
echo "-------------------------------"

echo $PATH_PROFILE_DB
open $PATH_PROFILE_DB

echo
echo "-------------------------------"
echo "PATH_TEST_PROFILE_DB"
echo "-------------------------------"

echo $PATH_TEST_PROFILE_DB
open $PATH_TEST_PROFILE_DB

echo
echo "-------------------------------"
echo "PATH_TEST_FIXTURES_DB"
echo "-------------------------------"

echo $PATH_TEST_FIXTURES_DB
open $PATH_TEST_FIXTURES_DB
open .

echo
echo "-------------------------------"
echo "COPY profile.profile/browser.db"
echo "-------------------------------"

cp ${PATH_PROFILE_DB}/browser.db .
ls -la browser.db
echo
echo
