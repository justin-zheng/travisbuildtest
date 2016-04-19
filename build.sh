#!/bin/bash

#
#   Builds Unity home window in 'dist' folder

echo === Prepare deployment folder ===
#UNITY_DIR=/tmp/unity
#mkdir $UNITY_DIR

echo "Download unity package list"

curl -o Unity.pkg "http://netstorage.unity3d.com/unity/fdbb5133b820/MacEditorInstaller/Unity-5.3.4f1.pkg"
echo === Installing Unity Editor ===

installer -dumplog -package Unity.pkg -target /


echo "activate license"
Unity.app/Contents/MacOS/Unity -quit -batchmode -serial I3-GKE5-PKF4-2F84-2CMS-PTD5 -username justinz@unity3d.com -password '1Newpassword' -logfile

echo "return license"

Unity.app/Contents/MacOS/Unity -quit -batchmode -returnlicense -logfile

echo === Done ===


