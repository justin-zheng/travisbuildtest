#!/bin/bash

#
#   Builds Unity home window in 'dist' folder

echo === Prepare deployment folder ===
#UNITY_DIR=/tmp/unity
#mkdir $UNITY_DIR

echo "Download unity package list"

curl -X GET 'https://core.cloud.unity3d.com/api/login' -v

echo

ifconfig

echo

curl -o Unity.pkg "http://netstorage.unity3d.com/unity/fdbb5133b820/MacEditorInstaller/Unity-5.3.4f1.pkg"
#curl -o Unity.pkg "http://beta.unity3d.com/download/90500643c620/MacEditorInstaller/Unity-5.4.0b13.pkg"
echo === Installing Unity Editor ===

sudo installer -dumplog -package Unity.pkg -target /

echo "Verify firewall"
/usr/libexec/ApplicationFirewall/socketfilterfw --getappblocked /Applications/Unity/Unity.app/Contents/MacOS/Unity

echo "Create Certificate Folder"
mkdir ~/Library/Unity
mkdir ~/Library/Unity/Certificates

cp CACerts.pem ~/Library/Unity/Certificates/

echo "activate license"
/Applications/Unity/Unity.app/Contents/MacOS/Unity -quit -batchmode -serial I3-GKE5-PKF4-2F84-2CMS-PTD5 -username justinz@unity3d.com -password '1Newpassword' -logfile

cat ~/Library/Logs/Unity/Editor.log

echo

#echo "activate license"
#/Applications/Unity/Unity.app/Contents/MacOS/Unity -quit -batchmode -serial I3-GKE5-PKF4-2F84-2CMS-PTD5 -username justinz@unity3d.com -password '1Newpassword' -logfile


echo "return license"

/Applications/Unity/Unity.app/Contents/MacOS/Unity -quit -batchmode -returnlicense -logfile

echo === Done ===


