#!/bin/bash

DEVICE_ID="$(xcrun simctl list | grep Booted | awk -F '[()]' '{print $4}')"
DEVICE_PATH=~/Library/Developer/CoreSimulator/Devices/${DEVICE_ID}/data/Containers/

PROFILE_DB=$(find ${DEVICE_PATH} . -type d -name "profile.profile")
TEST_PROFILE_DB=$(find ${DEVICE_PATH} . -type d -name "profile.testProfile")
TEST_FIXTURES_DB=$(find ${DEVICE_PATH} . -type d -name "test-fixtures")


echo "-------------------------------"
echo "DEVICE ID"
echo "-------------------------------"

echo $DEVICE_ID

echo
echo "-------------------------------"
echo "DEVICE PATH"
echo "-------------------------------"

echo $DEVICE_PATH

echo
echo "-------------------------------"
echo "PROFILE_DB"
echo "-------------------------------"

echo $PROFILE_DB

echo
echo "-------------------------------"
echo "TEST_PROFILE_DB"
echo "-------------------------------"

echo $TEST_PROFILE_DB

echo
echo "-------------------------------"
echo "TEST_FIXTURES_DB"
echo "-------------------------------"

echo $TEST_FIXTURES_DB
