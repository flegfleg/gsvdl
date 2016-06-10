#!/bin/bash
# Downloads tiles from Google Street View to sub-folder, stitches them to a panoramic image
# Props to http://www.newtonscannon.com/2014/01/26/capturing-spherical-scenes-from-google-streetview/
# 
# Usage: 
# Enter Street View in Browser
# Copy part of the url between 
# 
name=$1
currentDir=$(pwd)/$name
url='http://cbk0.google.com/cbk?output=tile&panoid='$1'&zoom=5&x=[00-25]&y=[00-12]'
tile='tile_y#2-x#1.jpg'
echo "CREATE DIRECTORY:"$currentDir
mkdir -p "$currentDir"
echo "DOWNLOADING"
curl $url -o "$currentDir/$tile"
echo "CREATING PANORAMA"
gm montage +frame +shadow -tile 26x13 -geometry 400x400+0+0 "$currentDir/tile_*.jpg" "$currentDir.jpg"